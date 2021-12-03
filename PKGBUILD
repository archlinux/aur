# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# In order to use this on the Raspberry PI, you must either use the kms or fkms driver.

pkgname=sdl2-nox
pkgver=2.0.18
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2) without X11 support"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.libsdl.org"
license=('MIT')
depends=('bash')
makedepends=('alsa-lib' 'mesa')
provides=('sdl2')
conflicts=('sdl2')
 
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
source=("https://www.libsdl.org/release/SDL2-${pkgver}.tar.gz")
sha512sums=('8688b855ce15d574fb0726dd2a44109bb7b34d81c652c51025a32bf7eb7015ceb685834cf9fc3f97a2f5f5a3203f548ce6845420fafae7e5dc6bb9d11ce1740d')

prepare() {
  rm -rf build
  mkdir build
}

build() {
  cd build
  ../SDL2-$pkgver/configure --prefix=/usr \
    --disable-arts --disable-esd --disable-nas \
    --enable-pulseaudio-shared  --enable-video-kmsdrm \
    --without-x --disable-video-wayland --disable-video-rpi

  make
}
package() {
  cd build
  make install DESTDIR="$pkgdir"
  install -Dm644 ../SDL2-$pkgver/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
