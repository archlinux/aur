# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgbase=llm-thalamus
pkgname=('llm-thalamus' 'llm-thalamus-theme')
_pkgname=llm_thalamus
pkgver=0.10
pkgrel=3
pkgdesc="Local AI controller and PySide6 UI integrating OpenMemory with Ollama"
arch=('any')
url="https://github.com/evertvorster/llm_thalamus"
license=('GPL-3.0-or-later')
depends=(
  'ollama'
  'python'
  'pyside6'               # Qt6 Python bindings (includes WebEngine bindings) :contentReference[oaicite:0]{index=0}
  'python-markdown-it-py' # markdown-it-py parser
  'python-requests'
  'python-openmemory'  # your OpenMemory wrapper package (AUR)
  'katex'                 # provides /usr/lib/node_modules/katex/dist assets :contentReference[oaicite:1]{index=1}
  'qt6-webengine'         # underlying Qt WebEngine libs :contentReference[oaicite:2]{index=2}
  'highlightjs'           # Javascript highlighting
)
makedepends=('python')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/evertvorster/llm_thalamus/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('c8bb02e41d5a165979b1679820ef82ce116781103c425026443bd0d68efb00f0')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # Pure Python, nothing to build
}

package_llm-thalamus() {
  pkgdesc="Core llm-thalamus daemon and UI"
  depends=('python' 'qt6-base' 'qt6-webengine' 'llm-thalamus-theme')
  
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Use the project Makefile to install everything
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  # Remove graphics
  rm  "$pkgdir/usr/share/llm-thalamus/graphics/llm_thalamus.svg"
  rm  "$pkgdir/usr/share/llm-thalamus/graphics/llm.jpg"
  rm  "$pkgdir/usr/share/llm-thalamus/graphics/thalamus.jpg"
  rm  "$pkgdir/usr/share/llm-thalamus/graphics/inactive.jpg"

}

package_llm-thalamus-theme() {
  pkgdesc="Default 'brain' theme for llm-thalamus"
  depends=('llm-thalamus')
  provides=('llm-thalamus-theme')
  conflicts=('llm-thalamus-theme')

  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm644 llm_thalamus/graphics/llm_thalamus.svg \
    "$pkgdir/usr/share/llm-thalamus/graphics/llm_thalamus.svg"
  install -Dm644 llm_thalamus/graphics/llm.jpg \
    "$pkgdir/usr/share/llm-thalamus/graphics/llm.jpg"
  install -Dm644 llm_thalamus/graphics/thalamus.jpg \
    "$pkgdir/usr/share/llm-thalamus/graphics/thalamus.jpg"
  install -Dm644 llm_thalamus/graphics/inactive.jpg \
    "$pkgdir/usr/share/llm-thalamus/graphics/inactive.jpg"
}
