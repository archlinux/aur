# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-transport12
pkgver=12.2.2
pkgrel=3
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Transport library for component communication based on publication/subscription and service calls."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'cppzmq'
  'gz-msgs=9'
  'gz-utils=2'
  'protobuf-c'
  'protobuf'
  'zeromq'
)
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  'util-linux-libs'  # uuid
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz"
        "protobuf_string_view.patch")
sha256sums=('8662f7412c40a362eaa0a490a0ad6bce83300d08443920cb51dbe6da0c408b6d'
            '1b46124c4bf23d31e6e16602b19a2d303c1b1702f975b7c1acc6c43c0c19e0f2')

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
