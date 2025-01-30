# Maintainer: Sebaguardian <sebaguardian13@gmail.com>
# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=arnis
pkgver=2.2.0
pkgrel=1
pkgdesc='Generate any location from the real world in Minecraft'
arch=('x86_64')
url="https://github.com/louis-e/$pkgname"
license=('Apache-2.0')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/louis-e/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
  "$pkgname.desktop"
)
md5sums=('d4bd8fb901f9caba8baf861298c88715'
         '39de309ef06e34528513e607d903acea')
makedepends=('cargo')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'cairo' 'gcc-libs' 'glibc' 'openssl' 'glib2' 'gdk-pixbuf2' 'wayland')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

package() { 
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"

	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 'icons/icon.png' "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 'icons/128x128.png' "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
