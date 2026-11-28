# Maintainer: Papilot <https://github.com/PapilotAI/papilot>
pkgname=papilot-bin
pkgver=0.15.0
pkgrel=1
pkgdesc='A desktop workspace for reading and editing LaTeX papers'
arch=('x86_64')
url='https://papilot.ai'
license=('MIT')
depends=('alsa-lib' 'at-spi2-core' 'git' 'gtk3' 'libnotify' 'libsecret' 'libxss'
         'libxtst' 'mesa' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('texlive-bin: compile manuscripts with TeX Live'
            'texlive-binextra: build manuscripts with latexmk')
provides=("papilot=${pkgver}")
conflicts=('papilot')
_deb="Papilot-${pkgver}-linux-amd64.deb"
source=("https://github.com/PapilotAI/papilot/releases/download/v${pkgver}/${_deb}"
        'papilot' 'LICENSE')
noextract=("${_deb}")
sha256sums=('36e1cb981077c8c784b71733542a6983900aab98b462e1fce9efc56efcd27030'
            'ad622fa0b5b6747d3b3c366cacde6b390a0ac491e414be4e2a9a8ab67a8e5d27'
            '65b0962d74726bf248ac48e02f7e794422146edd860786fd84f6d647e78c26f7')
options=('!strip' '!debug')

package() {
  local data
  data=$(ar t "${srcdir}/${_deb}" | grep -x 'data\.tar\.[a-z0-9]\+')
  ar p "${srcdir}/${_deb}" "$data" | bsdtar -xf - -C "$pkgdir" ./opt/Papilot
  chmod -R go-w "${pkgdir}/opt/Papilot"
  chmod 4755 "${pkgdir}/opt/Papilot/chrome-sandbox"

  local entry='./usr/share/applications/ai.papilot.desktop.desktop'
  mkdir -p "${pkgdir}/usr/share/applications"
  ar p "${srcdir}/${_deb}" "$data" | bsdtar -xOf - "$entry" |
    sed 's|^Exec=.*|Exec=/usr/bin/papilot %U|' > "${pkgdir}/usr/share/applications/ai.papilot.desktop.desktop"
  grep -qx 'Exec=/usr/bin/papilot %U' "${pkgdir}/usr/share/applications/ai.papilot.desktop.desktop"
  install -Dm755 "${srcdir}/papilot" "${pkgdir}/usr/bin/papilot"
  install -Dm644 "${pkgdir}/opt/Papilot/resources/desktop/assets/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/papilot.png"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
