# Maintainer: dimtpap <dimtpap@protonmail.com>
pkgname=coppwr
pkgver=1.7.1
pkgrel=1
pkgdesc='Low level PipeWire control GUI'
arch=('x86_64')
url='https://dimtpap.ovh/coppwr'
license=('GPL-3.0-only')
depends=('pipewire' 'libpipewire' 'libxkbcommon' 'libxkbcommon-x11' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
provides=('coppwr')
makedepends=('cargo' 'clang')
optdepends=('xdg-desktop-portal: Camera and Screencast XDP support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dimtpap/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("adfeb504b9fdcad4ce5a390f8011d7e61a0f05c6f96b63e139fd124fa97cd085")

options=(!lto) # The project uses thin LTO and without this won't build

prepare() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "assets/io.github.dimtpap.coppwr.desktop" "$pkgdir/usr/share/applications/io.github.dimtpap.coppwr.desktop"
	install -Dm644 "assets/io.github.dimtpap.coppwr.metainfo.xml" "$pkgdir/usr/share/metainfo/io.github.dimtpap.coppwr.metainfo.xml"
	install -Dm644 "assets/icon/scalable.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.dimtpap.coppwr.svg"
	install -Dm644 "assets/icon/512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/io.github.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/io.github.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/io.github.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/io.github.dimtpap.coppwr.png"
}
