# Maintainer: Bernd Amend <berndamend gmail com>

pkgname=samsung-unified-driver
pkgver=1.00.35
pkgrel=1

pkgdesc="Unified Linux Driver for Samsung printers and scanners."
arch=(i686 x86_64)
url="http://www.samsung.com"
license=('custom:samsung')
depends=('libxml2' 'libusb-compat' 'cups' 'sane')

options=(!strip)

if [ "$CARCH" = "i686" ]; then
	CARCHCUSTOM="i386"
	sha512sums=('dd01081dede31bc0ce8181df4c834627478d141f3c27a53642b91850ecf94f0f495f3237357f0f0a1b6499c0b65f32e644159f911962bf60f4f43524fed339ed'
            '91aae9117f7468a870c7ce23a220870bb9a9c945e2f558b2d20d659308c1501ece59c579ab86511b4e2cd374a8b5edabed23c622c932d9cf26e57fcc9d942df3'
            '4bc511981d5ce81f283e764f6cf90d8186df57a673ed75e212777124ba3751beb0601bce75c232cf7bbed00e0646f3e2ed6bf2f361fdf2deabd31ca06d24d4d8')
else
	CARCHCUSTOM="amd64"
	sha512sums=('449c15f1866ff580bb57896ca00df9fae7439df998bca9e0e50dca0ad025d31c55839dd85c26769fac7499f213d8ab2ae531a706831818d2e39c7aade8b3e09b'
            '91aae9117f7468a870c7ce23a220870bb9a9c945e2f558b2d20d659308c1501ece59c579ab86511b4e2cd374a8b5edabed23c622c932d9cf26e57fcc9d942df3'
            '4bc511981d5ce81f283e764f6cf90d8186df57a673ed75e212777124ba3751beb0601bce75c232cf7bbed00e0646f3e2ed6bf2f361fdf2deabd31ca06d24d4d8')
fi

suld_arch="suld-driver2-${pkgver}_${pkgver}-1_${CARCHCUSTOM}.deb"
suld_ppd="suld-ppd-4_${pkgver}-1_all.deb"
suld_common="suld-driver2-common-1_1-5_all.deb"

source=("http://www.bchemnet.com/suldr/pool/debian/extra/su/${suld_arch}"
	"http://www.bchemnet.com/suldr/pool/debian/extra/su/${suld_ppd}"
	"http://www.bchemnet.com/suldr/pool/debian/extra/su/${suld_common}"
	)
noextract=("${source[@]%%::*}")

package() {
	# common
	rm -rf common
	mkdir common
	cd common
	ar x "../${suld_common}"
	tar xf data.tar.xz
	install -d "${pkgdir}/usr/lib/udev/rules.d"
	install -m 644 -t "${pkgdir}/usr/lib/udev/rules.d/" etc/udev/rules.d/60_smfp_samsung.rules
	
	install -d "${pkgdir}/etc/sane.d/dll.d"
	install -m 644 -t "${pkgdir}/etc/sane.d/" etc/sane.d/xerox_mfp-smfp.conf
	install -m 644 -t "${pkgdir}/etc/sane.d/dll.d" etc/sane.d/dll.d/*
	
	install -d "${pkgdir}/usr/share/licenses/samsung-unified-driver"
	install -m 644 -t "${pkgdir}/usr/share/licenses/samsung-unified-driver" usr/share/doc/suld-driver2/eula-fr.txt usr/share/doc/suld-driver2/copyright.gz
	install -m 644 usr/share/doc/suld-driver2/eula.txt "${pkgdir}/usr/share/licenses/samsung-unified-driver/LICENSE"
	
	install -d "${pkgdir}/usr/share/locale/fr/LC_MESSAGES/"
	install -m 644 -t "${pkgdir}/usr/share/locale/fr/LC_MESSAGES/" usr/share/locale/fr/LC_MESSAGES/sane-smfp.mo
	
	install -d "${pkgdir}/usr/share/doc/samsung-unified-driver/"
	install -m 644 -t "${pkgdir}/usr/share/doc/samsung-unified-driver/" usr/share/doc/suld-driver2/changelog.gz
	cd ..

	# ppd
	rm -rf ppd
	mkdir ppd
	cd ppd
	ar x "../${suld_ppd}"
	tar xf data.tar.xz -C "${pkgdir}"
	cd ..
	
	# arch
	rm -rf arch
	mkdir arch
	cd arch
	ar x "../${suld_arch}"
	tar xf data.tar.xz -C "${pkgdir}"
	chmod 644 "${pkgdir}/etc/sane.d/smfp.conf"
	cd ..
}
