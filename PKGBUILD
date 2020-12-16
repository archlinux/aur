# Maintainer: Ramadan Ali <rot13ezqa@ezqa.ny>
_pkgname=akis
pkgname=${_pkgname}-bin
pkgver=2.0
pkgrel=2
pkgdesc="PKCS#11 library and utility tools for Akis Smartcard"
arch=("x86_64")
url="http://kamusm.bilgem.tubitak.gov.tr/islemler/surucu_yukleme_servisi/"
license=("custom")
depends=("acsccid" "ccid" "pcsclite" "jre11-openjdk")
optdepends=("jre8: to work with uyapeditor")
provides=("akia" "$_pkgname=$pkgver")
source=("akis_2.0_amd64.tar::http://www.akiskart.com.tr/dosyalar/akis_2.0_amd64.tar"
        "libpkcs11wrapper.so::https://static.turkiye.gov.tr/downloads/signlib/linux_x64/libpkcs11wrapper.so"
        "Info.plist.xml")
sha1sums=("a46b1405c348cd9297c6f0b7e50863641ca66189"
	  "06c78175a51e14e08ab43f5ae972d0484124aed5"
	  "2b979d6972e5928847f218352c98e0cd4631f5be")

prepare() {
	cat << "EOF" > akia.desktop &&
[Desktop Entry]
Name=Akia
Comment=AKIS smartcard editor
Exec=sh -c "java -jar /usr/share/akis/akia.jar"
Terminal=false
Type=Application
Categories=System;
Keywords=System;Utility
EOF
	
	find . -type f -name ${_pkgname}*$pkgver*.deb -exec bsdtar -xf {} \; &&
	[[ -e data.tar.xz ]] && bsdtar -xf data.tar.xz &&
	install -Dv libpkcs11wrapper.so $srcdir/usr/lib/ &&
	install -Dv Info.plist.xml $srcdir/usr/lib/Info.plist &&
	install -Dv akia.desktop $srcdir/usr/share/applications/akia.desktop &&
	mv  $srcdir/usr/share/doc/akis/copyright $srcdir/usr/share/doc/akis/LICENSE &&
	rm -rfv $srcdir/usr/bin
}

package() {
	mv $srcdir/usr $pkgdir/usr
}
