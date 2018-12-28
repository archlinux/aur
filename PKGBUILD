# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: Jan Keith Darunday <jkcdarunday@gmail.com>
# Contributor: Enrico Morelli     <morelli@cerm.unifi.it>
pkgname=dict-foldoc
pkgver=20181224_000006
pkgrel=2
pkgdesc="The Free On-line Dictionary of Computing for dictd et al."
arch=('any')
url="https://foldoc.org/"
license=('custom: FDL1.1+')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'sed')
provides=('dictd-foldoc')
conflicts=('dictd-foldoc')
install=${pkgname}.install

# Calculate the version now in order to make sources belonging to different
# versions distinguishable.
_datestr="$(curl -sI foldoc.org/Dictionary \
	| sed -nE 's/^[Ll]ast-[Mm]odified: (.*)$/\1/p')"
_var_pkgver=$(date --utc --date="$_datestr" +%Y%m%d_%H%M%S)
_srcfile=Dictionary-${_var_pkgver}

source=("${_srcfile}::https://foldoc.org/Dictionary"
        'fix_misspellings.sed'
				'extract_license.sed')
sha512sums=('SKIP'
            'b68d7356cfa5664de8ca87aa941c208edcec8e79761d616728ff5f9dfbc4878c07cae91fff79872044e889d25d4b63b1b5c36917867d47a8d157815f2840a711'
            '5dc4a4e112ca7046a0e0bbc9f3d3464916764e00d72a47794b91a5aac9608b1cf15e4659788529b9f904c8aee3949e6f360ab5872308f524549f742a3b780a1f')

prepare()
{
	./extract_license.sed < $_srcfile > LICENSE

	# Correct some misspellings.
	./fix_misspellings.sed -i $_srcfile
}

pkgver()
{
	echo $_var_pkgver
}

build()
{
	_datestr=$(date --utc --date=${pkgver%_*} +%Y-%m-%d)

	dictfmt < $_srcfile -f \
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
	install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
