# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Jason Nader <jason d0t nader pr0t0nmail.c0m>

pkgname=cargo-cache
pkgver=0.8.1
pkgrel=1
pkgdesc="Display info and prune cargo cache"
arch=('x86_64')
url="https://github.com/matthiaskrgr/cargo-cache"
source=("$pkgname-$pkgver.tar.gz::https://github.com/matthiaskrgr/cargo-cache/archive/$pkgver.tar.gz")
license=('MIT' 'Apache')
depends=('cargo')
sha256sums=('39ed11a8bb62ee8e3f6e53b6d39fd82eef1a03a8858d59077f1f83abe72800a9')
depends=('libgit2')
makedepends=('cargo')

prepare() {
    cd "$pkgname-$pkgver"
    # Upstream vendors libgit2 because they depend on a "recent" version but Arch already ships
    # that version. Let's undo the vendoring.
    sed -i "s|\[\"vendored-libgit2\"\]|\[\]|" Cargo.toml
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
