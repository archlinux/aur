# Maintainer: Triss Healy <th+aur@trissyle.gs>
pkgname=display-switch
_cratename=${pkgname/_/-}
pkgver=1.3.1
pkgrel=2
pkgdesc='Turn a $30 USB switch into a full-featured multi-monitor KVM switch'
arch=(x86_64)
url="https://github.com/haimgel/display-switch"
license=('MIT')
depends=(libusb)
# udev for libudev.pc
makedepends=(cargo udev)
backup=("etc/display-switch/display-switch.ini")
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/haimgel/display-switch/tar.gz/refs/tags/$pkgver"
	"$pkgname.sysusers"
	"45-$pkgname.rules"
	"$pkgname.service"
	"display-switch.ini")
sha256sums=('dd9269581ff7a659f26e89d56474cdfe6dc2b486a59bf2119fd8f0c0222379e1'
            'bf5ee4f9876505628c5ce84e84e918c70d66be70b766d62bb138e294608ffbae'
            'af9dbdc771023cd04f5b0c638c30356e6a824b32f0c04ea61fe929c71122bccd'
            '82adef58098d6cb21f9e38459f14844afc43c73df7f2f27eb7bda0107145984c'
            '1ff20643b8b6b1590bcfda26cb2f5323b791040cb164f5b44c944ed9e9b613bc')

prepare() {
	cd "$pkgname-$pkgver"
	# This file sets the expected toolchain. When compiling with
	# rustup this will download that specific version.  When
	# building a arch package we really want to use the user
	# installed rust version though.
	rm rust-toolchain
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 "LICENSE"			-t "$pkgdir/usr/share/licenses/${pkgname}"
	install -Dm644 "README.md"			-t "$pkgdir/usr/share/$pkgname"	    
	install -Dm0755 "target/release/display_switch" -t "$pkgdir/usr/bin/"
	install -Dm644 "$srcdir/display-switch.ini"	-t "$pkgdir/etc/display-switch/"
	install -Dm644 "$srcdir/$pkgname.sysusers"	   "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$srcdir/45-$pkgname.rules"	-t "$pkgdir/usr/lib/udev/rules.d/"
	install -Dm644 "$srcdir/$pkgname.service"	-t "$pkgdir/usr/lib/systemd/system/"
}
