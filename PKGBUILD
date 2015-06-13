# Maintainer: Michael Adler <therisen06 plus aur at gmail a-dot com>
# Previous Contributors: kainlite <kainlite@gmail.com>

pkgname=libcouchbase
pkgver=2.5.0
pkgrel=1
pkgdesc="The C library provides fast access to documents in the latest Couchbase Server"
arch=('i686' 'x86_64')
url="https://github.com/couchbase/libcouchbase"
license=('Apache')
options=('!emptydirs' '!strip')
depends=('libevent')
install=$pkgname.install
source=("https://github.com/couchbase/libcouchbase/archive/${pkgver}.tar.gz"
        'fix_cbc_name_clash.patch')
sha1sums=('21a971af4c9fc9da55fae373f86f5372267664ca'
          'abee74d11d177a10ee3b3075d50b0e587def2ccb')

build() {
  tar -xzf ${pkgver}.tar.gz -C "${srcdir}/libcouchbase-${pkgver}"
  cd "${srcdir}/libcouchbase-${pkgver}"

  msg2 "Fixing cbc name clash..."
  patch -p1 -i ../fix_cbc_name_clash.patch

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
