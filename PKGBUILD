# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythonocc-core
pkgname=python-${_pkgname#python}
pkgver=7.5.1.r90.g141c53f7
_commit=141c53f716ca4c138a6ddee2ce6ed1d3c28944e8
pkgrel=1
pkgdesc='Python package for 3D CAD/BIM/PLM/CAM'
arch=('x86_64')
url='https://github.com/tpaviot/pythonocc-core'
license=('LGPL3')
depends=('python' 'opencascade' 'libxmu' 'libxi')
# rapidjson appears to be unused but an opencascade
# header that references it gets dragged in somehow
makedepends=('cmake' 'swig' 'rapidjson' 'git')
#source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
source=("git+https://github.com/tpaviot/pythonocc-core#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname-$pkgver
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mv $_pkgname $_pkgname-$pkgver
  mkdir $_pkgname-$pkgver/build
}

build() {
  cd $_pkgname-$pkgver/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd $_pkgname-$pkgver/build

  make DESTDIR="$pkgdir" install
}
