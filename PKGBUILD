# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Chebotarev Sergey <sachebotarev@gmail.com>
# Contributor: Aurélien Desbrières <ice.cube@gmx.com>
# Maintainer: Stefan Husmann <Stefan-Husmann@t-online.de>

pkgname=fontmatrix-git
pkgver=1177.33cc6af
pkgrel=1
pkgdesc='Font manager for Linux'
arch=('i686' 'x86_64')
url='http://oep-h.com/fontmatrix/'
license=('GPL')
depends=('qtwebkit')
conflicts=('fontmatrix')
provides=('fontmatrix')
makedepends=('cmake' 'git' 'mesa')
install="${pkgname%-*}.install"
source=('git+https://github.com/popolon/fontmatrix.git')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  printf "$(git rev-list --count HEAD) $(git rev-parse --short HEAD)"|sed 's+ +.+g'
}

build() {
  cd ${pkgname%-*}

  [[ $CARCH == 'i686' ]] && _bits='32'
  [[ $CARCH == 'x86_64' ]] && _bits='64'
  export QTDIR=/usr
  export QMAKESPEC=/usr/share/qt/mkspecs/linux-g++-${_bits}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd ${pkgname%-*}/build

  make DESTDIR="${pkgdir}" install
}
