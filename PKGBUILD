# Maintainer: Snoopey
pkgname=omnigent
pkgver=0.17.0
pkgrel=2
pkgdesc='Omnigent desktop client for AI agents (built from release source)'
arch=('x86_64')
url='https://github.com/omnigent-ai/omnigent'
license=('Apache-2.0')
depends=('alsa-lib' 'gtk3' 'libdrm' 'libxss' 'libxtst' 'mesa' 'nss' 'xdg-utils')
makedepends=('nodejs>=22' 'pnpm')
options=('!strip')
source=("omnigent-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'omnigent-desktop' 'omnigent-desktop.desktop')
sha256sums=('739c0b90554a23012ccf9facbc04ac22ac7222ea0acf4fed4d61eb9ad59d4b41'
            '8393e46f4aac97b93894ca4ef7068fd78ad6f809b3339576171abda089d24654' 'c6eac7eefe6ab74a06f452e1ab106e25e8780c7044dfc337a742b35d9ed354fe')

prepare() {
  cd "omnigent-$pkgver"
  # Keep updates under the Arch package manager's control.
  grep -Fxq '  updatesEnabled: !app.isPackaged || !isDevBuild,' web/electron/src/main.js
  sed -i '/^  updatesEnabled: !app.isPackaged || !isDevBuild,$/c\  updatesEnabled: false, // Updated through the Arch package manager.' web/electron/src/main.js
  PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 pnpm --filter web --filter omnigent-desktop-electron install --frozen-lockfile
}

build() {
  cd "omnigent-$pkgver/web/electron"
  pnpm run build:overlay
  # Upstream release tags may retain an older desktop version.
  pnpm exec electron-builder --linux dir --x64 --publish never --config.extraMetadata.version="$pkgver"
}

check() {
  cd "omnigent-$pkgver/web/electron"
  node --test test/oidc-auth.test.js test/oidc-credentials.test.js
  test -s dist/linux-unpacked/resources/app.asar
  test -x dist/linux-unpacked/omnigent-desktop-electron
}

package() {
  install -d "$pkgdir/opt/omnigent-desktop"
  cp -a "omnigent-$pkgver/web/electron/dist/linux-unpacked/." "$pkgdir/opt/omnigent-desktop/"
  install -Dm755 omnigent-desktop "$pkgdir/usr/bin/omnigent-desktop"
  install -Dm644 omnigent-desktop.desktop "$pkgdir/usr/share/applications/omnigent-desktop.desktop"
  install -Dm644 "omnigent-$pkgver/web/electron/icons/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/omnigent-desktop.svg"
  install -Dm644 "omnigent-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
