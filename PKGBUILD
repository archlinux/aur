# Maintainer: Melvin Vermeeren <mail@melvinvermeeren.com>
# Edited from: firefox-extension-https-everywhere

_pkgname=enhanced-steam
pkgname=firefox-extension-enhancedsteam
pkgver=7.3
pkgrel=1
pkgdesc="Plugin for firefox that enhances the steam website and adds new functionality."
license=('GPL2')
arch=('any')
url="https://enhancedsteam.com/"
depends=("firefox")
makedepends=("unzip")
source=("https://firefox.enhancedsteam.com/latest/${_pkgname}.xpi")
noextract=("${_pkgname}.xpi")
sha256sums=('bf0aafa3cd971641a8ba58d464c3483150cfbbe7df0328c8097045075d3883ee')

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
