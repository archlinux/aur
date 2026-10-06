# Maintainer: Snoopey
pkgname=omnigent-desktop
pkgver=0.17.0
pkgrel=3
pkgdesc='Desktop client for collaborating with AI agents'
arch=('x86_64')
url='https://github.com/omnigent-ai/omnigent'
license=('Apache-2.0' 'MIT' 'BSD-3-Clause')
depends=('alsa-lib' 'at-spi2-core' 'bash' 'cairo' 'dbus' 'expat' 'glib2' 'glibc'
         'gtk3' 'hicolor-icon-theme' 'libcups' 'libgcc' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
         'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs' 'xdg-utils')
makedepends=('nodejs>=22' 'pnpm')
# Only the former desktop package conflicts; leave future CLI versions alone.
conflicts=('omnigent<=0.17.0-2')
replaces=('omnigent<=0.17.0-2')
options=('!strip' '!debug')
source=("omnigent-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'omnigent-desktop' 'omnigent-desktop.desktop')
sha256sums=('739c0b90554a23012ccf9facbc04ac22ac7222ea0acf4fed4d61eb9ad59d4b41'
            '8393e46f4aac97b93894ca4ef7068fd78ad6f809b3339576171abda089d24654' 'c6eac7eefe6ab74a06f452e1ab106e25e8780c7044dfc337a742b35d9ed354fe')

prepare() {
  cd "omnigent-$pkgver"
  # Keep tool caches inside the sandboxed build directory.
  export XDG_CACHE_HOME="$srcdir/.cache" npm_config_cache="$srcdir/.cache/npm"
  export npm_config_devdir="$srcdir/.cache/node-gyp"
  export ELECTRON_CACHE="$srcdir/.cache/electron" ELECTRON_BUILDER_CACHE="$srcdir/.cache/electron-builder"
  # Keep updates under the Arch package manager's control.
  grep -Fxq '  updatesEnabled: !app.isPackaged || !isDevBuild,' web/electron/src/main.js
  sed -i '/^  updatesEnabled: !app.isPackaged || !isDevBuild,$/c\  updatesEnabled: false, // Updated through the Arch package manager.' web/electron/src/main.js
  PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 pnpm --filter web --filter omnigent-desktop-electron install --frozen-lockfile --store-dir "$srcdir/.pnpm-store"
}

build() {
  cd "omnigent-$pkgver/web/electron"
  # Keep tool caches inside the sandboxed build directory.
  export XDG_CACHE_HOME="$srcdir/.cache" npm_config_cache="$srcdir/.cache/npm"
  export npm_config_devdir="$srcdir/.cache/node-gyp"
  export ELECTRON_CACHE="$srcdir/.cache/electron" ELECTRON_BUILDER_CACHE="$srcdir/.cache/electron-builder"
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
  install -Dm644 "omnigent-$pkgver/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  ln -s /opt/omnigent-desktop/LICENSE.electron.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  ln -s /opt/omnigent-desktop/LICENSES.chromium.html "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
