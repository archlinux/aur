# Maintainer: AtticFinder65536 <atticventilation-aur at protonmail dot com>

pkgname=('undither-rs-git')
_gitname=('undither')
pkgver=0.2.r15.g95755d0
pkgrel=1
pkgdesc="Smart filter to remove Floyd-Steinberg dithering from paletted images (git)"
url="https://github.com/kornelski/undither"
license=('GPL3')
source=('git+https://github.com/kornelski/undither.git')
b2sums=('SKIP')
arch=('any')
makedepends=('cargo' 'git')
provides=('undither-rs')
conflicts=('undither-rs')
options=('!strip')

pkgver(){
	cd "${_gitname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_gitname}"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${_gitname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "${_gitname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package(){
	cd "${_gitname}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_gitname"
}
