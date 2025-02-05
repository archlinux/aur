# Maintainer: 3xg3lin <3xg3lin@m.kemalinaskerleri.com>
# Used sample from aur-fd-scripts - https://git.respiranto.de/aur-fd-scripts.git/

_lang=eng-tur
pkgname="dict-freedict-${_lang}"
_pkgver=0.3
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="English -> Turkish dictionary for dictd et al. from FreeDict.org"
arch=("any")
url="https://freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('freedict-tools')
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.src.tar.xz")
_tarball="freedict-${_lang}-${_pkgver}.src.tar.xz"
noextract=("freedict-${_lang}-${_pkgver}.src.tar.xz")
sha512sums=('48f65bbe0be36c49498aa29e67d268532ad40ab1b4d7f2767f859eaa915491b33b62b498053052368fa839b77116c6b668f61879ee0113d1f409e6f4f45257a3')

prepare(){
	# for some reason, bsdtar cannot unpack this file:
	tar -xf "${_tarball}"
	# with "Skipping hardlink pointing to itself" errors
	# see https://wiki.archlinux.org/index.php/PKGBUILD#noextract
}
build()
{
	cd "$_lang"
	make FREEDICT_TOOLS=/usr/lib/freedict-tools build-dictd
}

package() {
	install -m 755 -d "${pkgdir}/usr/share/dictd"
	install -m 644 -t "${pkgdir}/usr/share/dictd/" \
		"${_lang}/build/dictd/${_lang}".{dict.dz,index}	

	for file in ${_lang}/{AUTHORS,README,NEWS,ChangeLog}; do
        if [[ -f "$file" ]]; then
            install -m 644 -Dt "${pkgdir}/usr/share/doc/freedict/${_lang}/" "$file"
        fi
    done
}
