# Maintainer: duanluan <duanluan@outlook.com>

pkgname=mastergo-desktop-bin
_pkgname=mastergo
pkgver=1.11.5
pkgrel=1
pkgdesc='MasterGo desktop app repackaged from the official macOS release'
arch=('x86_64')
url='https://mastergo.com/resource'
license=('custom')
depends=(
  'electron31'
  'hicolor-icon-theme'
  'xdg-utils'
)
makedepends=(
  '7zip'
  'nodejs'
)
provides=('mastergo')
conflicts=('mastergo' 'mastergo-uos')
options=('!strip' '!lto')
source=(
  "MasterGo-${pkgver}-mac-arm64.dmg::https://static.mastergo.com/plugins/desktop/macos-arm/MasterGo-${pkgver}.dmg"
  'mastergo.sh'
  'mastergo.desktop'
  'patch-linux-runtime.mjs'
)
noextract=("MasterGo-${pkgver}-mac-arm64.dmg")
sha256sums=(
  '8632932972f3606783b89361a0ffe31952e5e102b627c79a29bf1fde96a30e71'
  '44fd0d776dc07cbe67827f1725447b7dbbd5b736baa649293a8ec5a6a2e000b4'
  '63d97f33c9c1f42c921f748c1567d08402618fbfce6f054fc8e4d307455376b0'
  '2e8b31a2ce5d52bafc22d01195d62cb8dd72f8d0e7bf23c638583b46cdcd26ec'
)

prepare() {
  cd "${srcdir}"
  rm -rf dmg app app-update.yml icon.icns
  mkdir dmg

  7z x -bd -y "MasterGo-${pkgver}-mac-arm64.dmg" -odmg >/dev/null

  local appdir
  appdir="$(find dmg -maxdepth 4 -type d -name 'MasterGo.app' ! -path '*/__MACOSX/*' -print -quit)"
  [[ -n "${appdir}" ]] || {
    echo "Could not find MasterGo.app in upstream dmg"
    return 1
  }

  cp -a "${appdir}/Contents/Resources/app" .
  cp -a "${appdir}/Contents/Resources/app-update.yml" .
  cp -a "${appdir}/Contents/Resources/icon.icns" .

  find app \
    \( -name '.DS_Store' -o -name '._*' -o -name '*:com.apple.*' \) \
    -delete

  node "${srcdir}/patch-linux-runtime.mjs" app
}

package() {
  cd "${srcdir}"

  install -dm755 \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/lib/${pkgname}/resources" \
    "${pkgdir}/usr/share/applications" \
    "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps" \
    "${pkgdir}/usr/share/pixmaps"

  install -Dm755 "${srcdir}/mastergo.sh" \
    "${pkgdir}/usr/bin/mastergo"

  cp -a app \
    "${pkgdir}/usr/lib/${pkgname}/resources/"
  install -Dm644 app-update.yml \
    "${pkgdir}/usr/lib/${pkgname}/resources/app-update.yml"

  install -Dm644 app/package.json \
    "${pkgdir}/usr/share/doc/${pkgname}/package.json"
  install -Dm644 "${srcdir}/mastergo.desktop" \
    "${pkgdir}/usr/share/applications/mastergo.desktop"

  install -Dm644 app/icons/logo.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/mastergo.png"
  install -Dm644 app/img/icons/favicon-32x32.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/mastergo.png"
  install -Dm644 app/icons/logo.png \
    "${pkgdir}/usr/share/pixmaps/mastergo.png"

  if [[ -d "${pkgdir}/usr/lib/${pkgname}/resources/app/local-mcp" ]]; then
    find "${pkgdir}/usr/lib/${pkgname}/resources/app/local-mcp" \
      -type f -name 'mgmcp*' -delete
  fi
}
