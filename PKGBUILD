# Maintainer: Phillip Davies (ph1lll) <philliptdavies@gmail.com>
pkgname=gswww-git
pkgver=r41.729b2e3
pkgrel=1
pkgdesc="A Graphical Solution to your Wayland Wallpaper Woes"
arch=('x86_64' 'aarch64')
url="https://github.com/Ph1lll/Gswww"
license=('GPL3')
depends=('gcc-libs' 'swww' 'gtk4')
makedepends=('git' 'cargo')
optdepends=('webp-pixbuf-loader: Render .webp images')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!lto)
source=('gswww::git+https://github.com/Ph1lll/Gswww.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/gswww"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/gswww"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/gswww"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --frozen
}

package() {
	cd "$srcdir/gswww"

	install -Dm755 target/release/gswww -t "$pkgdir/usr/bin/"
	install -Dm644 assets/intergration/com.github.Ph1lll.Gswww.png -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 assets/intergration/com.github.Ph1lll.Gswww.desktop -t "$pkgdir/usr/share/applications"
}
