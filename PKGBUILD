# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_pkgname=https-everywhere
pkgname=firefox-extension-${_pkgname}
pkgver=2022.5.11
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

b2sums=('d4bd77d85b57c0d8867da718c8b247cf9758d8debbeff9289e92353e3ab0f0a7553d34e4ed2e562238b0a85b740fc4073a6babd8c108de3373ca1a1848c9a117'
        'SKIP')
validpgpkeys=('1073E74EB38BD6D19476CBF8EA9DBF9FB761A677'  # William Budington <bill@eff.org>
              'CE340E9D077F1DC0F4FA7B030D16CFA2BA1F7420') # Alexis Hancock (EFF) <alexis@eff.org>

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
