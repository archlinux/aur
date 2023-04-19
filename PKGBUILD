# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=git-cinnabar-git
pkgver=0.5.0.r1739.g63d5747
pkgrel=3
pkgdesc="Git remote helper to interact with Mercurial repositories"
arch=(x86_64)
url='https://github.com/glandium/git-cinnabar'
license=(GPL2)
depends=(git mercurial)
makedepends=(cargo)
provides=('git-cinnabar')
conflicts=('git-cinnabar')
options=('!lto')
source=('git+https://github.com/glandium/git-cinnabar.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/git-cinnabar"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd git-cinnabar
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd git-cinnabar
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd git-cinnabar
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd git-cinnabar
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/git-cinnabar"
	ln -s git-cinnabar "$pkgdir/usr/bin/git-remote-hg"
}
