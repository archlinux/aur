# Repository managed by Florent - florentbr
# Maintainer: Federico Cerutti <aur $at$ ceres-c $dot-Italy-tld$>
pkgname=owon-vds
_gitname='OWON-VDS1022'
pkgver=1.0.30.cf9.r0.gdf0e1f8
pkgrel=1
pkgdesc="OWON VDS1022(I)/VDS2052 oscilloscope application"
arch=(x86_64 i386 aarch64)
url="https://github.com/florentbr/OWON-VDS1022"
license=('unknown')
depends=('libusb-compat' 'java-runtime>=8')
makedepends=('git')
provides=("${pkgname}")
install=owon-vds.install
source=('git+https://github.com/florentbr/OWON-VDS1022.git'
		'owon-vds'
		'70-owon-vds.rules'
		'owon-vds.desktop'
		'owon-vds.appdata.xml')
sha256sums=('SKIP'
            '82e720a3009c04fa557f99736f766bf0d7affba01295727e74ffa5ffa460c91f'
            '9ccda99bdeeb8c5f1406f57d16e7c20acc4649acce9abf09a9028319172e6fef'
            '259ebefb9a9dd282ab519460bdd860e2ba232a11054f3e0826652c99c472e886'
            'c1d851c032629a7a7ef66d05a18c778f6a66ae09bd81030d5f68f6d72803b4f3')

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	# Install files
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

	install -dm755 "${pkgdir}/usr/share/${pkgname}/fwr"
	cp -dpr --no-preserve=ownership "$srcdir/$_gitname/fwr/." "${pkgdir}/usr/share/${pkgname}/fwr"
	install -dm755 "${pkgdir}/usr/share/${pkgname}/jar"
	cp -dpr --no-preserve=ownership "$srcdir/$_gitname/jar/." "${pkgdir}/usr/share/${pkgname}/jar"
	install -dm755 "${pkgdir}/usr/share/${pkgname}/doc"
	cp -dpr --no-preserve=ownership "$srcdir/$_gitname/doc/." "${pkgdir}/usr/share/${pkgname}/doc"
	install -Dm644 "$srcdir/$_gitname/version.txt" "${pkgdir}/usr/share/${pkgname}/version.txt"
	install -Dm755 "$srcdir/owon-vds" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "$srcdir/70-owon-vds.rules" "${pkgdir}/etc/udev/rules.d/70-${pkgname}.rules"

	# Copy desktop files
	install -Dm644 "$srcdir/$_gitname/ico/icon48.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 "$srcdir/owon-vds.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "$srcdir/owon-vds.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname}.appdata.xml"
}
