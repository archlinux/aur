# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Toolybird <toolybird at tuta dot io>

pkgbase=godot-double
pkgname=(godot-double godot-double-mono)
pkgver=4.7.2
pkgrel=1
pkgdesc='Advanced cross-platform 2D and 3D game engine (double-precision build)'
url='https://godotengine.org/'
license=(MIT)
arch=(x86_64)
options=(!lto)
makedepends=(alsa-lib dotnet-sdk git nuget pulse-native-provider scons setconf yasm)
depends=(brotli ca-certificates embree freetype2 graphite libglvnd libspeechd libsquish libtheora libvorbis
         libwebp libwslay libxcursor libxi libxinerama libxrandr miniupnpc openxr pcre2)
optdepends=('pipewire-alsa: for audio support'
            'pulse-native-provider: for audio support')
source=("godot::git+https://github.com/godotengine/godot#tag=$pkgver-stable")
b2sums=('919de6e3b42dc774e1b706b6485ed19965164c650df0640df5c2665a7f9f538f5ead5bc0925331fe2d91cfca0efce3a250cf8db5a47cbb482422a2472f996ef1')


prepare() {
  cd godot

  # Patch for miniupnpc
  sed -i 's/addr, 16/addr, 16, nullptr, 0/g' modules/upnp/upnp.cpp

  cd misc/dist/linux

  cp -f org.godotengine.Godot.desktop org.godotengine.Godot-Double.desktop
  setconf org.godotengine.Godot-Double.desktop Exec godot-double
  setconf org.godotengine.Godot-Double.desktop Icon godot-double.svg
  setconf org.godotengine.Godot-Double.desktop Name 'Godot Engine (Double Precision)'

  sed -i 's,xmlns="https://specifications.freedesktop.org/shared-mime-info-spec",xmlns="http://www.freedesktop.org/standards/shared-mime-info",g' \
    org.godotengine.Godot.xml
  cp -f org.godotengine.Godot.xml org.godotengine.Godot-Double.xml

  cp -f org.godotengine.Godot.desktop org.godotengine.Godot-Double-mono.desktop
  setconf org.godotengine.Godot-Double-mono.desktop Exec godot-double-mono
  setconf org.godotengine.Godot-Double-mono.desktop Icon godot-double-mono.svg
  setconf org.godotengine.Godot-Double-mono.desktop Name 'Godot Engine Mono (Double Precision)'

  cp -f org.godotengine.Godot.xml org.godotengine.Godot-Double-mono.xml
}

case $CARCH in
  x86_64*) _CARCH=x86_64;;
  aarch64) _CARCH=arm64;;
esac

build() {
  cd godot

  export BUILD_NAME=arch_linux

  # Not unbundled (yet):
  #  mbedtls
  #  enet (contains no upstreamed IPv6 support)
  #  AUR: libwebm, rvo2
  #  recastnavigation, xatlas

  _args=(
    -j"${GDOPS_SCONS_JOBS:-$(nproc --all)}"
    cflags="$CFLAGS -fPIC -Wl,-z,relro,-z,now -w"
    cxxflags="$CXXFLAGS -fPIC -Wl,-z,relro,-z,now -w"
    linkflags="$LDFLAGS"
    arch=$_CARCH
    builtin_brotli=no
    builtin_certs=no
    builtin_clipper2=yes
    builtin_embree=no
    builtin_enet=yes
    builtin_freetype=no
    builtin_glslang=yes
    builtin_graphite=no
    builtin_harfbuzz=yes
    builtin_icu4c=yes
    builtin_libogg=no
    builtin_libpng=no
    builtin_libtheora=no
    builtin_libvorbis=no
    builtin_libwebp=no
    builtin_mbedtls=yes
    builtin_miniupnpc=no
    builtin_msdfgen=yes
    builtin_openxr=no
    builtin_pcre2=no
    builtin_pcre2_with_jit=no
    builtin_recastnavigation=yes
    builtin_rvo2_2d=yes
    builtin_rvo2_3d=yes
    builtin_squish=no
    builtin_wslay=yes
    builtin_xatlas=yes
    builtin_zlib=no
    builtin_zstd=no
    colored=yes
    debug_symbols=yes
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

  # Regular build
  scons "${_args[@]}"

  # Mono build
  _args+=(module_mono_enabled=yes mono_glue=no)
  scons "${_args[@]}"

  bin/godot.linuxbsd.editor.double.$_CARCH.mono --headless --generate-mono-glue modules/mono/glue
  modules/mono/build_scripts/build_assemblies.py --godot-output-dir=./bin --godot-platform=linuxbsd --precision=double
}

package_godot-double() {
  cd godot

  install -Dm755 bin/godot.linuxbsd.editor.double.$_CARCH "$pkgdir/usr/bin/godot-double"

  install -Dm644 misc/logo/icon.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 misc/dist/linux/org.godotengine.Godot-Double.desktop "$pkgdir/usr/share/applications/org.godotengine.Godot-Double.desktop"
  install -Dm644 misc/dist/linux/org.godotengine.Godot-Double.xml "$pkgdir/usr/share/mime/packages/org.godotengine.Godot-Double.xml"

  install -Dm644 misc/dist/linux/godot.6 "$pkgdir/usr/share/man/man6/$pkgname.6"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_godot-double-mono() {
  depends+=(dotnet-sdk-8.0)

  cd godot

  install -Dm755 bin/godot.linuxbsd.editor.double.$_CARCH.mono "$pkgdir/usr/lib/$pkgname/godot.linuxbsd.editor.double.$_CARCH.mono"

  cp -a bin/GodotSharp "$pkgdir/usr/lib/$pkgname/"
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/$pkgname/godot.linuxbsd.editor.double.$_CARCH.mono "$pkgdir/usr/bin/$pkgname"

  install -Dm644 misc/logo/icon.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 misc/dist/linux/org.godotengine.Godot-Double-mono.desktop "$pkgdir/usr/share/applications/org.godotengine.Godot-Double-mono.desktop"
  install -Dm644 misc/dist/linux/org.godotengine.Godot-Double-mono.xml "$pkgdir/usr/share/mime/packages/org.godotengine.Godot-Double-mono.xml"

  install -Dm644 misc/dist/linux/godot.6 "$pkgdir/usr/share/man/man6/$pkgname.6"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
