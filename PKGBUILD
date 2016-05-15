# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Edited from: firefox-extension-https-everywhere

_pkgname=tab_wheel_scroll-20160511.0.0-tb+fx+sm
pkgname=firefox-extension-tabwheelscroll
pkgver=2016.05.11.0.0
pkgrel=1
pkgdesc="Plugin for firefox that allows you to change tabs by scrolling in the tabbar."
license=('MPL')
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/tab-wheel-scroll/"
depends=("firefox")
makedepends=("unzip")
source=("https://addons.cdn.mozilla.net/user-media/addons/6501/${_pkgname}.xpi")
noextract=("${_pkgname}.xpi")
sha256sums=('a11f452ad7bb5c3447cb7b9619f504b49e01f8faaa7f432b914eaaeaefb3fda3')

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
