# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: kpcyrd <git@rxv.cc>

pkgname=diesel_cli
pkgver=1.4.0
pkgrel=1
pkgdesc='CLI for the Diesel crate'
arch=(i686 x86_64)
url='https://github.com/diesel-rs/diesel/tree/master/diesel_cli'
license=(MIT Apache)
depends=(sqlite postgresql-libs libmariadbclient)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/diesel-rs/diesel/archive/v$pkgver.tar.gz")
sha256sums=('5a264a49aef60cf08c879d8d8eac754bec87da292df908924edbe963cf683b26')

build() {
	cd "diesel-$pkgver/$pkgname"
	# --locked is broken
	cargo build --release
}

check() {
	cd "diesel-$pkgver/$pkgname"
	# tests require a debug build to be present
	cargo test --no-default-features --features sqlite
}

package() {
	cd "diesel-$pkgver"
	
	install -Dm755 'target/release/diesel' "$pkgdir/usr/bin/diesel"
	
	install -d \
		"$pkgdir/usr/share/bash-completion/completions" \
		"$pkgdir/usr/share/zsh/site-functions" \
		"$pkgdir/usr/share/fish/vendor_completions.d"
	"$pkgdir/usr/bin/diesel" completions bash > "$pkgdir/usr/share/bash-completion/completions/diesel"
	"$pkgdir/usr/bin/diesel" completions zsh  > "$pkgdir/usr/share/zsh/site-functions/_diesel"
	"$pkgdir/usr/bin/diesel" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/diesel.fish"
	
	install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
