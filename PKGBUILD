# Maintainer: Bruce Zhang
pkgname=sonic
pkgver=1.2.3
pkgrel=1
pkgdesc="Fast, lightweight & schema-less search backend. An alternative to Elasticsearch that runs on a few MBs of RAM"
arch=('i686' 'x86_64')
url="https://github.com/valeriansaliou/sonic"
license=('MPL2')
depends=()
makedepends=('clang' 'llvm' 'rustup')
source=(
	"$pkgname-$pkgver.src.tar.gz::https://github.com/valeriansaliou/sonic/archive/v$pkgver.tar.gz"
	'sonic.sysusers'
)
sha256sums=('d47e031135d101d52f8d6998ddeb092df9ddfac36b8051efd004249bdb43fda5'
            '1bec735cc0560927eb8ca43494bc0f1b2ec34296357fe1a861ce10ed3828a704')

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
	install -Dm644 "$srcdir/sonic.sysusers" "$pkgdir/usr/lib/sysusers.d/sonic.conf"
}
