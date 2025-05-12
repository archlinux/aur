# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=sdl3_sound
pkgname=${_pkgname}-git
pkgver=2.0.2.r45.g68d18fe
pkgrel=1
pkgdesc="An abstract soundfile decoder (development version)"
arch=('i686' 'x86_64')
url="https://icculus.org/SDL_sound/"
license=('Zlib')
depends=('sdl3')
makedepends=('git' 'cmake' 'ninja')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=('git+https://github.com/icculus/SDL_sound.git')
md5sums=('SKIP')

_srcdir='SDL_sound'

pkgver() {
  cd ${_srcdir}
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cmake ${_srcdir} -Bbuild -GNinja \
    -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr \
    -DSDLSOUND_DECODER_MIDI=TRUE -DSDLSOUND_BUILD_STATIC=FALSE
  cmake --build build
}

package() {
  DESTDIR="$pkgdir/" cmake --install build

  # handle conflict with sdl_sound
  mv "$pkgdir"/usr/bin/playsound{,-sdl3}

  cd ${_srcdir}

  # docs
  install -Dm644 -t "$pkgdir"/usr/share/doc/${_pkgname} docs/*

  # license
  install -Dm644 -t "$pkgdir"/usr/share/licenses/${_pkgname} LICENSE.txt
}
