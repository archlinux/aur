# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-physics7
pkgver=7.2.0
pkgrel=2
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Abstract physics interface designed to support simulation and rapid development of robot applications."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'eigen'
  'gz-common=5'
  'gz-math=7'
  'gz-plugin=2'
  'gz-utils=2'
  'sdformat=14'
  'bullet'
  'libdart'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  'git'
  )
optdepends=(
  #'libdart: DARTsim physics plugin'
  #'bullet: bullet physics plugin'
)
provides=("${_pkgbase}=${_pkgmaj}")
#source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
source=("git+https://github.com/gazebosim/${_pkgbase}.git#tag=${pkgname}_${pkgver}")
sha256sums=('SKIP')

#_build_dir="${_pkgbase}-${pkgname}_${pkgver}/build"
_build_dir="${_pkgbase}/build"

prepare() {
  git -C "$srcdir/$_pkgbase" cherry-pick -n a74dae4b732e9c7932a037bc931956956ba4f6ea
}

build() {
  mkdir -p "$srcdir/$_build_dir" && cd $_
  cmake .. -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build .
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$_build_dir"
}
