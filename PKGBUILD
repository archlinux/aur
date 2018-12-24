# Maintainer: Einhard Leichtfuß <archer@respiranto.de>
# Contributor: Jan Keith Darunday <jkcdarunday@gmail.com>
# Contributor: Enrico Morelli     <morelli@cerm.unifi.it>
pkgname=dict-foldoc
pkgver=20181224_000006
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

# Calculate the version now in order to make sources belonging to different
# versions distinguishable.
_datestr="$(curl -sI foldoc.org/Dictionary | grep "Last-Modified" \
	| cut -c 21-)"
_var_pkgver=$(date --utc --date="$_datestr" +%Y%m%d_%H%M%S)
_srcfile=Dictionary-${_var_pkgver}

source=("${_srcfile}::https://foldoc.org/Dictionary"
        'sedfile'
        'https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt')
sha512sums=('SKIP'
            '94f123fc5d7042e918db098f03f31356953ef3cd09ee388d348797d7c61d414a2f3058009e7050490c52b83d529913f862bde29cfa9ddd9b3e273664d01ee4fd'
            '021a3205572254b975b3d3ad8b616010b9419cb1e3d68c54c64e36b898a1409e3561e8a2023e3efc324d1034d10ff316975e8008a56211f9fe43f316a15061d4')

prepare()
{
	# Correct some misspellings.
	sed -i -f sedfile "${_srcfile}"
}

pkgver()
{
	echo $_var_pkgver
}

build()
{
	_datestr=$(date --utc --date=${pkgver%_*} +%Y-%m-%d)
	cat "${_srcfile}" | dictfmt -f \
		--allchars -u http://foldoc.org/Dictionary \
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
