# Maintainer: Riderius <riderius.help@gmail.com>
#
# Used sample from aur-fd-scripts - https://git.respiranto.de/aur-fd-scripts.git/

_lang=eng-rus
pkgname="dict-freedict-${_lang}"
_pkgver=2025.11.23
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="English -> Russian dictionary for dictd et al. from FreeDict.org"
arch=('any')
url="https://freedict.org/"
license=('CC-BY-SA-3.0')
optdepends=('dictd: dict client and server')
makedepends=('freedict-tools')
# Install file from dict-gcide (https://aur.archlinux.org/cgit/aur.git/tree/dict-gcide.install?h=dict-gcide)
install="${pkgname}.install"
source=("https://download.freedict.org/dictionaries/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.src.tar.xz")
sha512sums=('fdee5ebdbe59c2a4293b875def3befdfddd990f95ecd10eb289eff22d815ed6d31267ca4695af66811ef368dd72b16342210475e044c995831e7931ce0e4bcfe')

build()
{
	cd "$_lang"
	make FREEDICT_TOOLS=/usr/lib/freedict-tools build-dictd
}

package()
{
	install -m 755 -d "${pkgdir}/usr/share/dictd"
	install -m 644 -t "${pkgdir}/usr/share/dictd/" \
		"${_lang}/build/dictd/${_lang}".{dict.dz,index}

	for file in "$_lang"/{AUTHORS,README,NEWS,ChangeLog}
	do
		if test -f "$file"
		then
			install -m 644 -Dt "${pkgdir}/usr/share/doc/freedict/${_lang}/" "$file"
		fi
	done
}
