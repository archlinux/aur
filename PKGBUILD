# Maintainer: Sebaguardian <sebaguardian13@gmail.com>
pkgname=arnis
pkgver=2.1.1
pkgrel=1
pkgdesc='Generate any location from the real world in Minecraft'
arch=('x86_64')
url="https://github.com/louis-e/$pkgname"
license=('GPL-3.0-or-later')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/louis-e/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	'rfd.diff'
)
md5sums=('7de021147d884778f2d8b1ff21014be3'
         '38a7579c51ea7dd9977e4236445c1cd0')
makedepends=('cargo')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'cairo' 'gcc-libs' 'glibc' 'openssl' 'glib2' 'gdk-pixbuf2')

prepare() {
	cd "$pkgname-$pkgver"
	patch < "$srcdir/rfd.diff"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
    # cargo fetch --frozen --target "$(rustc -vV | sed -n 's/host: //p')"
	cargo fetch
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release # --frozen
}

package() { 
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
