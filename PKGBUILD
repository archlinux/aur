# Maintainer: taxin <mbthunter007@gmail.com>

# Upstream release tag and asset name contain a hyphen, which pkgver may not
# contain, so keep the tag in a separate variable.
_tagver=0.2.0-BETA

pkgname=templar-arena-bin
pkgver=0.2.0.BETA
pkgrel=1
pkgdesc="90s-inspired free-to-play multiplayer arena shooter set in a dark fantasy world"
arch=('x86_64')
url="https://github.com/taxin-404/templar-arena-bin"
license=('custom')
depends=('libgl' 'libx11' 'libxcursor')
options=('!strip')
source=(
  "templar-arena-v${_tagver}-linux.zip::https://github.com/taxin-404/templar-arena-bin/releases/download/v${_tagver}/templar-arena-v${_tagver}-linux.zip"
  "templar-arena.png"
  "templar-arena.desktop"
)
sha256sums=('fb179c1dffd4f66437978c097714e98bb004a4f61eba502ad7126851880c3b7a'
  'SKIP'
  'SKIP')

prepare() {
  chmod +x "${srcdir}/Templar Arena.x86_64"
}

package() {
  # game files
  install -dm755 "${pkgdir}/opt/templar-arena"
  cp -r "${srcdir}/Templar Arena_Data" "${pkgdir}/opt/templar-arena/"
  install -Dm755 "${srcdir}/Templar Arena.x86_64" "${pkgdir}/opt/templar-arena/Templar Arena.x86_64"
  install -Dm755 "${srcdir}/UnityPlayer.so" "${pkgdir}/opt/templar-arena/UnityPlayer.so"

  # wrapper script
  install -dm755 "${pkgdir}/usr/bin"
  cat >"${pkgdir}/usr/bin/templar-arena" <<'EOF'
#!/bin/bash
cd /opt/templar-arena
exec "/opt/templar-arena/Templar Arena.x86_64" "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/templar-arena"

  # icon
  install -Dm644 "${srcdir}/templar-arena.png" "${pkgdir}/usr/share/pixmaps/templar-arena.png"

  # desktop entry
  install -Dm644 "${srcdir}/templar-arena.desktop" "${pkgdir}/usr/share/applications/templar-arena.desktop"
}
