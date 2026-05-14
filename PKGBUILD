# Maintainer: Raidriar

_pkgname=renderide
pkgname=$_pkgname-git
pkgver=r2063.c5baa47
pkgrel=1
epoch=0
pkgdesc="A modern Rust + wgpu renderer for Resonite"
arch=('x86_64')
url="https://github.com/DoubleStyx/Renderide"
license=('MIT')
makedepends=('git' 'cargo')
provides=('renderide')
options=(!lto)
install="renderide.install"
source=("$pkgname::git+https://github.com/DoubleStyx/Renderide")
sha256sums=('SKIP')

pkgver() {
  	cd "$pkgname"
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
		cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
  	git apply ../../Identifier.patch
}

build() {
		cd "$pkgname"
		export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
		cd "$pkgname"
		install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
		install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname-renderer"
		cp -r "crates/renderide/assets/xr" "$pkgdir/usr/bin/"
		install -Dm0755 -t "$pkgdir/usr/share/applications" "../../renderide.desktop"
		install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
