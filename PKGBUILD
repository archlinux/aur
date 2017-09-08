# Maintainer: Einhard Leichtfuß <archer@respiranto.de>
# Contributor: Jan Keith Darunday <jkcdarunday@gmail.com>
# Contributor: Enrico Morelli     <morelli@cerm.unifi.it>
pkgname=dict-foldoc
pkgver=20170907_215743
pkgrel=1
pkgdesc="The Free On-line Dictionary of Computing for dictd et al."
arch=('any')
url="https://foldoc.org/"
license=('FDL1.1+')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'sed')
provides=('dictd-foldoc')
conflicts=('dictd-foldoc')
install=$pkgname.install
source=("https://foldoc.org/Dictionary.txt"
        'sedfile'
        'https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt')
sha512sums=('SKIP'
            '94f123fc5d7042e918db098f03f31356953ef3cd09ee388d348797d7c61d414a2f3058009e7050490c52b83d529913f862bde29cfa9ddd9b3e273664d01ee4fd'
            '202fa7520b1c8832d7757efddbb7a72067deec01744a9ffdaefe2def11d199c4b937c22cf39617519e57b9f0e33495403c86e9baca045daf37d0d1328b7a2c71')

pkgver()
{
	_datestr=$(curl -sI foldoc.org/Dictionary.txt | grep "Last-Modified" \
		| cut -c 21-)
	date --utc --date="$_datestr" +%Y%m%d_%H%M%S
}

prepare()
{
	# correct some misspellings
	sed -i -f sedfile Dictionary.txt
}

build()
{
	_datestr=$(date --utc --date="${pkgver%_*}" +%Y-%m-%d)
	cat Dictionary.txt | dictfmt -f \
		--allchars -u http://foldoc.org/Dictionary.txt \
		-s "The Free On-line Dictionary of Computing (${_datestr})" \
		--utf8 foldoc
	dictzip -v foldoc.dict
}

package()
{
	install -m 755 -d "${pkgdir}/usr/share/dictd"
	install -m 644 -t "${pkgdir}/usr/share/dictd/" foldoc.{dict.dz,index}
	install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m 644 fdl-1.1.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
