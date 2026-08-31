# Contributor Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Toolybird <toolybird at tuta dot io>

pkgname=godot-mono-export-templates-linux
pkgver=4.7.2
pkgrel=1
pkgdesc='Advanced cross-platform 2D and 3D game engine (Export template for linux target and mono support)'
url='https://godotengine.org/'
license=(MIT)
arch=(x86_64)
makedepends=(alsa-lib dotnet-sdk-8.0 git nuget pulse-native-provider scons setconf yasm)
depends=(brotli ca-certificates embree freetype2 graphite libglvnd libspeechd libsquish libtheora libvorbis
         libwebp libwslay libxcursor libxi libxinerama libxrandr miniupnpc openxr pcre2)
#optdepends=('pipewire-alsa: for audio support'
#            'pulse-native-provider: for audio support')
source=("git+https://github.com/godotengine/godot#tag=$pkgver-stable")
b2sums=('919de6e3b42dc774e1b706b6485ed19965164c650df0640df5c2665a7f9f538f5ead5bc0925331fe2d91cfca0efce3a250cf8db5a47cbb482422a2472f996ef1')

prepare() {
  cd godot

  # Patch for miniupnpc
  sed -i 's/addr, 16/addr, 16, nullptr, 0/g' modules/upnp/upnp.cpp
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
    -j$(nproc --all)
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
    system_certs_path=/etc/ssl/certs/ca-certificates.crt
    use_llvm=no
    werror=no
  )

  # Mono build
  _args+=(module_mono_enabled=yes mono_glue=no)
  scons "${_args[@]}" target=template_debug
  scons "${_args[@]}" target=template_release
}

package(){
  cd godot

  install -Dm755 bin/godot.linuxbsd.template_debug.$_CARCH.mono \
    "$pkgdir/usr/share/godot/export_templates/$pkgver.stable.mono/linux_debug.$_CARCH"
  install -Dm755 bin/godot.linuxbsd.template_release.$_CARCH.mono \
    "$pkgdir/usr/share/godot/export_templates/$pkgver.stable.mono/linux_release.$_CARCH"
  #echo "$pkgver.stable.mono" > "$pkgdir/usr/share/godot-mono/export_templates/$pkgver/version.txt"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
