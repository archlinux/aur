# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=deu-fra
pkgname=dict-freedict-${_lang}
pkgver=2017_11_24
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="German -> French dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=${pkgname}.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.src.tar.xz")
sha512sums=('7cef2d5c243e82e18b2aa40aacfd7e02eb25fc926667d6f16123735f01ded5dfbd7d7a215b58fee8158350a23420b91653ef7af2d4fabfa90790271ca013b317')

prepare()
{
	cd $_lang
	sed -i 's/\(10\)\(100\>.*1 mit 100 Nullen\)/\1\^\2/' ${_lang}.tei
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
