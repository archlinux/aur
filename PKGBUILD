# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=deu-fra
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=2018_06_06
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="German -> French dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.dictd.tar.xz")
sha512sums=('c5bf2a38b8326e9bcc0bf510f4ae0d8888d8ab84906712265377b6ede4bd551be5bf9ee4abba88477438039d3f39a4b8c05516db2b42bbe2442c6b5024678c02')

prepare()
{
	cd $_lang
	dictzip -d ${_lang}.dict.dz
	sed -i 's/\(10\)\(100\>.*1 mit 100 Nullen\)/\1\^\2/' ${_lang}.dict
	dictzip ${_lang}.dict
}

package()
{
	install -m 755 -d "${pkgdir}/usr/share/dictd"
	install -m 644 -t "${pkgdir}/usr/share/dictd/" \
		${_lang}/${_lang}.{dict.dz,index}

	for file in ${_lang}/{AUTHORS,README,NEWS,ChangeLog}
	do
		if test -f ${file}
		then
			install -m 644 -Dt "${pkgdir}/usr/share/doc/freedict/${_lang}/" ${file}
		fi
	done
}
