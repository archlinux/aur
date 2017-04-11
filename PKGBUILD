# Maintainer: Einhard Leichtfuß <archer@respiranto.de>
pkgname=dict-devils
pkgver=1
_debver=${pkgver}-12
pkgrel=1
pkgdesc="The Devil's Dictionary by Ambrose Bierce for dictd et al."
arch=('any')
url="http://wiretap.area.com/"
license=('custom: Public Domain')
optdepends=('dictd: dict client and server')
makedepends=('dictd')
conflicts=('dictd-devils')
install=${pkgname}.install

source=("http://wiretap.area.com/Gopher/Library/Classic/devils.txt"
        "http://http.debian.net/debian/pool/main/d/dict-devil/dict-devil_1.0-12.debian.tar.gz")
sha512sums=('a48631d40696bf7ebf0a30f464e1ddaccf5971aadf67c2e224bfbbff4c74f75cd68b322b8d1f9c658812590b8bccddf12217aa1a6aef30ce32a92b25c20998cb'
            '7156a48738dcae73c33f36924cc77523c36b0e2fc066793e96d94bd6efca1aaa9c77a62ba988feedaef8488c4269fc785d58b2f17dc5758cfec3bf3f4b1736db')

prepare()
{
	# Extract licensing statement.
	grep -m1 -B1 'Public Domain' devils.txt > LICENSE

	# "Convert" source from symbolic link to a regular file (necessary for
	# patching).
	cp --remove-destination "$(readlink devils.txt)" devils.txt

	# Fix various typographical errors.
	patch -p1 devils.txt debian/patches/debian-changes
}

build()
{
	debian/devil2dict devils.txt devils
	dictzip devils.dict
}

package() {
	install -m 0755 -d "${pkgdir}/usr/share/dictd"
	install -m 0644 -t "${pkgdir}/usr/share/dictd/" devils.{dict.dz,index}
	
	install -m 0755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
