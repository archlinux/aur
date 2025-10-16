# Maintainer: LinuxLover471
# Based on: godot (Arch Linux official package)

_pkgname=godot
pkgname=${_pkgname}32
pkgver=4.5.1
pkgrel=1
pkgdesc='Advanced cross-platform 2D and 3D game engine (32-bit)'
url='https://godotengine.org/'
license=(MIT)
arch=(x86_64)
makedepends=(
  alsa-lib
  pulse-native-provider
  scons
  mold
  setconf
  yasm
)
depends=(
  lib32-brotli
  lib32-freetype2
  lib32-libglvnd
  lib32-libtheora
  lib32-libvorbis
  lib32-libwebp
  lib32-libxcursor
  lib32-libxi
  lib32-libxinerama
  lib32-libxrandr
  lib32-pcre2
)
optdepends=(
  'pipewire-alsa: for audio support'
  'pulse-native-provider: for audio support'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/godotengine/godot/archive/$pkgver-stable.tar.gz")
b2sums=('657f675ebb39a97dd7ec1102b3650ee5a91feb9115634ee964efffcac01d957f9471e78f0169dae20d1c1cd58b99aad31c673ac5c4ed602a6c45266a581b05e0')

prepare() {
  cd "$_pkgname-$pkgver-stable"

  # Patch for miniupnpc
  sed -i 's/addr, 16/addr, 16, nullptr, 0/g' modules/upnp/upnp.cpp

  cd misc/dist/linux

  # Fix the MIME info, ref FS#77810
  sed -i 's,xmlns="https://specifications.freedesktop.org/shared-mime-info-spec",xmlns="http://www.freedesktop.org/standards/shared-mime-info",g' \
    org.godotengine.Godot.xml
}

build() {
  cd "$_pkgname-$pkgver-stable"

  export BUILD_NAME=arch_linux

  export _godot_arch=x86_32 # Explicitly set 32-bit build.

  # Not unbundled (yet):
  #  mbedtls
  #  enet (contains no upstreamed IPv6 support)
  #  AUR: libwebm, rvo2
  #  recastnavigation, xatlas

  _args=(
    -j$(nproc --all)
    cflags="$CFLAGS -fPIC -Wl,-z,relro,-z,now -w"
    cxxflags="$CXXFLAGS -fPIC -Wl,-z,relro,-z,now -w"
    linkflags="$LDFLAGS"
    arch=$_godot_arch
    bits=32     # Ensure 32-bit binary.
    linker=mold # Use mold for faster linking.
    builtin_brotli=no
    builtin_certs=yes # lib32-ca-certificates isn't available.
    builtin_clipper2=yes
    builtin_embree=yes # lib32-embree isn't available.
    builtin_enet=yes
    builtin_freetype=no
    builtin_glslang=yes
    builtin_graphite=yes # lib32-graphite isn't available.
    builtin_harfbuzz=yes
    builtin_icu4c=yes
    builtin_libogg=no
    builtin_libpng=no
    builtin_libtheora=no
    builtin_libvorbis=no
    builtin_libwebp=no
    builtin_mbedtls=yes
    builtin_miniupnpc=yes # lib32-miniupnpc isn't available.
    builtin_msdfgen=yes
    builtin_openxr=yes # lib32-openxr isn't available.
    builtin_pcre2=no
    builtin_pcre2_with_jit=no
    builtin_recastnavigation=yes
    builtin_rvo2_2d=yes
    builtin_rvo2_3d=yes
    builtin_squish=yes # lib32-libsquish isn't available.
    builtin_wslay=yes  # lib32-libwslay isn't available.
    builtin_xatlas=yes
    builtin_zlib=no
    builtin_zstd=no
    colored=yes
    debug_symbols=no # Disable debug_symbols for smaller binary.
    disable_exceptions=false
    platform=linuxbsd
    production=yes
    pulseaudio=yes
    system_certs_path=/etc/ssl/certs/ca-certificates.crt
    target=editor
    use_llvm=no
    werror=no
  )

  # Regular build
  scons "${_args[@]}"
}

package() {
  cd "$_pkgname-$pkgver-stable"

  install -Dm755 bin/godot.linuxbsd.editor.$_godot_arch "$pkgdir/usr/bin/godot32"

  install -Dm644 icon.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 misc/dist/linux/org.godotengine.Godot.desktop "$pkgdir/usr/share/applications/org.godotengine.Godot32.desktop"
  install -Dm644 misc/dist/linux/org.godotengine.Godot.xml "$pkgdir/usr/share/mime/packages/org.godotengine.Godot32.xml"

  # Patch upstream Godot.desktop
  sed -i \
    -e 's|Exec=godot|Exec=godot32|' \
    -e 's|Icon=godot|Icon=godot32|' \
    -e 's|Name=Godot Engine|Name=Godot Engine (32-bit)|' \
    "$pkgdir/usr/share/applications/org.godotengine.Godot32.desktop"

  install -Dm644 misc/dist/linux/godot.6 "$pkgdir/usr/share/man/man6/$pkgname.6"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
