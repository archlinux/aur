# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythonocc-core
pkgname=python-${_pkgname#python}
pkgver=7.9.0
pkgrel=1
pkgdesc='Python package for 3D geometry CAD/BIM/CAM'
arch=('x86_64')
url='https://github.com/tpaviot/pythonocc-core'
license=('LGPL3')
depends=('python' 'opencascade' 'libxmu' 'libxi' 'python-numpy')
# rapidjson appears to be unused but an opencascade
# header that references it gets dragged in somehow
makedepends=('cmake' 'swig' 'rapidjson' 'git' 'ninja' 'python-setuptools')
#source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
source=("git+https://github.com/tpaviot/pythonocc-core#tag=$pkgver")
sha512sums=('SKIP')

prepare() {
  cd $_pkgname

  # Add Swig-4.3.1 support
  git cherry-pick -n ec4904997fc1d218697f3b9650295ab42cf062c9
  # opencascade 7.9.1
  sed -i 's/OCCT_VERSION_PATCH 0/OCCT_VERSION_PATCH 1/' CMakeLists.txt
}

build() {
  cd $_pkgname

  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DPYTHONOCC_MESHDS_NUMPY=ON

  ninja -C build
}

package() {
  cd $_pkgname

  DESTDIR="$pkgdir" ninja -C build install
}
