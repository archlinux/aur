# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=automaker-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="An autonomous AI development studio that helps you build software faster using AI-powered agents"
arch=('x86_64')
url="https://github.com/AutoMaker-Org/automaker"
license=('MIT')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
)
optdepends=(
  'claude-code-cli: Claude Code CLI for authentication'
  'github-cli: GitHub integration'
)
provides=('automaker')
conflicts=('automaker' 'automaker-git')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/AutoMaker-Org/automaker/releases/download/v${pkgver}/Automaker-${pkgver}-x86_64.AppImage")
sha256sums_x86_64=('1d8160ab3ca35b98117e7d870c8093cf71eccbc8579c701c539b5e843a47ca49')
install=automaker.install

package() {
  chmod 755 "./${pkgname}-${pkgver}.AppImage"
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract

  install -Dm644 "squashfs-root/usr/share/icons/hicolor/1024x1024/apps/automaker.png" \
    "${pkgdir}/usr/share/pixmaps/automaker.png"

  install -Dm644 "squashfs-root/automaker.desktop" \
    "${pkgdir}/usr/share/applications/automaker.desktop"
  sed -i "s|Exec=AppRun --no-sandbox %U|Exec=automaker %U|" \
    "${pkgdir}/usr/share/applications/automaker.desktop"
  sed -i "s|Icon=.*|Icon=automaker|" \
    "${pkgdir}/usr/share/applications/automaker.desktop"

  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/automaker"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/automaker/AppRun" "${pkgdir}/usr/bin/automaker"

  install -Dm644 "squashfs-root/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "${pkgdir}/opt/automaker" -type d -exec chmod 755 {} +
}
