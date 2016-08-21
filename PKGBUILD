# Maintainer: GhettoGirl <github.com/GhettoGirl>

pkgname=sdl2-ime-support
pkgver=2.0.4
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2) [with IME support]"
arch=('i686' 'x86_64')
url="http://www.libsdl.org"
license=('MIT')
depends=('glibc' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor')
provides=('sdl2=2.0.4')
conflicts=('sdl2')
install="$pkgname.install"
makedepends=('alsa-lib' 'mesa' 'libpulse' 'libxrandr' 'libxinerama' 'libxkbcommon'
             'fcitx' 'libibus')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'fcitx: fcitx input support'
            'ibus: IBus input support')
source=("git+https://github.com/timxx/SDL-fcitx#branch=release-$pkgver")
md5sums=('SKIP')

build() {
  cd SDL-fcitx
  ./autogen.sh
  mkdir -p build && cd build

  ../configure --prefix=/usr \
    --enable-sdl-dlopen \
    --disable-arts --disable-esd --disable-nas \
    --enable-alsa --enable-pulseaudio-shared \
    --disable-video-wayland \
    --enable-ibus \
    --enable-fcitx \
    --disable-rpath
  make -j$(nproc)
}

package() {
  cd SDL-fcitx/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
