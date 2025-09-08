# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: Jan Keith Darunday <jkcdarunday@gmail.com>
# Contributor: Enrico Morelli     <morelli@cerm.unifi.it>
pkgname=dict-foldoc
pkgver=20250828_233216
pkgrel=1
pkgdesc="The Free On-line Dictionary of Computing for dictd et al."
arch=('any')
url="https://foldoc.org/"
license=('GFDL-1.1-no-invariants-or-later')
optdepends=('dictd: dict client and server')
makedepends=('dictd')
provides=('dictd-foldoc')
conflicts=('dictd-foldoc')
install=${pkgname}.install

# Calculate the version now in order to make sources belonging to different
# versions distinguishable.
_datestr="$(curl -sI https://foldoc.org/Dictionary \
	| sed -nE 's/^[Ll]ast-[Mm]odified: (.*)$/\1/p')"
_var_pkgver=$(date --utc --date="$_datestr" +%Y%m%d_%H%M%S)
_srcfile=Dictionary-${_var_pkgver}

source=("${_srcfile}::https://foldoc.org/Dictionary"
        'fix_misspellings.sed')
sha512sums=('SKIP'
            'b68d7356cfa5664de8ca87aa941c208edcec8e79761d616728ff5f9dfbc4878c07cae91fff79872044e889d25d4b63b1b5c36917867d47a8d157815f2840a711')

prepare()
{
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
		--allchars -u https://foldoc.org/Dictionary \
		-s "The Free On-line Dictionary of Computing (${_datestr})" \
		--utf8 foldoc

	dictzip -v foldoc.dict
}

package()
{
	install -m 755 -d "${pkgdir}/usr/share/dictd"
	install -m 644 -t "${pkgdir}/usr/share/dictd/" foldoc.{dict.dz,index}
}
