# Maintainer: Wilfried SUGNIAUX <wsu at sfr dot fr>
# Forked from: brother-hl4150cdn AUR Package maintained by Frederik Schwan <frederik dot schwan at linux dot com> and Samuel Kesterson <arch@k-labs.com>

pkgname=brother-hl4140cn
pkgver=1.1.1
pkgrel=5
pkgdesc='Brother HL-4140CDN CUPS printer driver'
arch=('i686' 'x86_64')
url='http://support.brother.com/g/b/downloadlist.aspx?c=de&lang=de&prod=hl4150cdn_all&os=127&flang=English'
license=('custom:Brother' 'GPL')
depends=('a2ps' 'cups')
makedepends=('libarchive')
depends_x86_64=('lib32-glibc')
install=brother-hl4140cn.install
source=(0001-brother-hl4140cn.patch
        Brother.license
        https://download.brother.com/welcome/dlf005935/hl4140cnlpr-${pkgver}-${pkgrel}.i386.rpm
        https://download.brother.com/welcome/dlf005937/hl4140cncupswrapper-${pkgver}-${pkgrel}.i386.rpm)
	sha512sums=('e1cc475572b1b613c8f0f33a59bacf4c8d2856f9ea100d6ae189a8c455f07e022fae971af45aa0d105a20a471b9f022bbe7bd05edc4b93b490f231ca32f00c1e'
            '109215f5c3f835b5923d1334ab2812a2faf859a3fa813a214116b44fc3c14a2022deeb0a4a5c6be5a99833cd7b5997cf02b33f2fa13391b7cb02a3cb15e74bb0'
	    '84e3b17e1e2bc2789812e98f406f7d68b273821d4414de44a6e375ff2bfa0bb3ad6444a1a6047185cc47147fc16acaec176185df6f14ab4b698cddd44228db1f'
            'e1c29693e6a5fecc5685ff5e22dd56a1f506275d7dd432a44809b45e45be73967e35679a30758f412011630a440e65d204a39b0ed4523175c63462fbc77986d8'
	    )

build() {
	cd ${srcdir}
	for n in *.rpm; do
		bsdtar xf ${n}
	done

	patch -p1 < 0001-brother-hl4140cn.patch
}

package() {
	install -d ${pkgdir}/usr/share
	cp -R usr/bin ${pkgdir}/usr
	cp -R usr/local/Brother ${pkgdir}/usr/share/Brother

	echo 'Fixing paths...'
	find ${pkgdir} -type f -exec sed -i s#/usr/local/Brother#/usr/share/Brother#g {} \;

	echo 'Installing PPD.'
	mkdir -p ${pkgdir}/usr/share/cups/model/

	PKGDIR=${pkgdir} SRCDIR=${srcdir} DESTDIR=${pkgdir} DRIVER_PREFIX=/usr/share/Brother \
	usr/local/Brother/Printer/hl4140cn/cupswrapper/cupswrapperhl4140cn -s

	rm ${pkgdir}/usr/share/Brother/Printer/hl4140cn/cupswrapper/cupswrapperhl4140cn 
	rm ${pkgdir}/usr/share/Brother/Printer/hl4140cn/inf/setupPrintcapij

	chown root:lp ${pkgdir}/usr/share/Brother/Printer/hl4140cn/inf
	chmod 775 ${pkgdir}/usr/share/Brother/Printer/hl4140cn/inf
	chown daemon:lp ${pkgdir}/usr/share/Brother/Printer/hl4140cn/inf/brhl4140cnrc
	chmod 664 ${pkgdir}/usr/share/Brother/Printer/hl4140cn/inf/brhl4140cnrc
	install -Dm644 Brother.license ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
