# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=sqlpp11-connector-odbc
pkgver=0.01
pkgrel=1
pkgdesc="ODBC wrapper for sqlpp11"
arch=('any')
url="https://github.com/Erroneous1/sqlpp11-connector-odbc"
license=('CUSTOM')
depends=('sqlpp11')
makedepends=('cmake' 'git' 'unixodbc')
source=("${url}/archive/v${pkgver}.tar.gz"
        "git+https://github.com/HowardHinnant/date.git"
        'cmake_patch')
sha256sums=('b1310b6614034e3c0aa2b794ac24eed498a775e8044c9e5fae047fd781df6b39'
            'SKIP'
            'bb310bd69869ac19e1f53deff4cc15ead856904a2b77137a905afe75f1c53dd9')
build() {
    mkdir build
    mkdir -p ${pkgname}-${pkgver}/external/date
    cp date/date.h ${pkgname}-${pkgver}/external/date
    cd ${pkgname}-${pkgver}
    patch -p2 < ../cmake_patch
    cd ../build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ../${pkgname}-${pkgver}
    make
}

package() {
  cd $srcdir/build
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir"/usr/share/licenses/${pkgname}
  install -Dm644 ../${pkgname}-${pkgver}/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
