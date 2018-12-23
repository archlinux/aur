# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=deu-fra
pkgname=dict-freedict-${_lang}
pkgver=2018.09.13
pkgrel=2
pkgdesc="German -> French dictionary for dictd et al. from Freedict.org"
arch=('any')
url="https://freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.src.tar.xz")
sha512sums=('8507e7b2688c13a5e4c6597fafc0685bd51d759566ec45c7dba74a3812483b4e81a1562b72c56a16bb2dcc7729299844a4e61a842c78720d8e69bd71d96ef5c3')

prepare()
{
	cd $_lang
	sed -Ei \
		-e 's/(10)(10)(100\>)(\s+\(10)(Googol.*(1|Eins) mit einem Googol Nullen)/\1^(\2^\3)\4^\5/' \
		-e 's/(10)([1-9][0-9]*)(.*(1|Eins) mit \2 Nullen)/\1\^\2\3/' \
		-e 's/(die Zahl 10)(60)/\1^\2/' \
		${_lang}.tei
}

build()
{
	cd $_lang
	make FREEDICT_TOOLS=/usr/lib/freedict-tools build-dictd
}

package()
{
	install -m 755 -d "${pkgdir}/usr/share/dictd"
	install -m 644 -t "${pkgdir}/usr/share/dictd/" \
		${_lang}/build/dictd/${_lang}.{dict.dz,index}

	for file in ${_lang}/{AUTHORS,README,NEWS,ChangeLog}
	do
		if test -f ${file}
		then
			install -m 644 -Dt "${pkgdir}/usr/share/doc/freedict/${_lang}/" ${file}
		fi
	done
}
