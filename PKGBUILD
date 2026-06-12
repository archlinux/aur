# Maintainer: Raidriar <aur.raidriar@pm.me>
# Contributor: bredo <bredo@bredo.tech>

_pkgname=renderide
pkgname=$_pkgname-git
pkgver=r2855.dfd0cd9
pkgrel=1
epoch=0
pkgdesc="A modern Rust + wgpu renderer for Resonite"
arch=('x86_64')
url="https://github.com/DoubleStyx/Renderide"
license=('MIT')
depends=('gstreamer' 'gst-plugins-base-libs' 'zenity')
optdepends=('openxr: VR support')
makedepends=('cargo' 'git' 'sccache')
provides=('renderide')
options=(!lto)
install="renderide.install"
source=("$pkgname::git+https://github.com/DoubleStyx/Renderide" "Identifier.patch" "renderide.desktop")
sha256sums=('SKIP'
            '37e00b83d4e653ca35dfb31b1b1b899696b37a5193f156430ce1ca7374c91f43'
            'ac378d546ceed8ec698601684ae58f92cb131a42aa5186316aa6b99f0e86c907')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
	git apply "$srcdir/Identifier.patch"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	RUSTC_WRAPPER=sccache
	cargo build --frozen --release --features video-textures
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname-renderer"
	mkdir -p -m 755 "$pkgdir/usr/share/$_pkgname/"
	cp -r "crates/renderide/assets/models" "$pkgdir/usr/share/$_pkgname/"
	cp -r "crates/renderide/assets/xr" "$pkgdir/usr/share/$_pkgname/"
	chmod -R a=rX,u+w "$pkgdir/usr/share/$_pkgname/"
	install -Dm0755 -t "$pkgdir/usr/share/applications" "$srcdir/renderide.desktop"
	install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
