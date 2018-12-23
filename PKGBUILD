# Maintainer: German Galkin <galkinga at gmail dot com>
pkgname=ricoh-sp150su-sane
pkgver=1.0.22
pkgrel=1
pkgdesc="SANE driver for Ricoh SP150SU series"
arch=('x86_64')
url="http://support.ricoh.com/bb/html/dr_ut_e/re1/model/sp150su/sp150su.htm"
license=('custom')
depends=('sane' 'libusb-compat')
source=("http://support.ricoh.com/bb/pub_e/dr_ut_e/0001294/0001294703/V100/r75389L2.gz"
        "http://support.ricoh.com/bb/html/dr_ut_e/rcn1/ref_html/Agree.htm")
sha256sums=('ade3a9b8b280b2ed8f91ff0a186c763aeda6e3ccb5dea8642e70119ab7967473'
            'dfe55420823dd1c1b43608aa7fda5dd2af052778e601b96810248f5c9fd8f6d2')

_backend_name=alto
_mylibsane=libsane-${_backend_name}.so.${pkgver}

build() {
	echo ${_backend_name} > "$srcdir/${_backend_name}.dll.conf"

	cat <<EOF > "$srcdir/${_backend_name}.conf"
#
# Configuration file for the alto backend
#
# Ricoh SP 150SU
usb 0x05ca 0x0454
# Ricoh SP 150SUw
usb 0x05ca 0x0456
EOF

	cat <<EOF > "$srcdir/48-libsane-ricoh-sp150su.rules"
# Rules for Ricoh SP150SU/SP150SUw MFDs

ACTION!="add", GOTO="rules_end"
ENV{DEVTYPE}=="usb_device", GOTO="rules_begin"
SUBSYSTEM=="usb_device", GOTO="rules_begin"
GOTO="rules_end"

LABEL="rules_begin"

# Ricoh SP150SU
ATTRS{idVendor}=="05ca", ATTRS{idProduct}=="0454", MODE="0664", GROUP="scanner", ENV{libsane_matched}="yes"

# Ricoh SP150SUw
ATTRS{idVendor}=="05ca", ATTRS{idProduct}=="0456", MODE="0664", GROUP="scanner", ENV{libsane_matched}="yes"

LABEL="rules_end"
EOF
}

package() {
	mkdir -p "$pkgdir/usr/lib/sane"
	install -D -m644 "$srcdir/RICOH-SP-150SU-Scan_v1.00/64bit/${_mylibsane}" "$pkgdir/usr/lib/sane/"
	install -D -m644 "$srcdir/RICOH-SP-150SU-Scan_v1.00/64bit/alto_ntdcmsdll.so" "$pkgdir/usr/lib/sane/"
	ln -s "${_mylibsane}" "$pkgdir/usr/lib/sane/libsane-${_backend_name}.so"
	ln -s "${_mylibsane}" "$pkgdir/usr/lib/sane/libsane-${_backend_name}.so.1"

	mkdir -p "$pkgdir/etc/sane.d/dll.d"
	install -D -m644 "$srcdir/${_backend_name}.dll.conf" "$pkgdir/etc/sane.d/dll.d/"
	install -D -m644 "$srcdir/${_backend_name}.conf" "$pkgdir/etc/sane.d/dll.d/"

	mkdir -p "$pkgdir/usr/lib/udev/rules.d"
	install -D -m644 "$srcdir/48-libsane-ricoh-sp150su.rules" "$pkgdir/usr/lib/udev/rules.d/"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install -D -m644 "$srcdir/Agree.htm" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
}
