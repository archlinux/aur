# Maintainer: laserK <echo 'Y29udGFjdEBrYXJzdGVucHVmYWhsLmRlCg==' | base64 -d>
pkgname=spectraview2
pkgver=1.1.38
pkgrel=2
epoch=
pkgdesc="Profiling  and color management tool for NEC monitors"
arch=('x86_64')
url="http://www.necdisplay.com/support-and-services/spectra-view-II/Overview"
license=('custom')
groups=()
depends=(qt4)
makedepends=(gendesk)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.necds-engineering.com/spectraview/NEC_SpectraView_Linux_x64_${pkgver}_multilanguage.tar.gz"
	"spectraview2.png"
	"55-spectraview2.rules")
noextract=()
sha512sums=('0dc6e3352dfde3d53d7cadd4eb5b4ff90d913cc14da407e998ff11cc61cea0588b69a700a7f8ff4c7d1369d8774e4665751bd2a3f70b07153c15f447da2a80e1'
            'e2f2b7fe1b82b5ca3a422cb3cf30b20f006a27d36fed21d19847147f85e93a10b3e8cbc8930e31f0b1f62a5a643866a0d0071bac61d448d64b9ae3ea1c805312'
            '85d730af6584b8008acb7499204ef9aa0345cb9bda071210b7cc845293cbc2dcd14d38102bd518eb6a23de603e03617e45d5dc511f96ed105ca1185ef4e1d1bd')
validpgpkeys=()

prepare() {
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --categories "Utility;Graphics"
}

package() {
	#install modified udev rules (660 rather than 666 for NEC devices and all i2c devices)
	install -dm755 "$pkgdir/etc/udev/rules.d/"
	install -Dm644 "55-spectraview2.rules" "$pkgdir/etc/udev/rules.d/"

	cd $srcdir/NEC_SpectraView_V${pkgver}_[0-9][0-9][0-9][0-9][0-9][0-9]_Linux_x64/
	install -dm755 "$pkgdir/usr/bin"	
	install -dm755 "$pkgdir/usr/share/$pkgname"
	install -dm755 "$pkgdir/usr/share/pixmaps"
	install -dm755 "$pkgdir/usr/share/applications"

	install -Dm755 NEC_SpectraView_x64/BUILD_B/SpectraView /$pkgdir/usr/share/$pkgname/
	install -Dm755 NEC_SpectraView_x64/BUILD_B/cmdlineddclite /$pkgdir/usr/share/$pkgname/
	install -Dm755 NEC_SpectraView_x64/BUILD_B/i1d2 /$pkgdir/usr/share/$pkgname/
	install -Dm755 NEC_SpectraView_x64/BUILD_B/i1d3 /$pkgdir/usr/share/$pkgname/
	cp -R         "NEC_SpectraView_x64/BUILD_B/i1d3 Support Files" /$pkgdir/usr/share/$pkgname/
	
	#install libs for x-rite/GretagMacBeth i1 display colorimeters
	cp -R         "NEC_SpectraView_x64/libraries to install/i1d2/." "$pkgdir/usr/lib/"
	cp -R         "NEC_SpectraView_x64/libraries to install/i1d3/." "$pkgdir/usr/lib/"
	chmod -R 755 "$pkgdir/usr/lib/"

	#i2c kernel module is needed to access the DDC from userspace
	install -dm755 "$pkgdir/etc/modules-load.d/"
	echo "i2c-dev" > "$pkgdir/etc/modules-load.d/55-spectraview2.conf"
	chmod 644 "$pkgdir/etc/modules-load.d/55-spectraview2.conf"

	#desktop icon
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	ln -s "/usr/share/$pkgname/SpectraView" "$pkgdir/usr/bin/$pkgname"
	install -D -m644 NEC_SpectraView_x64/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
