# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythonocc-core
pkgname=python-${_pkgname#python}
pkgver=7.6.2
_commit=09d3747dbf6384f94d83ff2171e09259567823ff
pkgrel=2
pkgdesc='Python package for 3D CAD/BIM/PLM/CAM'
arch=('x86_64')
url='https://github.com/tpaviot/pythonocc-core'
license=('LGPL3')
depends=('python' 'opencascade' 'libxmu' 'libxi')
# rapidjson appears to be unused but an opencascade
# header that references it gets dragged in somehow
makedepends=('cmake' 'swig' 'rapidjson' 'git' 'ninja')
#source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
source=("git+https://github.com/tpaviot/pythonocc-core#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname-$pkgver
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mv $_pkgname $_pkgname-$pkgver
  cd $_pkgname-$pkgver

  # Compatibility with opencascade 7.6.3
  git cherry-pick -n b4ddcf774549dbb3f89f4ca9f9c5db6c3c9ab48c
}

build() {
  cd $_pkgname-$pkgver

  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  ninja -C build
}

package() {
  cd $_pkgname-$pkgver

  DESTDIR="$pkgdir" ninja -C build install
}
