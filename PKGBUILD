# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=deu-fra
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=2018_06_06
_pkgver=${pkgver//_/-}
pkgrel=2
pkgdesc="German -> French dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.dictd.tar.xz")
sha512sums=('557b88df8c945a8d2e3ece7a7fab5f70433f67fdcc81ac12e6068eb6c7cfedfc0a84ec75f0273989738efe99e46dfc0c38ff065f7408bb3f40767c0a29f0fab2')

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
