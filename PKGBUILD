# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=deu-fra
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=2017_11_24
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
source=("https://sourceforge.net/projects/freedict/files/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.dictd.tar.xz")
sha512sums=('c90a1f76b26f677acb701209335bb777764154ad9ae1823da06887466422624b834190c1bcf0ff3512e03f0457be11e404cf78656560de2e31fcaec12de14986')

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
