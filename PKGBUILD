# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_pkgname=https-everywhere
pkgname=firefox-extension-${_pkgname}
pkgver=2021.7.13
pkgrel=1
pkgdesc="Plugin for firefox which ensures you are using https whenever it's possible."
arch=('any')
url="https://www.eff.org/https-everywhere"
license=('GPL2')
groups=('firefox-addons')
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.xpi::https://www.eff.org/files/https-everywhere-${pkgver}-eff.xpi"
        "${_pkgname}-${pkgver}.xpi.sig::https://www.eff.org/files/https-everywhere-${pkgver}-eff.xpi.sig")
noextract=("${_pkgname}-${pkgver}.xpi")
sha256sums=('d5a4044984ce2a7a1261a45bfdd7b6a9682d25d58f1db960c21c22847ceae975'
            'SKIP')
b2sums=('f57dca1ef46005349920b52001d093a92e48ce519d1a9c6703c813ce126ff4ece5aa8447ec40198a602ec833d750fbc4a878147372ad13350799ede53bb97951'
        'SKIP')
validpgpkeys=('1073E74EB38BD6D19476CBF8EA9DBF9FB761A677'  # William Budington <bill@eff.org>
              'CE340E9D077F1DC0F4FA7B030D16CFA2BA1F7420') # Alexis <alexis@eff.org>

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
