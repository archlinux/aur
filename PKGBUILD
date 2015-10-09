# Maintainer: Masanori Ohgita <mp[at]ohgita[dot]info>
# Contributor: KISBread <kisbread@gmail.com>
pkgname=libpafe
pkgver=0.0.8
pkgrel=1
pkgdesc="A library for PaSoRi(FeliCa reader) RC-S3* series"
arch=('i686' 'x86_64')
url="http://homepage3.nifty.com/slokar/pasori/libpafe.html"
license=('GPL2')
depends=('libusb')
source=("http://homepage3.nifty.com/slokar/pasori/$pkgname-$pkgver.tar.gz")
md5sums=('9a148ece50962a0ab741ddbca6db0c8f')
install=libpafe.install

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make $MAKEFLAGS
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p $pkgdir/usr/lib/udev/rules.d/
	cat <<'EOF' > "$pkgdir/usr/lib/udev/rules.d/60-libpafe.rules"
ACTION!="add", GOTO="pasori_rules_end"
SUBSYSTEM=="usb_device", GOTO="pasori_rules_start"
SUBSYSTEM!="usb", GOTO="pasori_rules_end"
LABEL="pasori_rules_start"

ATTRS{idVendor}=="054c", ATTRS{idProduct}=="006c", MODE="0664", GROUP="plugdev"
ATTRS{idVendor}=="054c", ATTRS{idProduct}=="01bb", MODE="0664", GROUP="plugdev"
ATTRS{idVendor}=="054c", ATTRS{idProduct}=="02e1", MODE="0664", GROUP="plugdev"

LABEL="pasori_rules_end"
EOF
	make DESTDIR="$pkgdir/" install

}
