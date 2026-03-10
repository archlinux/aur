# Maintainer: darkelectron <darkelectron(at)mailfence.com>
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_pkgname=privacybadger
pkgname=firefox-extension-${_pkgname}
pkgver=2026.2.20
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
sha256sums=('752d0e0a2430b96d55649bd87f31b8a4b3a18b7c44451ad07d3c0d9da13f129f'
            'SKIP')
b2sums=('8314ec60fb104d6b51f0f2551e5569e3c0630ff007458953825d192758a1275b155e5cdbb3d77dfce23b9def6e52c88b87d78eb87c532f6a5686f92bee2e1dcb'
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
