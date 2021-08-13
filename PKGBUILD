# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# In order to use this on the Raspberry PI, you must either use the kms or fkms driver.

pkgname=sdl2-nox
pkgver=2.0.16
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
sha512sums=('ec75ef8526792650c2647b78bb0244f973774418aeae33a2182d90ce696b30acb652f8be9c2012a16c1c5d5622f7630ff2e1eadae27ea3dc78ab47730cf5e62f')

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
