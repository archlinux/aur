# Maintainer: darkelectron <darkelectron(at)mailfence.com>
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_pkgname=privacybadger
pkgname=firefox-extension-${_pkgname}
pkgver=2023.9.12
pkgrel=1
pkgdesc="Block third party tracking in your browser"
arch=('any')
url="https://www.eff.org/privacybadger"
license=('GPL3')
groups=('firefox-addons')
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.xpi::https://www.eff.org/files/privacy-badger-eff-${pkgver}.xpi"
        "${_pkgname}-${pkgver}.xpi.sig::https://www.eff.org/files/privacy-badger-eff-${pkgver}.xpi.sig")
noextract=("${_pkgname}-${pkgver}.xpi")
sha256sums=('ff7c1cd7bfc23f0592d6c7332fe8be8dacc7f76e258512576ff16812423b79e7'
            'SKIP')
b2sums=('1481088ba54d70a0857fa98751c3940098420539763263f35e69e3ee1cc59426c77b5c5440905d4c5083ab1262557fa15b404e4f95086ed0876656e35c86f3e6'
        'SKIP')
validpgpkeys=('88F8662241B0C16C16E3B5A7950FC3999D80F309') # Alexei <alexei@eff.org>

prepare() {
  cd "$srcdir"

  unzip -qqo "${_pkgname}-${pkgver}.xpi" -d "${_pkgname}-${pkgver}"
}

package() {
  depends=("firefox")
  cd "${srcdir}"

  if [[ -f ${_pkgname}-${pkgver}/install.rdf ]]; then
    _extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' ${_pkgname}-${pkgver}/install.rdf)"
  else
    _extension_id="$(sed -n 's/.*"id": "\(.*\)".*/\1/p' ${_pkgname}-${pkgver}/manifest.json)"
  fi
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  # Should this extension be unpacked or not?
  if grep -q '<em:unpack>true</em:unpack>' ${_pkgname}-${pkgver}/install.rdf 2>/dev/null; then
    install -dm755 "${_extension_dest}"
    cp -R ${_pkgname}-${pkgver}/* "${_extension_dest}"
    chmod -R ugo+rX "${_extension_dest}"
  else
    install -Dm644 ${_pkgname}-${pkgver}.xpi "${_extension_dest}.xpi"
  fi
}
