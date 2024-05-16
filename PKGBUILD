# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=sdl2_sound-git
pkgver=2.0.2.r17.gfdcecaf
pkgrel=1
pkgdesc="An abstract soundfile decoder (development version)"
arch=('i686' 'x86_64')
url="https://icculus.org/SDL_sound/"
license=('zlib')
depends=('sdl2')
makedepends=('git' 'cmake' 'ninja')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=(${pkgname%-*}::"git+https://github.com/icculus/SDL_sound.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cmake ${pkgname%-*} -Bbuild -GNinja \
    -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr \
    -DSDLSOUND_DECODER_MIDI=TRUE -DSDLSOUND_BUILD_STATIC=FALSE
  cmake --build build
}

package() {
  DESTDIR="$pkgdir/" cmake --install build

  # handle conflict with sdl_sound
  mv "$pkgdir"/usr/bin/playsound{,-sdl2}

  cd ${pkgname%-*}

  # docs
  install -Dm644 -t "$pkgdir"/usr/share/doc/${pkgname%-*} docs/*

  # license
  install -Dm644 -t "$pkgdir"/usr/share/licenses/${pkgname%-*} LICENSE.txt
}
