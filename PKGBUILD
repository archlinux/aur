# Maintainer: Joseph Dalrymple <joseph.dalrymple@bluelogicteam.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Toolybird <toolybird at tuta dot io>

pkgbase=godot-double
pkgname=(godot-double godot-double-mono)
pkgver=4.4.1
pkgrel=1
pkgdesc='Advanced cross-platform 2D and 3D game engine (double-precision build)'
url='https://godotengine.org/'
license=(MIT)
arch=(x86_64)
provides=("godot-double=${pkgver}" "godot-double-mono=${pkgver}")
makedepends=(
  alsa-lib
  dotnet-sdk
  nuget
  pulse-native-provider
  scons
  setconf
  yasm
)
depends=(
  brotli
  ca-certificates
  embree
  freetype2
  graphite
  harfbuzz
  harfbuzz-icu
  libglvnd
  libspeechd
  libsquish
  libtheora
  libvorbis
  libwebp
  libwslay
  libxcursor
  libxi
  libxinerama
  libxrandr
  miniupnpc
  openxr
  pcre2
)
optdepends=(
  'pipewire-alsa: for audio support'
  'pulse-native-provider: for audio support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/godotengine/godot/archive/$pkgver-stable.tar.gz")
b2sums=('9ceacb4e7a2448377b7d29d81e36e198a9ca055673a46abf4d65be1d16c91ec7ed3d8841af272c0d348d5ee7a3104344a669d6793f9beb5c69ea008626c81511')

prepare() {
  cd "godot-$pkgver-stable"

  # Patch for miniupnpc
  sed -i 's/addr, 16/addr, 16, nullptr, 0/g' modules/upnp/upnp.cpp

  cd misc/dist/linux

  # 1) Create a desktop file for the non-Mono double build
  cp org.godotengine.Godot.desktop org.godotengine.Godot-Double.desktop
  setconf org.godotengine.Godot-Double.desktop Exec godot-double
  setconf org.godotengine.Godot-Double.desktop Name 'Godot Engine (Double Precision)'
  setconf org.godotengine.Godot-Double.desktop Icon godot-double

  # 2) Fix MIME info, then duplicate for the non-Mono double build
  sed -i 's,xmlns="https://specifications.freedesktop.org/shared-mime-info-spec",xmlns="http://www.freedesktop.org/standards/shared-mime-info",g' \
    org.godotengine.Godot.xml
  cp org.godotengine.Godot.xml org.godotengine.Godot-Double.xml

  # 3) Create a desktop file for the Mono double build
  cp org.godotengine.Godot.desktop org.godotengine.Godot-Double-mono.desktop
  setconf org.godotengine.Godot-Double-mono.desktop Exec godot-double-mono
  setconf org.godotengine.Godot-Double-mono.desktop Name 'Godot Engine Mono (Double Precision)'
  setconf org.godotengine.Godot-Double-mono.desktop Icon godot-double-mono

  # 4) Duplicate MIME XML for the Mono double build
  cp org.godotengine.Godot.xml org.godotengine.Godot-Double-mono.xml
}

build() {
  cd "godot-$pkgver-stable"

  export BUILD_NAME=arch_linux

  _args=(
    -j"$(nproc --all)"
    cflags="$CFLAGS -fPIC -Wl,-z,relro,-z,now -w"
    cxxflags="$CXXFLAGS -fPIC -Wl,-z,relro,-z,now -w"
    linkflags="$LDFLAGS"
    arch="$CARCH"
    builtin_brotli=no
    builtin_certs=no
    builtin_clipper2=yes
    builtin_embree=no
    builtin_enet=yes
    builtin_freetype=no
    builtin_msdfgen=yes
    builtin_glslang=yes
    builtin_graphite=no
    builtin_harfbuzz=no
    builtin_icu4c=yes
    builtin_libogg=no
    builtin_libpng=no
    builtin_libtheora=no
    builtin_libvorbis=no
    builtin_libwebp=no
    builtin_wslay=yes
    builtin_mbedtls=yes
    builtin_miniupnpc=no
    builtin_openxr=no
    builtin_pcre2=no
    builtin_pcre2_with_jit=no
    builtin_recastnavigation=yes
    builtin_rvo2_2d=yes
    builtin_rvo2_3d=yes
    builtin_squish=no
    builtin_xatlas=yes
    builtin_zlib=no
    builtin_zstd=no
    colored=yes
    disable_exceptions=false
    platform=linuxbsd
    production=yes
    pulseaudio=yes
    precision=double
    system_certs_path=/etc/ssl/certs/ca-certificates.crt
    target=editor
    use_llvm=no
    werror=no
  )

  # 1) Build non-Mono editor (double-precision)
  scons "${_args[@]}"

  # 2) Build Mono editor (double-precision)
  _args+=(module_mono_enabled=yes mono_glue=no)
  scons "${_args[@]}"

  # Generate Mono glue using the double-precision Mono binary
  bin/godot.linuxbsd.editor.double.$CARCH.mono --headless --generate-mono-glue modules/mono/glue

  # Build Mono assemblies (double-precision)
  modules/mono/build_scripts/build_assemblies.py \
    --godot-output-dir=./bin \
    --godot-platform=linuxbsd \
    --precision=double
}

package_godot-double() {
  cd "godot-$pkgver-stable"

  # 1) Install the non-Mono double editor binary as /usr/bin/godot-double
  install -Dm755 \
    "bin/godot.linuxbsd.editor.double.$CARCH" \
    "$pkgdir/usr/bin/$pkgname"

  # 2) Install its icon (godot-double.svg)
  install -Dm644 icon.svg \
    "$pkgdir/usr/share/pixmaps/$pkgname.svg"

  # 3) Install its desktop file
  install -Dm644 misc/dist/linux/org.godotengine.Godot-Double.desktop \
    "$pkgdir/usr/share/applications/org.godotengine.Godot-Double.desktop"

  # 4) Install its MIME XML
  install -Dm644 misc/dist/linux/org.godotengine.Godot-Double.xml \
    "$pkgdir/usr/share/mime/packages/org.godotengine.Godot-Double.xml"

  # 5) Manpage (renamed to godot-double.6)
  install -Dm644 misc/dist/linux/godot.6 \
    "$pkgdir/usr/share/man/man6/$pkgname.6"

  # 6) License
  install -Dm644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_godot-double-mono() {
  # Declare runtime dependency on dotnet-sdk
  depends+=(dotnet-sdk)

  cd "godot-$pkgver-stable"

  # 1) Create directory for the Mono-enabled binary
  install -d "$pkgdir/usr/lib/$pkgname"

  # 2) Install the double-precision Mono binary under /usr/lib/godot-double-mono/
  install -Dm755 \
    "bin/godot.linuxbsd.editor.double.$CARCH.mono" \
    "$pkgdir/usr/lib/$pkgname/godot.linuxbsd.editor.double.$CARCH.mono"

  # 3) Copy the generated C# assemblies
  cp -a bin/GodotSharp "$pkgdir/usr/lib/$pkgname/"

  # 4) Symlink the executable to /usr/bin/godot-double-mono
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/godot.linuxbsd.editor.double.$CARCH.mono" \
        "$pkgdir/usr/bin/$pkgname"

  # 5) Install its icon (godot-double-mono.svg)
  install -Dm644 icon.svg \
    "$pkgdir/usr/share/pixmaps/$pkgname.svg"

  # 6) Install its desktop file
  install -Dm644 misc/dist/linux/org.godotengine.Godot-Double-mono.desktop \
    "$pkgdir/usr/share/applications/org.godotengine.Godot-Double-mono.desktop"

  # 7) Install its MIME XML
  install -Dm644 misc/dist/linux/org.godotengine.Godot-Double-mono.xml \
    "$pkgdir/usr/share/mime/packages/org.godotengine.Godot-Double-mono.xml"

  # 8) Manpage (renamed to godot-double-mono.6)
  install -Dm644 misc/dist/linux/godot.6 \
    "$pkgdir/usr/share/man/man6/$pkgname.6"

  # 9) License
  install -Dm644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

