# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
# Contributor: Eschwartz <eschwartz93@gmail.com>

# XXX: The package should be renamed to "...-overbiteff", as that's the
# plugin's real name.
_pkgname=overbiteff
pkgname=firefox-extension-overbite
pkgver=3.1.1695
pkgrel=1
_file=390716
pkgdesc="Gopher plugin for Firefox"
arch=('any')
url="http://gopher.floodgap.com/overbite/"
license=('MPL')
depends=("firefox")
makedepends=('unzip')
source=("https://addons.mozilla.org/firefox/downloads/file/${_file}/${_pkgname}-${pkgver}.xpi")
noextract=("${_pkgname}-$pkgver.xpi")
md5sums=('2394e7956331f606df35130f1c0e673e')

prepare() {
  cd "${srcdir}"
  unzip -qqo "${_pkgname}-${pkgver}.xpi" -d "${_pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}"

  _extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' ${_pkgname}-${pkgver}/install.rdf)"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  if grep '<em:unpack>true</em:unpack>' ${_pkgname}-${pkgver}/install.rdf > /dev/null; then
    install -dm755 "${_extension_dest}"
    cp -R ${_pkgname}-${pkgver}/* "${_extension_dest}"
    chmod -R ugo+rX "${_extension_dest}"
  else
    install -Dm644 ${_pkgname}-${pkgver}.xpi "${_extension_dest}.xpi"
  fi
}
