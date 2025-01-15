# Maintainer: Riderius <riderius.help@gmail.com>
#
# Used sample from aur-fd-scripts - https://git.respiranto.de/aur-fd-scripts.git/

_lang=rus-eng
pkgname="dict-freedict-${_lang}"
_pkgver=2024.10.10
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Russian -> English dictionary for dictd et al. from FreeDict.org"
arch=('any')
url="https://freedict.org/"
license=('CC-BY-SA-3.0')
optdepends=('dictd: dict client and server')
makedepends=('freedict-tools>=1:0.7.0')
# Install file from dict-gcide (https://aur.archlinux.org/cgit/aur.git/tree/dict-gcide.install?h=dict-gcide)
install="${pkgname}.install"
source=("https://download.freedict.org/dictionaries/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.src.tar.xz")
sha512sums=('7420ccd4c417bc277fbe042c7c8b794288b726a58db327a93e6e8e65fe5745a25db289aae1ffabeb3b5ea47f2239aa661f861e5609c75289fed2d271719d25d7')

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
