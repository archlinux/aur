# Maintainer: Riderius <riderius.help@gmail.com>
#
# Used sample from aur-fd-scripts - https://git.respiranto.de/aur-fd-scripts.git/

_lang=rus-eng
pkgname="dict-freedict-${_lang}"
_pkgver=2025.11.23
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
sha512sums=('9adf7a5eda27ccfa3e496b86b2fd575fc0e4af7ac5626a219d44e4ebfd56280deaf67cefd995ab04e9d7ef415e88f8cf0f9cae3252da6221376fd6d0c39012ba')

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
