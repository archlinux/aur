# Maintainer: Melvin Vermeeren <mail@melvinvermeeren.com>
# Edited from: firefox-extension-https-everywhere

_pkgname=tab_wheel_scroll-20140723-fx+sm+tb
pkgname=firefox-extension-tabwheelscroll
pkgver=2014.07.23.1
pkgrel=1
_file=6501
pkgdesc="Plugin for firefox that allows you to change tabs by scrolling in the tabbar."
license=('MPL')
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/tab-wheel-scroll/"
depends=("firefox")
makedepends=("unzip")
install=firefox-extension-tabwheelscroll.install
source=("https://addons.cdn.mozilla.net/user-media/addons/6501/${_pkgname}.xpi")
noextract=("${_pkgname}.xpi")
sha256sums=('89a6dea13adc77d37e643e6ee37b9a2a196b5db174ccca6ad492ef8607c508ad')

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
