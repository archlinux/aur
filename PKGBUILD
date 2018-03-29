pkgbase=netopeer2
_pkgbase=Netopeer2
pkgname=("$pkgbase-cli")
_pkgver=0.4-r2
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc='A set of tools implementing network configuration tools based on the NETCONF Protocol.'
url="https://github.com/CESNET/$_pkgbase"
arch=('x86_64')
license=('BSD')
depends=('libnetconf2' 'openssl')
makedepends=('cmake')
_pkgsrc=$_pkgbase-$_pkgver
source=("$_pkgsrc.tar.gz::https://github.com/CESNET/$_pkgbase/archive/v$_pkgver.tar.gz"
        "openssl-1.1.0.patch::https://github.com/CESNET/$_pkgbase/commit/7c5d3b9de684610e99b00a1eb3457bf930ecbfd2.patch")
md5sums=('e710c95bca7f7455335f18351ef9b391'
         '352cc1a82d98fbf9ad6fc37412cd746d')

prepare() {
    cd $srcdir/$_pkgsrc
    patch -Np1 -i ../openssl-1.1.0.patch
    mkdir -p $srcdir/build-cli
}

build_cli() {
    cd $srcdir/build-cli
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        $srcdir/$_pkgsrc/cli
    make
}

build() {
    build_cli
}

package_netopeer2-cli() {
    cd $srcdir/build-cli
    make DESTDIR="$pkgdir" install
    install -Dm644 $srcdir/$_pkgsrc/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
