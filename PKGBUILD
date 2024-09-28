# Maintainer: Riderius <riderius.help@gmail.com>
#
# Used sample from aur-fd-scripts - https://git.respiranto.de/aur-fd-scripts.git/

_lang=eng-rus
pkgname="dict-freedict-${_lang}"
_pkgver=0.3.1
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="English -> Russian dictionary for dictd et al. from FreeDict.org"
arch=('any')
url="https://freedict.org/"
license=('GPL-2.0-or-later')
optdepends=('dictd: dict client and server')
makedepends=('freedict-tools')
# Install file from dict-gcide (https://aur.archlinux.org/cgit/aur.git/tree/dict-gcide.install?h=dict-gcide)
install="${pkgname}.install"
source=("https://download.freedict.org/dictionaries/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.src.tar.xz")
sha512sums=('21bd584c5330d4aa8df87eff36c5367cffc5087794c770420aeafe7966dbaae2512c7f528af62804ebf283cdeedbb7d6ca85b7d4852c2e3dd08ca10a66222527')

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
