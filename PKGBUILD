# Maintainer: Ramadan Ali <rot13ezqa@ezqa.ny>
pkgname=abcccid
pkgver=2.0.2
pkgrel=4
pkgdesc="AB Circle CCID driver for ABC USB CCID smart card readers"
arch=('x86_64')
url="https://abcircle.com/en/product/2/CIR115B/sim-sized-contact-smart-card-reader/"
license=('LGPL2.1+')
depends=("pcsclite>=1.8.3" "libusb>=1.0.9")
makedepends=("perl") # glibc is dependency of base package, flex is in base-devel group 
provides=("pcsc-ifd-handler")
conflicts=($pkgname-bin)
source=("Circle_Linux_Mac_Driver_v${pkgver}.zip::https://github.com/alicavus/abcccid/releases/download/v${pkgver}/Circle_Linux_Mac_Driver_v${pkgver}.zip")
sha512sums=("d71838213f731b1845ae5fdb4a150bae1d64f591bb143a6212664c9a4b88823a43ab5c4ae1b821ff3a819c995bf32daa12390af8c9a7a5a4eedbf8faecbedbf9")

prepare() {
	# Extracting source tarbal
	find $srcdir -type f -name $pkgname-$pkgver* -exec bsdtar -xf {} \;
	
	# Writing udev rules
	cat << EOF >  udev.rules
# udev rules for CCID devices

# If not adding the device, go away
ACTION!="add", GOTO="pcscd_abcccid_rules_end"
SUBSYSTEM!="usb", GOTO="pcscd_abcccid_rules_end"
ENV{DEVTYPE}!="usb_device", GOTO="pcscd_abcccid_rules_end"

# set USB power management to auto.
ENV{ID_USB_INTERFACES}==":0b0000:", TEST=="power/control", ATTR{power/control}="auto"

# All done
LABEL="pcscd_abcccid_rules_end"
EOF
}

build() {
	cd "$pkgname-$pkgver"
	./configure LEXLIB=""
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dv ../udev.rules ${pkgdir}/usr/lib/udev/rules.d/92_pcscd_abcccid.rules
	install -Dv LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
	
}
