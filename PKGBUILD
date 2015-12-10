# Maintainer: Michael Adler <therisen06 plus aur at gmail a-dot com>
# Previous Contributors: kainlite <kainlite@gmail.com>

pkgname=libcouchbase
pkgver=2.5.4
pkgrel=1
pkgdesc="The C library provides fast access to documents in the latest Couchbase Server"
arch=('i686' 'x86_64')
url="https://github.com/couchbase/libcouchbase"
license=('Apache')
options=('!emptydirs' '!strip')
depends=('libevent')
makedepends=('cmake')
install=$pkgname.install
source=(
    "https://github.com/couchbase/libcouchbase/archive/${pkgver}.tar.gz"
    "fix_cbc_name_clash.patch"
    "fix_hex_version_number.patch"
)
sha1sums=('f39d8b9570b2d844d056785eefa822927437e5e3'
          'abee74d11d177a10ee3b3075d50b0e587def2ccb'
          '7b8a825860348556959c62e643fcca1f5295a9ba')

build() {
  tar -xzf ${pkgver}.tar.gz -C "${srcdir}/libcouchbase-${pkgver}"
  cd "${srcdir}/libcouchbase-${pkgver}"

  msg2 "Fixing cbc name clash..."
  patch -p1 -i ../fix_cbc_name_clash.patch

  msg2 "Fixing version number"
  patch -p1 -i ../fix_hex_version_number.patch

  # For debugging:
  # cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX=/usr CMakeLists.txt
  make || return 1
}

package() {
  cd "${srcdir}/libcouchbase-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ${srcdir}/libcouchbase-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
