# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=run-mailcap-rs-git
pkgver=r58.3db5593
pkgrel=3
pkgdesc='run-mailcap replacement written in Rust'
arch=('any')
url="https://github.com/cglindkamp/run-mailcap-rs"
license=('ISC')
provides=('run-mailcap')
conflicts=('run-mailcap')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/cglindkamp/run-mailcap-rs")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	# not using --locked because repo doesn't have a Cargo.lock
	RUSTUP_TOOLCHAIN=stable cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	RUSTUP_TOOLCHAIN=stable cargo build --frozen --release --all-features --target-dir=target
}

check() {
	cd "$pkgname"
	RUSTUP_TOOLCHAIN=stable cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	make PREFIX="$pkgdir/usr" COMPAT_LINKS=1 install	
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/run-mailcap-rs/"

	# To avoid conflict with vi package
	rm "$pkgdir/usr/bin/edit"
}
