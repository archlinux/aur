# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Edited from: firefox-extension-https-everywhere

_pkgname=tab_wheel_scroll-20170104.7.46-fx+sm+tb
pkgname=firefox-extension-tabwheelscroll
pkgver=2017.01.04.7.46
pkgrel=1
pkgdesc="Plugin for firefox that allows you to change tabs by scrolling in the tabbar."
license=('MPL')
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/tab-wheel-scroll/"
depends=("firefox")
makedepends=("unzip")
source=("https://addons.cdn.mozilla.net/user-media/addons/6501/${_pkgname}.xpi")
noextract=("${_pkgname}.xpi")
sha256sums=('9d55e7f1f237a602107ac4e4fceeb8cc9abb0cf7ecbb2bb28928da9b68ffde77')

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
