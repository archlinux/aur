# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-sensors8
pkgver=8.0.0
pkgrel=3
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Provides numerous sensor models designed to generate realistic data from simulation environments."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'gz-common=5'
  'gz-math=7'
  'gz-msgs=10'
  'gz-rendering=8'
  'gz-transport=13'
  'protobuf'
  'sdformat=14'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  'git'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("git+https://github.com/gazebosim/${_pkgbase}.git#tag=${pkgname}_${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgbase"

  # Avoid calling DblNormal with invalid standard deviation (issue #396)
  git cherry-pick -n "ac0c44f7da0a6d3c9e129571c7910421664f1181"
}

build() {
  cmake -B build -S "${_pkgbase}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
