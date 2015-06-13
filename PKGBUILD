# Maintainer: Bernd Amend <berndamend gmail com>

pkgname=samsung-unified-driver
pkgver=1.00.29
pkgrel=3

pkgdesc="Unified Linux Driver for Samsung printers and scanners."
arch=(i686 x86_64 armel)
url="http://www.samsung.com"
license=('custom:samsung')
depends=('libxml2' 'libusb-compat' 'cups' 'sane')

options=(!strip)

if [ "$CARCH" = "i686" ]; then
	CARCHCUSTOM="i386"
	sha512sums=('bc8a30579e6521b8f1a8a769109d2301de002716654e01b4bd3252e94613ce1aa2825c548af4b6724634dcbd18d780cbb06373d1aa52e73535e981da83b024a9' '2dfc7e51e40bad6de51215b81f19dab8dd5d27893a28a46f310d09a531f17711472e25641c35dfeb053d3e7ebcefcb93b821f34b0305389d36c4e866f8e60ab0' 'dc14d68ce68f26d26b89041d94e87ebf88aebaf155e5ba3aeb5b0ca151433dcfe60f753e945e989a9499a3764a3f401e97f24b638588f80258c0cbbd7b84248a'
	)
elif [ "$CARCH" = "armel" ]; then
	CARCHCUSTOM="armel"
	sha512sums=('536b4287440c7850a94c0d8eb64581fa7532df2dcde52f6cdf7ca2360cd3cfd485772aea779f94c79ba3d15ba33ad47c1bbc945625fd7aa6c65f7cc3d9c316b2' '2dfc7e51e40bad6de51215b81f19dab8dd5d27893a28a46f310d09a531f17711472e25641c35dfeb053d3e7ebcefcb93b821f34b0305389d36c4e866f8e60ab0' 'dc14d68ce68f26d26b89041d94e87ebf88aebaf155e5ba3aeb5b0ca151433dcfe60f753e945e989a9499a3764a3f401e97f24b638588f80258c0cbbd7b84248a'
	)
else
	CARCHCUSTOM="amd64"
	sha512sums=('1e93944fb5f52c2cee1f0e1ccca7f2bc0d1058eded742f97454074c43cef2941b370911338c872e32d59cba0ec93f313b9a094a80851c35869517c1bc11b0bb2' '2dfc7e51e40bad6de51215b81f19dab8dd5d27893a28a46f310d09a531f17711472e25641c35dfeb053d3e7ebcefcb93b821f34b0305389d36c4e866f8e60ab0' 'dc14d68ce68f26d26b89041d94e87ebf88aebaf155e5ba3aeb5b0ca151433dcfe60f753e945e989a9499a3764a3f401e97f24b638588f80258c0cbbd7b84248a'
	)
fi

suld_arch="suld-driver2-${pkgver}_${pkgver}-2_${CARCHCUSTOM}.deb"
suld_ppd="suld-ppd-4_${pkgver}-1_all.deb"
suld_common="suld-driver2-common-1_1-4_all.deb"

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
