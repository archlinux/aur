# Repository managed by ceres-c, forked from florentbr
# Maintainer: Federico Cerutti <aur $at$ ceres-c $dot-Italy-tld$>
pkgname=owon-vds-tiny
_gitname='OWON-VDS1022'
pkgver=1.1.5.cf19
pkgrel=1
pkgdesc="OWON VDS1022(I)/VDS2052 oscilloscope application"
arch=(x86_64 i386 aarch64)
url="https://github.com/ceres-c/OWON-VDS1022"
license=('unknown')
depends=('libusb-compat' 'java-runtime>=8')
optdepends=('python-bokeh: python apis'
			'python-pandas: python apis'
			'python-matplotlib: python apis'
			'python-streamz: python apis')
provides=("${pkgname}")
install="${pkgname}.install"
source=('git+https://github.com/ceres-c/OWON-VDS1022.git'
		'owon-vds-tiny'
		'70-owon-vds-tiny.rules'
		'owon-vds-tiny.desktop'
		'owon-vds-tiny.appdata.xml')
sha256sums=('SKIP'
			'9f2135f9aa746a99ea02afb04551075c9b94869c700eaa7d79f091c7b271d3c6'
			'9ccda99bdeeb8c5f1406f57d16e7c20acc4649acce9abf09a9028319172e6fef'
			'c4636ba5a29afdea5b414f13ad96159d58a1a9c1b21a349107832b3c04260579'
			'13643b2d958e27de8cb635784cdf9bc83629b086474b780617c7726bb11f2843')
package() {
	# Install files
	install -dm755 "${pkgdir}/usr/lib/${pkgname}/"

	install -dm755 "${pkgdir}/usr/share/${pkgname}/api"
	cp -dpr --no-preserve=ownership "$srcdir/$_gitname/api/." "${pkgdir}/usr/share/${pkgname}/api"
	install -dm755 "${pkgdir}/usr/share/${pkgname}/doc"
	cp -dpr --no-preserve=ownership "$srcdir/$_gitname/doc/." "${pkgdir}/usr/share/${pkgname}/doc"
	install -dm755 "${pkgdir}/usr/share/${pkgname}/fwr"
	cp -dpr --no-preserve=ownership "$srcdir/$_gitname/fwr/." "${pkgdir}/usr/share/${pkgname}/fwr"

	install -dm755 "${pkgdir}/usr/lib/${pkgname}/"
	if [[ $CARCH == "x86_64" ]] # Accomodate for different lib path names
	then
		cp -dpr --no-preserve=ownership "$srcdir/$_gitname/lib/linux/amd64/." "${pkgdir}/usr/lib/${pkgname}/"
	elif [[ $CARCH == "aarch64" ]]
	then
		cp -dpr --no-preserve=ownership "$srcdir/$_gitname/lib/linux/arm64/." "${pkgdir}/usr/lib/${pkgname}/"
	elif [[ $CARCH == "i386" ]]
	then
		cp -dpr --no-preserve=ownership "$srcdir/$_gitname/lib/linux/i386/." "${pkgdir}/usr/lib/${pkgname}/"
	fi

	install -dm755 "${pkgdir}/usr/share/${pkgname}/lib"
	install -Dm644 "$srcdir/$_gitname/lib/ch.ntb.usb-0.5.9.jar" "${pkgdir}/usr/share/${pkgname}/lib/ch.ntb.usb-0.5.9.jar"
	install -Dm644 "$srcdir/$_gitname/lib/gson-2.7.0.jar" "${pkgdir}/usr/share/${pkgname}/lib/gson-2.7.0.jar"
	install -Dm644 "$srcdir/$_gitname/lib/jxl-2.6.6.jar" "${pkgdir}/usr/share/${pkgname}/lib/jxl-2.6.6.jar"
	install -Dm644 "$srcdir/$_gitname/lib/libusbJava-src.zip" "${pkgdir}/usr/share/${pkgname}/lib/libusbJava-src.zip"
	install -Dm644 "$srcdir/$_gitname/lib/owon-vds-tiny-1.1.5-cf19.jar" "${pkgdir}/usr/share/${pkgname}/lib/owon-vds-tiny-1.1.5-cf19.jar"

	install -Dm644 "$srcdir/$_gitname/version.txt" "${pkgdir}/usr/share/${pkgname}/version.txt"
	install -Dm755 "$srcdir/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "$srcdir/70-${pkgname}.rules" "${pkgdir}/etc/udev/rules.d/70-${pkgname}.rules"

	# Copy desktop files
	install -Dm644 "$srcdir/$_gitname/ico/icon-48.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 "$srcdir/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "$srcdir/${pkgname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname}.appdata.xml"
}
