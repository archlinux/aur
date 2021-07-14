# Maintainer: Duje Mihanović <duje.mihanovic@skole.hr>
# Based on extra/sdl2 PKGBUILD

pkgname=sdl2-static
pkgver=2.0.14
pkgrel=1
pkgdesc="SDL2 with libraries for static linking"
arch=('x86_64')
url="https://www.libsdl.org"
license=('MIT')
depends=('glibc' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor' 'libibus' 'hidapi' 'libusb')
provides=('sdl2')
conflicts=('sdl2')
makedepends=('alsa-lib' 'mesa' 'libpulse' 'libxrandr' 'libxinerama' 'wayland' 'libxkbcommon'
             'wayland-protocols' 'ibus' 'fcitx' 'libxss' 'cmake' 'jack' 'ninja')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver')
source=("https://www.libsdl.org/release/SDL2-${pkgver}.tar.gz"{,.sig})
sha512sums=('ebc482585bd565bf3003fbcedd91058b2183e333b9ea566d2f386da0298ff970645d9d25c1aa4459c7c96e9ea839fd1c5f2da0242a56892865b2e456cdd027ee'
            'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6') # Sam Lantinga
options=('staticlibs')

build() {
  cd SDL2-${pkgver}
  cmake . \
      -Bbuild \
      -GNinja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DSDL_STATIC=ON \
	  -DSDL_STATIC_LIB=ON \
      -DSDL_DLOPEN=ON \
      -DARTS=OFF \
      -DESD=OFF \
      -DNAS=OFF \
      -DALSA=ON \
      -DHIDAPI=ON \
      -DPULSEAUDIO_SHARED=ON \
      -DVIDEO_WAYLAND=ON \
      -DRPATH=OFF \
      -DCLOCK_GETTIME=ON \
      -DJACK_SHARED=ON
  ninja -C build
}

package() {
  cd SDL2-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

