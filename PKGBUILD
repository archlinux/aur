# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythonocc-core
pkgname=python-${_pkgname#python}
pkgver=7.9.0
pkgrel=3
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

  # Add Swig-4.4.1 and occt 7.9.3 support
  git cherry-pick -n ec4904997fc1d218697f3b9650295ab42cf062c9
  git cherry-pick -n a0a9351ca9fa464b3ce0fd41d54b052fa699c68e
  git cherry-pick -n 101edee6f627b02b828e011e8e99cd56167865b2
  git cherry-pick -n 4db85aa834730817d93421c87a2ce14be53a8ee8
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
