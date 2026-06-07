# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sdl3_sound
pkgver=3.2.0
pkgrel=1
pkgdesc='An abstract soundfile decoder'
arch=('i686' 'x86_64')
url='https://icculus.org/SDL_sound/'
license=('Zlib')
depends=('sdl3')
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/icculus/SDL_sound/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aa2a3058dd9d16baae7a555e454145c2e2a246b8fe4bd35e142324b928a67824')

_srcdir="SDL_sound-${pkgver}"

build() {
  cmake "${_srcdir}" -Bbuild -GNinja \
    -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr \
    -DSDLSOUND_DECODER_MIDI=TRUE -DSDLSOUND_BUILD_STATIC=FALSE
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # handle conflict with sdl_sound
  mv "$pkgdir"/usr/bin/playsound{,-sdl3}

  cd "${_srcdir}"

  # docs
  install -Dm644 -t "$pkgdir"/usr/share/doc/${pkgname} docs/*

  # license
  install -Dm644 -t "$pkgdir"/usr/share/licenses/${pkgname} LICENSE.txt
}
