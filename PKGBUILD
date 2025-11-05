# Maintainer: skewb1k <skewb1kunix@gmail.com>

pkgname=chroma-ls
pkgver=0.2.1
pkgrel=1
pkgdesc='LSP server for highlighting colors in source files'
url='https://github.com/skewb1k/chroma-ls'
license=('MIT')
makedepends=('cargo')
arch=('x86_64')
source=("git+${url}")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
    cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
