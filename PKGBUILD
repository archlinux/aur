# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_pkgtag=0.1.3
_crate="crab-hole"
pkgname="crab-hole"
pkgver="$_pkgtag"
pkgrel=3
pkgdesc='Pi-Hole clone written in rust using trust-dns'
url='https://crates.io/crates/crab-hole'
license=('AGPL')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/crab-hole/$pkgver/download"
         crab-hole.service)
sha512sums=('9257046960caa02c963eb3a70e8d12c59fab9ae57c3cac9e6ac3dbd086b103692ab8ac51492be871a1fa7bf8e40d37d86dd7d033e68a45ed175965fb07c81d66'
            '0cb8a1137c3adab1553db7bae431b69fdd653f2025a106b04122100279bac6c7b27f038af436203fa7726ec0e744a46795c7f0baf32a53e03f363eb2e604c327')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$pkgver"

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
	install -Dm755 "target/release/crab-hole" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	
	cd "$srcdir"
	install -Dm755 "crab-hole.service" "$pkgdir/etc/systemd/system/crab-hole.service"
}
