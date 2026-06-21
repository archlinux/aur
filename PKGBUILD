# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=recoverywhiskers
pkgdesc='Flux-based data recovery tool for floppy disks'
pkgver=0.6.1
pkgrel=1
url=https://codeberg.org/JennyFluff/RecoveryWhiskers
license=(AGPL-3.0-or-later)
arch=(x86_64)
makedepends=(cargo git)
# Git commit for the release tag
_commit=6295db5150e991d07b5eb57c46fe7637eb330eb6
source=("$pkgname::git+$url#commit=$_commit"
		"$pkgname-testdata::git+${url}TestData")
sha256sums=('7880657436c676d7c6d8140b7f62bb158a317bc7fb90c6f785aa7552fd327a30'
            'SKIP')

prepare() {
	cd "$pkgname"

	git submodule init
	git config submodule.testdata.url "$srcdir/$pkgname-testdata"
	git -c protocol.file.allow=always submodule update

	export RUSTUP_TOOLCHAIN=stable
	cargo update
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check () {
	cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package () {
	install -Dm755 "$pkgname/target/release/rw" "$pkgdir/usr/bin/rw"
}
