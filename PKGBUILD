# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-sim8
pkgver=8.3.0
pkgrel=3
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Open source robotics simulator"
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'eigen'
  'gz-common=5'
  'gz-fuel-tools=9'
  'gz-gui=8'
  'gz-math=7'
  'gz-msgs=10'
  'gz-physics=7'
  'gz-plugin=2'
  'gz-rendering=8'
  'gz-sensors=8'
  'gz-transport=13'
  'gz-utils=2'
  'protobuf'
  'qt5-base'
  'qt5-quickcontrols2'
  'sdformat=14'
  'tinyxml2'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  'pybind11'
  'python'
  'git'
  )
provides=("${_pkgbase}=${_pkgmaj}")
#source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz")
source=("git+https://github.com/gazebosim/${_pkgbase}.git#tag=${pkgname}_${pkgver}")
sha256sums=('SKIP')

prepare() {
  git -C "$srcdir/${_pkgbase}" cherry-pick -n 40aaddc7eb4ca12a03b64e18ffc101db9f9c24ec
}

build() {
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/ffmpeg4.4/pkgconfig"
  # ${_pkgbase}-${pkgname}_${pkgver}
  cmake -B build -S "$srcdir/${_pkgbase}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DBUILD_TESTING=OFF \
           -DUSE_SYSTEM_PATHS_FOR_PYTHON_INSTALLATION:BOOL=ON \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
