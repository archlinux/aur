# Maintainer: Riderius <riderius.help@gmail.com>
#
# Used sample from aur-fd-scripts - https://git.respiranto.de/aur-fd-scripts.git/

_lang=eng-rus
pkgname="dict-freedict-${_lang}"
_pkgver=2024.10.10
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
sha512sums=('bfb68bd4fce32785a73e504d827599360963d801757b55d527994eb54cbaeb295d5d43738d295a4be12bfe8584a29ade2283a8a6b11ca8c655614b5e32a44511')

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
