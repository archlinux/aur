# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Jason Nader <jason d0t nader pr0t0nmail.c0m>

pkgname=cargo-cache
pkgver=0.8.2
pkgrel=1
pkgdesc="Display info and prune cargo cache"
arch=('x86_64')
url="https://github.com/matthiaskrgr/cargo-cache"
source=("$pkgname-$pkgver.tar.gz::https://github.com/matthiaskrgr/cargo-cache/archive/$pkgver.tar.gz")
license=('MIT' 'Apache')
depends=('cargo')
sha256sums=('49af88116cd3fc395cd319f055aa690d867f15178267c3ac7257f3b09f44214e')
depends=('libgit2')
makedepends=('cargo')

prepare() {
    cd "$pkgname-$pkgver"
    # Upstream tried to make libgit vendoring optional but it doesn't work. Manually implement it anyway.
    sed -i "s|\[\"vendored-libgit2\"\]|\[\]|" Cargo.toml
    sed -i "s|, \"vendored-libgit\"||" Cargo.toml
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/cargo-cache" "$pkgdir/usr/bin/cargo-cache"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT
}
