# Maintainer: duanluan <duanluan@outlook.com>

pkgname=pokebonk
pkgver=1.2.0
pkgrel=1
pkgdesc='Desktop client for PokéBonk, a 3D survival fan-game'
arch=('x86_64')
url='https://pokebonk.com'
license=('LicenseRef-Proprietary')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=(
  'libappindicator-gtk3: system tray icon support'
)
options=('!strip' '!lto')
source=(
  "PokeBonk-${pkgver}-linux-x86_64.AppImage::https://github.com/CharcherGit/pokebonk-app/releases/download/v${pkgver}/PokeBonk-${pkgver}-linux-x86_64.AppImage"
)
sha256sums=(
  'edf366e1040cfd4053c3cc2e6244781d80aacd01dec07d9849a29019c965502a'
)

package() {
  cd "${srcdir}"
  chmod +x "PokeBonk-${pkgver}-linux-x86_64.AppImage"
  "./PokeBonk-${pkgver}-linux-x86_64.AppImage" --appimage-extract >/dev/null

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a squashfs-root/. "${pkgdir}/opt/${pkgname}/"

  # Electron's sandbox helper must retain its setuid bit for sandboxed renderers.
  chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"

  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/PokeBonk.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/PokeBonk.png"

  install -Dm644 squashfs-root/pokebonk.desktop \
    "${pkgdir}/usr/share/applications/pokebonk.desktop"
  sed -i 's|^Exec=AppRun|Exec=pokebonk|' \
    "${pkgdir}/usr/share/applications/pokebonk.desktop"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/pokebonk"

  install -Dm644 squashfs-root/LICENSE.electron.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 squashfs-root/LICENSES.chromium.html \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
