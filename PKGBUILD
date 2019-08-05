# Maintainer: Bruce Zhang
pkgname=sonic
pkgver=1.2.2
pkgrel=1
pkgdesc="🦔 Fast, lightweight & schema-less search backend. An alternative to Elasticsearch that runs on a few MBs of RAM"
arch=('i686' 'x86_64')
url="https://github.com/valeriansaliou/sonic"
license=('MPL2')
depends=()
makedepends=('clang' 'llvm' 'rustup')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/valeriansaliou/sonic/archive/v$pkgver.tar.gz")
sha256sums=('d9fa4e43f809b2fdc2799ae00db7e4745087ac6dad520a9be2b40a687e3db4ca')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	nightly_installed=$(rustup toolchain list | grep nightly | wc -l)
	
	if [ $nightly_installed == '0' ]; then
		rustup toolchain install nightly
	fi

	cargo +nightly build --release

	if [ $nightly_installed == '0' ]; then
		rustup toolchain uninstall nightly
	fi
}

package() {
	cd "$srcdir/$pkgname-$pkgver/target/release"
	install -Dm755 sonic "$pkgdir/usr/bin/sonic"

	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 examples/config/systemd.service "$pkgdir/usr/lib/systemd/system/sonic.service"

	install -Dm644 config.cfg "$pkgdir/etc/sonic.cfg"
}
