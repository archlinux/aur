# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="next-rust-release-date"
pkgname="next-rust-release-date"
pkgver=0.1.0
pkgrel=2
pkgdesc='When&#x27;&quot;&#x27;&quot;&#x27;s the next Rust release?'
url='https://crates.io/crates/next-rust-release-date'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-v$pkgver.tar.gz::https://github.com/tshepang/next-rust-release-date/archive/refs/tags/v0.1.0.tar.gz"
	    'https://github.com/tshepang/next-rust-release-date/commit/78b06ce7dd1bc7489f5db00f09594d2131366af1.patch')
sha512sums=('f837d252bd6aad5e3cda408199411e84dc71e2f0e5d8011768259c55cba94c2bc3a4c5edf997b36c68e9722e5a018b548a3c0058efd71c2233e8d59a09bfbe3a'
            '803d5e54fcc1a2c57ae72866c8d3deee03d3f84ea74be8ac9098bfc70fecf9e88a7b3639305d81309a121ce61c37a877b0aea34436a56ec1d3d697f2a1f13398')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$pkgver"

	patch -Np1 -i "$srcdir/78b06ce7dd1bc7489f5db00f09594d2131366af1.patch"
	cargo fetch --locked
}

build() {
	cd "$srcdir/$_crate-$pkgver"
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/next-rust-release-date" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
