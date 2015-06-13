# Maintainer: Michael Adler <therisen06 plus aur at gmail a-dot com>
# Previous Contributors: Kiswono <kiswono@gmail.com>, Lev Lybin <lev.lybin at gmail a-dot com>

pkgname=libcouchbase-2.4
pkgver=2.4.9
pkgrel=1
pkgdesc="The C library provides fast access to documents in Couchbase Server 2.4.x"
arch=('i686' 'x86_64')
url="https://github.com/couchbase/libcouchbase"
license=('Apache')
options=('!emptydirs' '!strip')
depends=('libevent')
conflicts=('libcouchbase')
install=$pkgname.install
source=("https://github.com/couchbase/libcouchbase/archive/${pkgver}.tar.gz"
        'fix_cbc_name_clash.patch')
sha1sums=('8b86cd7dc22a0105b1155006d906e3443f3ab2c2'
          '0591545b9785d8aeafc1ff72309eabd802b3653f')

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
