# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=pineflash
pkgver=0.5.5
pkgrel=4
pkgdesc="A tool to flash ironos to the pinecil soldering iron and possibly other pine64 devices in the future"
arch=('x86_64')
url="https://github.com/Spagett1/PineFlash"
license=('GPL-2.0-or-later')
depends=('glibc' 'gcc-libs' 'bzip2' 'curl' 'systemd-libs' 'libusb' 'blisp')
makedepends=('cargo')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2ddff90832bf1334adad7fa4a60a50560d4b3d1957ff5b642f63981421c23bdd')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	export CXXFLAGS+=" -ffat-lto-ojbects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 target/release/${pkgname} "$pkgdir/usr/bin/${pkgname}"
	install -Dm644 assets/Pineflash.desktop "$pkgdir/usr/share/applications/pineflash.desktop"
	install -Dm644 assets/pine64logo.png "$pkgdir/usr/share/pixmaps/pine64logo.png"
	sed -i 10d "$pkgdir/usr/share/applications/pineflash.desktop"
	echo "TryExec=pineflash" >> "$pkgdir/usr/share/applications/pineflash.desktop"
}
