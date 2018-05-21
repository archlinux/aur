# Maintainer: Daniël de Kok <me@danieldk.eu>
pkgname=dbxml
pkgver=6.1.4
pkgrel=2
pkgdesc="Embeddable XML database"
arch=("x86_64")
url="https://www.oracle.com/database/berkeley-db/xml.html"
license=('AGPL3')
depends=('xerces-c' 'xqilla')
source=("http://download.oracle.com/berkeley-db/dbxml-6.1.4.tar.gz"
        "configure-db-so.patch"
        "cxx11.patch"
        "incorrect-optimization.patch")
sha256sums=('a8fc8f5e0c3b6e42741fa4dfc3b878c982ff8f5e5f14843f6a7e20d22e64251a'
            '0f022d22623815b45899a59eac982442072b19027f5d910519c43f8c26a88f26'
            '98d518934072d86c15780f10ceee493ca34bba5bc788fd9db1981a78234b0dc4'
            '4d4160552b22fc189aeb3f7ed60f5240d2f8ed3ffc9887ac65c03a2331c06d8c')

prepare() {
  cd "${pkgname}-${pkgver}/dbxml"

  # Configure looks for libdb-*.la files
  patch -p2 < "${srcdir}/configure-db-so.patch"

  # C++11 compatibility patch from Homebrew.
  patch -p2 < "${srcdir}/cxx11.patch"

  # Remove an optimization that led to incomplete results on some queries.
  # See: https://community.oracle.com/thread/4093422
  patch -p2 < "${srcdir}/incorrect-optimization.patch"
}

build() {
  cd "${pkgname}-${pkgver}/dbxml"
  ./configure --prefix=/usr \
    --with-berkeleydb=/usr \
    --with-xqilla=/usr \
    --with-xerces=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}/dbxml"
  make DESTDIR="${pkgdir}/" install
}
