# Maintainer: Phillip Davies (ph1lll) <philliptdavies@gmail.com>
pkgname=gswww-git
pkgver=1.3.1.r0.gcd3f318
pkgrel=1
pkgdesc="A Graphical Solution to your Wayland Wallpaper Woes"
arch=('x86_64' 'aarch64')
url="https://github.com/Ph1lll/Gswww"
license=('GPL3')
depends=('gcc-libs' 'swww' 'gtk4')
makedepends=('git' 'cargo')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
options=(!lto)
source=('gswww::git+https://github.com/Ph1lll/Gswww.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gswww"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -Dm644 assets/intergration/Gswww.png -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 assets/intergration/Gswww.desktop -t "$pkgdir/usr/share/applications"
	install -Dm644 assets/intergration/Gswww-open.desktop -t "$pkgdir/usr/share/applications"
}
