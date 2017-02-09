# Maintainer: Einhard Leichtfuß <archer@respiranto.de>
_lang=eng-deu
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-svn
pkgver=r1487
pkgrel=1
pkgdesc="English -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('subversion' 'dictd' 'freedict-tools')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("svn+https://github.com/freedict/fd-dictionaries/trunk/${_lang}")
md5sums=('SKIP')

pkgver()
{
	cd ${_lang}
	local _ver="$(svnversion)"
	printf "r%s" "${_ver//[[:alpha:]]}"
}

prepare()
{
	ln -s /usr/lib/freedict-tools/{tools,shared} .
}

build()
{
	cd ${_lang}
	make
}

package()
{
	mkdir -p "${pkgdir}/usr/share/dictd"
	cp ${_lang}/${_lang}.{dict.dz,index} "$pkgdir/usr/share/dictd/"

	mkdir -p "${pkgdir}/usr/share/doc/freedict/${_lang}"
	for file in ${_lang}/{AUTHORS,README,NEWS,INSTALL,ChangeLog}
	do
		test -f ${file} && \
			cp -d ${file} "${pkgdir}/usr/share/doc/freedict/${_lang}/"
	done
}
