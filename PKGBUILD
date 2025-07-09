# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-gui7
pkgver=7.2.2
pkgrel=3
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Graphical interfaces for robotics applications"
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'protobuf'
  'tinyxml2'
  'gz-utils=2'
  'gz-math=7'
  'gz-common=5'
  'gz-plugin=2'
  'gz-transport=12'
  'gz-rendering=7'
  'gz-msgs=9'
  'qt5-base'
  'qt5-quickcontrols2'
)
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz"
        "protobuf_string_view.patch")
sha256sums=('26b5c502977cf87f13e86bc504a72b1a8d810d4100c2878c76f7a0994ea26617'
            '89fb889259e78136dfa83a894937361c5bb0b28722c8251594c61f59fd40aa2a')

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgname}_${pkgver}"
  patch -Np1 -i "$srcdir/protobuf_string_view.patch"
}

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
