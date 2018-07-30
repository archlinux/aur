# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-sdl
pkgver=1.2.15
pkgrel=7
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (mingw-w64)"
arch=(any)
url="https://www.libsdl.org"
license=("LGPL")
depends=('mingw-w64-crt' 'mingw-w64-libiconv')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!strip' '!buildflags')
source=("${url}/release/SDL-${pkgver}.tar.gz"
        "SDL-1.2.10-GrabNotViewable.patch"
        "SDL-1.2.15-SDL_EnableUNICODE_drops_keyboard_events.patch"
        "SDL-1.2.15-const_XData32.patch"
        "SDL-1.2.15-ignore_insane_joystick_axis.patch"
        "SDL-1.2.15-no-default-backing-store.patch"
        "SDL-1.2.15-x11-Bypass-SetGammaRamp-when-changing-gamma.patch"
        "sdl-1.2.14-fix-mouse-clicking.patch"
        "sdl-1.2.14-disable-mmx.patch"
        "libsdl-1.2.15-resizing.patch"
        "X11_KeyToUnicode.patch")
sha256sums=('d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00'
            'ea2042b8a45a083b1447d5c56e52b23b79f2ddb0d717ec7b287b34ef71bd2d1a'
            '292046466d52a2ebe995a0121404864e4ee0de2b6024203acb95bbd600844da0'
            'bab60b515a74b71650ee71d5a0075c77046a7bad48b061673c3798dbdd35446d'
            '7586d6124d5452ad721ca6aa10eae09946d94854748e22f9c9c6fdca3d0aeb12'
            '3941c44a5580df95c6868936cfc57ba3e7b6952fb8a3eb14f963d54d9d8ca8a4'
            'd296af5bb0d9856d049b4e5adb9dd995d2a1e51d76a6adf63457e65101a50620'
            '8d178f13eb707e81f5f9d86bf7b609ae8f0bac937fb4a37ebcbf4bbc9b89e21b'
            '17bb880dd2cb4922d4e3771d146660b9da8be8f1629a5cdaae7523d4a9d2bd7c'
            '5160fb1c07b04480d98d45b89a0aa6e577f2ac4c3bace0c80b251e6aca1fb4a1'
            'b1ad9c60829b166e6b647006d6549ea657155e755cf574fcfc4b91b658654769')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/SDL-${pkgver}"
  # patches from regular package
  patch -Np1 -i ../SDL-1.2.10-GrabNotViewable.patch
  patch -Np1 -i ../SDL-1.2.15-SDL_EnableUNICODE_drops_keyboard_events.patch
  patch -Np1 -i ../SDL-1.2.15-const_XData32.patch
  patch -Np1 -i ../SDL-1.2.15-ignore_insane_joystick_axis.patch
  patch -Np1 -i ../SDL-1.2.15-no-default-backing-store.patch

  # https://bugs.freedesktop.org/show_bug.cgi?id=27222
  patch -Np1 -i ../SDL-1.2.15-x11-Bypass-SetGammaRamp-when-changing-gamma.patch

  patch -Np1 -i ../sdl-1.2.14-fix-mouse-clicking.patch
  patch -Np1 -i ../sdl-1.2.14-disable-mmx.patch
  patch -Np1 -i ../libsdl-1.2.15-resizing.patch
  patch -Np1 -i ../X11_KeyToUnicode.patch
}

build() {
  cd "${srcdir}/SDL-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
    --disable-assembly \
    ..
    make
    popd
  done
}

package() {
  install -d "$pkgdir/usr/bin"
  for _arch in ${_architectures}; do
    cd "${srcdir}/SDL-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    sed -e "s|-mwindows||g" -i ${pkgdir}/usr/${_arch}/lib/pkgconfig/sdl.pc
    chmod a-x "$pkgdir"/usr/${_arch}/lib/*.dll.a
    rm -rf "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a 
    ln -s "/usr/${_arch}/bin/sdl-config" "${pkgdir}/usr/bin/${_arch}-sdl-config"
  done
}
