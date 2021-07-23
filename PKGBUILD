# Maintainer: gardenapple <gardenapple@posteo.net>

pkgname=run-mailcap-rs-git
pkgver=r54.231621a
pkgrel=1
pkgdesc='run-mailcap replacement written in Rust'
arch=('any')
url="https://github.com/cglindkamp/run-mailcap-rs"
license=('ISC')
provides=('run-mailcap')
conflicts=('run-mailcap')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/cglindkamp/run-mailcap-rs"
	'makefile-remove-bashism.patch')
sha256sums=('SKIP'
            '92ef1492206a6ff1990483fa8019646cbbe15a329ae962165a08d896ee580dd5')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	patch --strip=1 --input="$srcdir/makefile-remove-bashism.patch"
}

build() {
	cd "$pkgname"

	# gives an error when run with --locked
	RUSTUP_TOOLCHAIN=stable cargo build --release --all-features --target-dir=target
}

check() {
	cd "$pkgname"

	RUSTUP_TOOLCHAIN=stable cargo test --locked --target-dir=target
}

package() {
	cd "$pkgname"

	make PREFIX="$pkgdir/usr" COMPAT_LINKS=1 install	
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/run-mailcap-rs/"

	# To avoid conflict with vi package
	rm "$pkgdir/usr/bin/edit"
}
