# Maintainer: GhettoGirl <github.com/GhettoGirl>

pkgname=lib32-sdl2-ime-support
pkgver=2.0.4
pkgrel=2
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2) [with IME support] (32-bit support)"
arch=('x86_64')
url="http://www.libsdl.org"
license=('MIT')
depends=('lib32-libgl' 'lib32-libx11' 'lib32-libxext' 'lib32-libxrender' 'sdl2-ime-support')
provides=('lib32-sdl2=2.0.4')
conflicts=('lib32-sdl2')
install="$pkgname.install"
makedepends=('gcc-multilib' 'lib32-alsa-lib' 'lib32-mesa' 'lib32-libpulse'
             'lib32-libxinerama' 'lib32-libxkbcommon' 'lib32-libxrandr'
             'fcitx' 'lib32-fcitx' 'libibus')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'fcitx: fcitx input support'
            'lib32-fcitx: fcitx input support'
            'ibus: IBus input support')
source=("git+https://github.com/timxx/SDL-fcitx#branch=release-$pkgver")
md5sums=('SKIP')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd SDL-fcitx
  ./autogen.sh
  mkdir -p build && cd build

  ../configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --enable-{alsa,pulseaudio-shared,sdl-dlopen} \
    --disable-{arts,esd,nas} \
    --disable-input-tslib \
    --disable-video-wayland \
    --disable-rpath \
    --enable-ibus \
    --enable-fcitx
  make -j$(nproc)
}

package() {
  cd SDL-fcitx/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s sdl2 "${pkgdir}"/usr/share/licenses/lib32-sdl2
}
