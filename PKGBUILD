# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=llm-thalamus
_pkgname=llm_thalamus
pkgver=1.3
pkgrel=1
pkgdesc="Qt desktop GUI for the pi coding agent — rich chat interface using pi --mode rpc"
arch=('any')
url="https://github.com/evertvorster/llm_thalamus"
license=('GPL-3.0-or-later')
depends=(
  'pi-coding-agent'
  'python'
  'pyside6'
  'qt6-webengine'
  'python-markdown-it-py'
  'python-mdit_py_plugins'
  'katex'
  'highlightjs'
  'llm-thalamus-theme'
)
makedepends=('python')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/evertvorster/llm_thalamus/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('0c2d248d79624e66db8552b0728759cf59407ba62f9a9ba3b0aec52c6f7e3a87')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # Pure Python, nothing to build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Install Python sources
  install -dm0755 "${pkgdir}/usr/lib/llm_thalamus"
  cp -a src/. "${pkgdir}/usr/lib/llm_thalamus/"
  find "${pkgdir}/usr/lib/llm_thalamus" -type d -name "__pycache__" -prune -exec rm -rf {} +
  find "${pkgdir}/usr/lib/llm_thalamus" -type f -name "*.py[co]" -delete

  # Install pi-config for local-only mode
  install -dm0755 "${pkgdir}/usr/share/llm-thalamus/pi-config"
  cp -a resources/pi-config/. "${pkgdir}/usr/share/llm-thalamus/pi-config/"

  # Install desktop file
  install -Dm0644 llm_thalamus.desktop "${pkgdir}/usr/share/applications/llm_thalamus.desktop"

  # Install launcher
  install -dm0755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/llm-thalamus" << 'EOF'
#!/bin/sh
exec /usr/bin/python3 /usr/lib/llm_thalamus/llm_thalamus.py "$@"
EOF
  chmod 0755 "${pkgdir}/usr/bin/llm-thalamus"
}
