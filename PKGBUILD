# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# orphaned: Maintainer: Samuel Kesterson <arch@k-labs.com>

pkgname=brother-hl4150cdn
pkgver=1.1.1
pkgrel=5
pkgdesc='Brother HL-4150CDN CUPS printer driver'
arch=('i686' 'x86_64')
url='http://support.brother.com/g/b/downloadlist.aspx?c=de&lang=de&prod=hl4150cdn_all&os=127&flang=English'
license=('custom:Brother' 'GPL')
depends=('a2ps' 'cups')
makedepends=('libarchive')
depends_x86_64=('lib32-glibc')
install=brother-hl4150cdn.install
source=(0001-brother-hl4150cdn.patch
        Brother.license
        http://download.brother.com/welcome/dlf005939/hl4150cdnlpr-${pkgver}-${pkgrel}.i386.rpm
        http://download.brother.com/welcome/dlf005941/hl4150cdncupswrapper-${pkgver}-${pkgrel}.i386.rpm)
sha512sums=('7c21a135c11c7ac3e868e263a6807163'
			'58796468c65d77c835e5959970b91f36'
			'433c0a17c9d4ada74892072cc71bf042'
			'8f21d5054fb80bb148174a7a597b8fd0')

build() {
	cd ${srcdir}
	for n in *.rpm; do
		bsdtar xf ${n}
	done

	patch -p1 < 0001-brother-hl4150cdn.patch
}

package() {
	install -d ${pkgdir}/usr/share
	cp -R usr/bin ${pkgdir}/usr
	cp -R usr/local/Brother ${pkgdir}/usr/share/Brother

	echo 'Fixing paths...'
	find ${pkgdir} -type f -exec sed -i s#/usr/local/Brother#/usr/share/Brother#g {} \;

	echo 'Installing PPD.'
	mkdir -p ${pkgdir}/usr/share/cups/model/

	{PKGDIR}=${pkgdir} SRCDIR=${srcdir} DESTDIR=${pkgdir} DRIVER_PREFIX=/usr/share/Brother \
	usr/local/Brother/Printer/hl4150cdn/cupswrapper/cupswrapperhl4150cdn -s

	rm ${pkgdir}/usr/share/Brother/Printer/hl4150cdn/cupswrapper/cupswrapperhl4150cdn 
	rm ${pkgdir}/usr/share/Brother/Printer/hl4150cdn/inf/setupPrintcapij

	chown root:lp ${pkgdir}/usr/share/Brother/Printer/hl4150cdn/inf
	chmod 775 ${pkgdir}/usr/share/Brother/Printer/hl4150cdn/inf
	chown daemon:lp ${pkgdir}/usr/share/Brother/Printer/hl4150cdn/inf/brhl4150cdnrc
	chmod 664 ${pkgdir}/usr/share/Brother/Printer/hl4150cdn/inf/brhl4150cdnrc
	install -Dm644 Brother.license ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
