# Maintainer: Hiroshi Hatake <cosmo0920.wp[at]gmail.com>

pkgname=pgroonga
pkgver=4.0.4
pkgrel=1
pkgdesc="Fast fulltext search on PostgreSQL."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/pgroonga/pgroonga"
license=('custom:PostgreSQL')
source=("https://github.com/pgroonga/pgroonga/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
    "https://github.com/pgroonga/pgroonga/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc")
depends=('groonga' 'postgresql')
makedepends=('postgresql' 'clang' 'llvm')
validpgpkeys=(2701F317CFCCCB975CADE9C2624CF77434839225)

build() {
    cd $srcdir/$pkgname-$pkgver
    make -j$(nproc)
}

package() {
    pkgdesc="PGroonga is a PostgreSQL extension to use Groonga as index. PGroonga makes PostgreSQL fast full text search platform for all languages!"
    depends=('groonga' 'postgresql')

    cd $srcdir/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install
    install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"

    echo "-------------------------------------------------------------"
    echo "After install this package,"
    echo "please execute following commands to make fully installation."
    echo "-------------------------------------------------------------"
    echo "sudo -u postgres -H psql --command 'CREATE DATABASE pgroonga_test'"
    echo "sudo -u postgres -H psql -d pgroonga_test --command 'CREATE EXTENSION pgroonga'"
    echo "-------------------------------------------------------------"
    echo "*************************************************************"
    echo "You need to upgrade EXTENSION pgroonga CASCADE, "
    echo "In more detail, please refer to the PGroonga site's upgrading instructions:"
    echo "http://pgroonga.github.io/upgrade/"
    # Remove needless dotfiles
    rm -rf "$pkgdir/.*"
}
sha256sums=('2e7be664ee99b49dd23ec57b19403ff4f5b44ca21d3c039d43fd1d550d583223'
    'SKIP')
