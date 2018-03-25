# Maintainer: Einhard Leichtfuß <archer@respiranto.de>
pkgname=dict-devils
pkgver=1
_deb_srcver=1.0
_debver=${_deb_srcver}-12
pkgrel=1
pkgdesc="The Devil's Dictionary by Ambrose Bierce for dictd et al."
arch=('any')
url="http://wiretap.area.com/"
license=('custom: Public Domain')
optdepends=('dictd: dict client and server')
makedepends=('dictd')
conflicts=('dictd-devils')
install=${pkgname}.install

source=("http://http.debian.net/debian/pool/main/d/dict-devil/dict-devil_${_deb_srcver}.orig.tar.gz"
        "http://http.debian.net/debian/pool/main/d/dict-devil/dict-devil_${_debver}.debian.tar.gz")
sha512sums=('7dad3ab008ba976a0af58377bd206f2870617866b854b8a2cf588f6eefcaaab4a261e9f511b094410c9e454b7ee94b83ec1351774728b171f0e6cdbefa903fd1'
            '7156a48738dcae73c33f36924cc77523c36b0e2fc066793e96d94bd6efca1aaa9c77a62ba988feedaef8488c4269fc785d58b2f17dc5758cfec3bf3f4b1736db')

prepare()
{
	cd dict-devil-${_deb_srcver}

	# Extract licensing statement.
	grep -m1 -B1 'Public Domain' devils.txt > LICENSE

	# Fix various typographical errors.
	patch -p1 devils.txt ../debian/patches/debian-changes
}

build()
{
	cd dict-devil-${_deb_srcver}

	../debian/devil2dict devils.txt devils
	dictzip devils.dict
}

package() {
	cd dict-devil-${_deb_srcver}

	install -m 0755 -d "${pkgdir}/usr/share/dictd"
	install -m 0644 -t "${pkgdir}/usr/share/dictd/" devils.{dict.dz,index}
	
	install -m 0755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
