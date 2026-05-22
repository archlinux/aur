# Maintainer: Goodarz <1831847+a-goodarzi@users.noreply.github.com>

pkgname=jottr
pkgver=2.1.2
pkgrel=1
pkgdesc='Simple text editor for writers, journalists and researchers'
arch=('any')
url='https://github.com/mfat/jottr'
license=('GPL-3.0-only')
depends=(
  'bash'
  'hicolor-icon-theme'
  'python'
  'python-feedparser'
  'python-pyenchant'
  'python-pyqt5'
  'python-pyqt5-webengine'
  'python-pyspellchecker'
  'python-requests'
  'qt5-svg'
)
conflicts=('jottr-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(
  '474440588ea383efe1d94526d1e447042784a407ee3f2fd1076d9412a16b08e4'
)

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -a src/jottr/. "${pkgdir}/usr/share/${pkgname}/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 icons/jottr.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/io.github.mfat.jottr.png"
  install -Dm644 io.github.mfat.jottr.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/bash
args=()
for arg in "$@"; do
  if [[ -f "$arg" ]]; then
    args+=("$(readlink -f "$arg")")
  else
    args+=("$arg")
  fi
done

exec python3 /usr/share/jottr/main.py "${args[@]}"
EOF
}
