# Maintainer: Duje Mihanović <duje.mihanovic@skole.hr>
# Based on extra/sdl2 PKGBUILD

pkgname=sdl2-static
pkgver=2.0.16
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
sha512sums=('ec75ef8526792650c2647b78bb0244f973774418aeae33a2182d90ce696b30acb652f8be9c2012a16c1c5d5622f7630ff2e1eadae27ea3dc78ab47730cf5e62f'
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
      -DJACK_SHARED=ON \
	  -DSDL_STATIC_PIC=ON
  ninja -C build
}

package() {
  cd SDL2-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

