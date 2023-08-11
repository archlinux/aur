# Maintainer: laserK <echo 'Y29udGFjdEBrYXJzdGVucHVmYWhsLmRlCg==' | base64 -d>
pkgname=multiprofiler
pkgver=1.3.60
pkgrel=2
epoch=
pkgdesc="Customization and color management tool for NEC PA series monitors"
arch=('i686' 'x86_64')
url="http://www.necdisplay.com/support-and-services/multi-profiler/overview"
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
source=("http://update.necdisplay.com/multiprofiler/NEC_MultiProfiler_Linux_x64_v$pkgver.tar.gz"
	"multiprofiler.png"
	"54-multiprofiler.rules")
noextract=()
sha512sums=('d1f12ecf5d79f5b7ddad5887a52c37cf456673b065a8bf16eda2db45bafe1636d511a17eaa59a9a4b2804997eb18518fb95f1e43600327bf0e356b7be486011b'
            'e2f2b7fe1b82b5ca3a422cb3cf30b20f006a27d36fed21d19847147f85e93a10b3e8cbc8930e31f0b1f62a5a643866a0d0071bac61d448d64b9ae3ea1c805312'
            '5532707d284c6918f8627dabd0f15f7e591f747eb99a56a3e2cbf26cd47fc33801538c66da37daf8c003528ce4ecc54394e43fd3ec5ff3c17d1640c99304ff94')
validpgpkeys=()

prepare() {
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --categories "Utility;Graphics"
	
}

package() {
	#install modified udev rules (660 rather than 666 for NEC devices and all i2c devices)
	install -dm755 "$pkgdir/etc/udev/rules.d/"
	install -Dm644 "54-multiprofiler.rules" "$pkgdir/etc/udev/rules.d/"

	# there is a space between the major and minor version tag
	rm -f $srcdir/NEC_MultiProfiler_V1.3.60_170424_Linux_x64
	if [ -d "$srcdir/NEC_MultiProfiler_V1 .3.60_170424_Linux_x64/" ]; then
		echo hello
		mv "$srcdir/NEC_MultiProfiler_V1 .3.60_170424_Linux_x64/" "$srcdir/NEC_MultiProfiler_V1.3.60_170424_Linux_x64"
	fi

	cd $srcdir/NEC_MultiProfiler_V${pkgver}_[0-9][0-9][0-9][0-9][0-9][0-9]_Linux_x64/
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/$pkgname"
	install -dm755 "$pkgdir/usr/share/pixmaps"
	install -dm755 "$pkgdir/usr/share/applications"

	install -Dm755 NEC_MultiProfiler_x64/BUILD_B/MultiProfiler /$pkgdir/usr/share/$pkgname/
	install -Dm755 NEC_MultiProfiler_x64/BUILD_B/cmdlineddclite /$pkgdir/usr/share/$pkgname/

	#i2c kernel module is needed to access the DDC from userspace
	install -dm755 "$pkgdir/etc/modules-load.d/"
	echo "i2c-dev" > "$pkgdir/etc/modules-load.d/55-multiprofiler.conf"
	chmod 644 "$pkgdir/etc/modules-load.d/55-multiprofiler.conf"

	#desktop icon
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	ln -s "/usr/share/$pkgname/MultiProfiler" "$pkgdir/usr/bin/$pkgname"
	install -D -m644 NEC_MultiProfiler_x64/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
