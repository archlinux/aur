# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

_pkgname=https-everywhere
pkgname=firefox-extension-${_pkgname}
pkgver=5.1.4
pkgrel=1
_file=403754
pkgdesc="Plugin for firefox which ensures you are using https whenever it's possible."
license=('GPL2')
arch=('any')
url="https://www.eff.org/https-everywhere"
depends=("firefox")
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/${_file}/${_pkgname/-/_}-${pkgver}-an+tb+sm+fx.xpi")
noextract=("${_pkgname}-${pkgver}.xpi")
sha256sums=('0e2cd19dfa5fedfbfa374971d804951ce4177a6ce44a048c6b43e19bbecf4534')

prepare() {
  cd "$srcdir"

  unzip -qqo "${_pkgname}-${pkgver}.xpi" -d "${_pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}"

  _extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' ${_pkgname}-${pkgver}/install.rdf)"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  # Should this extension be unpacked or not?
  if grep '<em:unpack>true</em:unpack>' ${_pkgname}-${pkgver}/install.rdf > /dev/null; then
    install -dm755 "${_extension_dest}"
    cp -R ${_pkgname}-${pkgver}/* "${_extension_dest}"
    chmod -R ugo+rX "${_extension_dest}"
  else
    install -Dm644 ${_pkgname}-${pkgver}.xpi "${_extension_dest}.xpi"
  fi
}
