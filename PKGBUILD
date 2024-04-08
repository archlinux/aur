# Original maintainer: Corentin Cadiou <contact@cphyc.me>
# Current maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=zotero-extension-ocr
_pkgname=zotero-ocr
pkgver=0.7.0
pkgrel=1
pkgdesc="Zotero Plugin for OCR."
arch=(any)
url="https://github.com/UB-Mannheim/zotero-ocr"
license=('AGPL3')
depends=(
    'poppler'
    'tesseract'
)
makedepends=(
    'zip'
)
optdepends=()
groups=("zotero-addons")
source=(
    "${_pkgname}-${pkgver}.xpi::https://github.com/UB-Mannheim/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.xpi"
)
sha256sums=('b649b6a7b75138b65896eca1142999fd5dfa2e0db056c0cea17917a867cc095b')

prepare() {
  # Make sure zotero is not running
  if [[ $(pgrep -c zotero) -gt 0 ]]; then
    echo "Zotero is running, please close it before installing this package."
    exit 1
  fi

  # Edit the defaults to point to the right location
  LOCAL_TESSERACT=$(which tesseract)
  LOCAL_PDFTOPPM=$(which pdftoppm)

  printf 'pref("extensions.zotero.zoteroocr.ocrPath", "%s");\n' $LOCAL_TESSERACT >> defaults/preferences/defaults.js
  printf 'pref("extensions.zotero.zoteroocr.pdftoppmPath", "%s");\n' $LOCAL_PDFTOPPM >> defaults/preferences/defaults.js

  # Update the preferences in the xpi to reflect this
  zip -u ${_pkgname}-${pkgver}.xpi defaults/preferences/defaults.js
}

package() {
    folder=${pkgdir}/usr/lib/zotero/extensions
    mkdir "$folder" -p
    install -Dm644 ${_pkgname}-${pkgver}.xpi "$folder/${_pkgname}@bib.uni-mannheim.de.xpi"
}

# vim:set ts=2 sw=2 et:
