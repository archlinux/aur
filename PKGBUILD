# Maintainer: Moldy <me@colbystuff.us>
pkgname=bluekey
pkgver=0.2.0
pkgrel=1
pkgdesc="Use your PC as a Bluetooth keyboard"
arch=('x86_64')
url="https://github.com/olbyolby/bluekey"
license=("GPL-3.0-or-later")
depends=(bluez)
makedepends=(cargo git)
install=bluekey.install
changelog=
source=("git+https://github.com/olbyolby/bluekey.git#tag=v$pkgver")
sha256sums=('f2c44e309b269d1f8e0a599ce729aa3e1a376b01bc0c62b578a5717ccab245ad')


prepare() {
	
	export RUSTUP_TOOLCHAIN=stable
	(cd bluekey && cargo fetch --locked --target host-tuple)

	sed -i 's|/usr/local/bin/|/usr/bin/|' bluekey/bluekey/install/bluekeyd.service
	sed -i 's|/usr/local/bin/|/usr/bin/|' bluekey/bluekey/install/us.colbystuff.Bluekey.service
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	(cd bluekey && cargo build --frozen --release --all-features)
}



package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "bluekey/target/release/bluekey"
	install -Dm0755 -t "$pkgdir/usr/bin/" "bluekey/target/release/bluekeyd"
	install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "bluekey/bluekey/install/bluekeyd.service"
	install -Dm0644 -t "$pkgdir/usr/share/dbus-1/system.d/" "bluekey/bluekey/install/us.colbystuff.Bluekey.conf"
	install -Dm0644 -t "$pkgdir/usr/share/dbus-1/system-services/" "bluekey/bluekey/install/us.colbystuff.Bluekey.service"
}

