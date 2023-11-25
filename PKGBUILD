# Maintainer: Dct Mei <dctxmei@yandex.com>
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_pkgname=privacybadger
pkgname=firefox-esr-extension-${_pkgname}
pkgver=2023.10.31
pkgrel=1
pkgdesc="Block third party tracking in your browser"
arch=('any')
url="https://www.eff.org/privacybadger"
license=('GPL3')
#groups=('firefox-addons')
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.xpi::https://www.eff.org/files/privacy-badger-eff-${pkgver}.xpi"
        "${_pkgname}-${pkgver}.xpi.sig::https://www.eff.org/files/privacy-badger-eff-${pkgver}.xpi.sig")
noextract=("${_pkgname}-${pkgver}.xpi")
sha256sums=('63c60cba00474e39b259e7e216880b42b1d7bc3bb117822f2db14719113a6360'
            'SKIP')
b2sums=('d38cf2d00736d29456708ed3a63fb2984ab281d18edf1bb801bbf99fc4a4dd013ee1c5f1387626a7c9a9a3a9640d34cac6a5fd5de11f64c6af89ae1d32760603'
        'SKIP')
validpgpkeys=('88F8662241B0C16C16E3B5A7950FC3999D80F309') # Alexei <alexei@eff.org>

prepare() {
  cd "$srcdir"

  unzip -qqo "${_pkgname}-${pkgver}.xpi" -d "${_pkgname}-${pkgver}"
}

package() {
  depends=("firefox-esr")
  cd "${srcdir}"

  if [[ -f ${_pkgname}-${pkgver}/install.rdf ]]; then
    _extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' ${_pkgname}-${pkgver}/install.rdf)"
  else
    _extension_id="$(sed -n 's/.*"id": "\(.*\)".*/\1/p' ${_pkgname}-${pkgver}/manifest.json)"
  fi
  _extension_dest="${pkgdir}/usr/lib/firefox-esr/browser/extensions/${_extension_id}"
  # Should this extension be unpacked or not?
  if grep -q '<em:unpack>true</em:unpack>' ${_pkgname}-${pkgver}/install.rdf 2>/dev/null; then
    install -dm755 "${_extension_dest}"
    cp -R ${_pkgname}-${pkgver}/* "${_extension_dest}"
    chmod -R ugo+rX "${_extension_dest}"
  else
    install -Dm644 ${_pkgname}-${pkgver}.xpi "${_extension_dest}.xpi"
  fi
}
