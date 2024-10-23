# Maintainer: Leonardo Brondani Schenkel <leonardo at schenkel dot net>
pkgname=spectraview2-bin
pkgver=1.1.38
pkgrel=2
epoch=
pkgdesc="Profiling  and color management tool for NEC monitors"
arch=('x86_64')
url="https://www.sharpnecdisplays.us/support-and-services/spectraviewii/4"
license=('LicenseRef-proprietary')
groups=()
depends=(fontconfig freetype2 libice libsm libudev0-shim libusb-compat libxrandr libxrender libxxf86vm)
makedepends=(gendesk)
checkdepends=()
optdepends=()
provides=()
conflicts=(spectraview2)
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.necds-engineering.com/spectraview/NEC_SpectraView_Linux_x64_${pkgver}_multilanguage.tar.gz" "spectraview2.png")
noextract=()
sha512sums=('0dc6e3352dfde3d53d7cadd4eb5b4ff90d913cc14da407e998ff11cc61cea0588b69a700a7f8ff4c7d1369d8774e4665751bd2a3f70b07153c15f447da2a80e1'
            'e2f2b7fe1b82b5ca3a422cb3cf30b20f006a27d36fed21d19847147f85e93a10b3e8cbc8930e31f0b1f62a5a643866a0d0071bac61d448d64b9ae3ea1c805312')
validpgpkeys=()

_pkgname="SpectraView"

prepare() {
	gendesk -f -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc" --categories "Utility;Graphics"
}

package() {
	cd $srcdir/NEC_SpectraView_V${pkgver}_[0-9][0-9][0-9][0-9][0-9][0-9]_Linux_x64/

	# modify udev rules (660 rather than 666 for NEC devices and all i2c devices)
	sed -i 's/MODE="0666"/MODE="0660"/g' NEC_SpectraView_x64/55-NEC.rules
	install -dm755 "$pkgdir/etc/udev/rules.d/"
	install -Dm644 NEC_SpectraView_x64/55-NEC.rules "$pkgdir/etc/udev/rules.d/"

	install -dm755 "$pkgdir/usr/bin"	
	install -dm755 "$pkgdir/usr/lib/$_pkgname"
	install -dm755 "$pkgdir/usr/share/pixmaps"
	install -dm755 "$pkgdir/usr/share/applications"

	install -Dm755 NEC_SpectraView_x64/BUILD_A/SpectraView /$pkgdir/usr/lib/$_pkgname/
	install -Dm755 NEC_SpectraView_x64/BUILD_A/cmdlineddclite /$pkgdir/usr/lib/$_pkgname/
	install -Dm755 NEC_SpectraView_x64/BUILD_A/i1d2 /$pkgdir/usr/lib/$_pkgname/
	install -Dm755 NEC_SpectraView_x64/BUILD_A/i1d3 /$pkgdir/usr/lib/$_pkgname/
	cp -R         "NEC_SpectraView_x64/BUILD_A/i1d3 Support Files" /$pkgdir/usr/lib/$_pkgname/
	
	#install libs for x-rite/GretagMacBeth i1 display colorimeters
	cp -R         "NEC_SpectraView_x64/libraries to install/i1d2/." "$pkgdir/usr/lib/"
	cp -R         "NEC_SpectraView_x64/libraries to install/i1d3/." "$pkgdir/usr/lib/"
	chmod -R 755 "$pkgdir/usr/lib/"

	#i2c kernel module is needed to access the DDC from userspace
	install -dm755 "$pkgdir/etc/modules-load.d/"
	echo "i2c-dev" > "$pkgdir/etc/modules-load.d/55-$_pkgname.conf"
	chmod 644 "$pkgdir/etc/modules-load.d/55-$_pkgname.conf"

	#desktop icon
	install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "$srcdir/spectraview2.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
	ln -s "/usr/lib/$_pkgname/SpectraView" "$pkgdir/usr/bin/"
	install -D -m644 NEC_SpectraView_x64/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
