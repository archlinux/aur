# Maintainer: Marc Rechté <mrechte@gmail.com>
pkgname=pgagroal
pkgver=0.8.2
pkgrel=1
arch=('x86_64')
pkgdesc="pgagroal is a high-performance protocol-native connection pool for PostgreSQL"
url="https://github.com/agroal/pgagroal"
license=('custom:BSD')
depends=('libev' 'openssl')
makedepends=('gcc' 'cmake' 'make' 'python-docutils')
backup=("etc/pgagroal/pgagroal.conf" "etc/pgagroal/pgagroal_hba.conf")
source=("https://github.com/agroal/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz" )
#       "$pkgname-$pkgver.patch")
md5sums=('d79e400ad83cc47e846cc7f1181551e8')
install="$pkgname.install"

prepare() {
	cd "$pkgname-$pkgver"
#   patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
	cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make install
    cd ..
    mv "$pkgdir/usr/etc" "$pkgdir/"
    install -d "$pkgdir/usr/lib/systemd/system/"
    install -m 0644 doc/etc/pgagroal.service "$pkgdir/usr/lib/systemd/system/"
    install -m 0644 doc/etc/pgagroal.socket "$pkgdir/usr/lib/systemd/system/"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
