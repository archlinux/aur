# Maintainer: Melvin Vermeeren <mail@melvinvermeeren.com>
# Edited from: firefox-extension-https-everywhere

_pkgname=canvasblocker-0.2.1-Release-fx+an
pkgname=firefox-extension-canvasblocker
pkgver=0.2.1
pkgrel=1
pkgdesc="Plugin for firefox that prevents canvas fingerprinting to prevent tracking."
license=('MPL')
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/"
depends=("firefox")
makedepends=("unzip")
source=("https://addons.cdn.mozilla.net/user-media/addons/534930/${_pkgname}.xpi")
noextract=("${_pkgname}.xpi")
sha256sums=('2b503eae89b5602419c09ed5a4e1425036ba15177743b9a2dd71b6bfcc7dcb6c')

prepare() {
	cd "$srcdir"

	unzip -qqo "${_pkgname}.xpi" -d "${_pkgname}"
}

package() {
	cd "${srcdir}"

	_extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' ${_pkgname}/install.rdf)"
	_extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
	# Should this extension be unpacked or not?
	if grep '<em:unpack>true</em:unpack>' ${_pkgname}/install.rdf > /dev/null; then
		install -dm755 "${_extension_dest}"
		cp -R ${_pkgname}/* "${_extension_dest}"
		chmod -R ugo+rX "${_extension_dest}"
	else
		install -Dm644 ${_pkgname}.xpi "${_extension_dest}.xpi"
	fi
}
