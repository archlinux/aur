# Maintainer: Kaique Lopes Bazilio

pkgname=2d-mmo-launcher
pkgver=0.2.0
pkgrel=1

pkgdesc="Launcher extensível para instalar e executar MMORPGs 2D no Linux"
arch=('x86_64')
url="https://github.com/nkaique21/2D-MMO-Launcher"
license=('MIT')

depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'hicolor-icon-theme'
)

makedepends=(
  'cargo'
  'rust'
  'nodejs'
  'npm'
  'dotnet-sdk'
  'fish'
)

provides=('2d-mmo-launcher')
conflicts=(
  '2d-mmo-launcher-bin'
  '2d-mmo-launcher-git'
)

# O LTO do makepkg quebra bibliotecas nativas usadas pelo projeto,
# especialmente ring, SQLite, LZMA e Zstandard.
options=('!lto')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nkaique21/2D-MMO-Launcher/archive/refs/tags/v${pkgver}.tar.gz"
  '2d-mmo-launcher.desktop'
)

sha256sums=('dbcd053317d49d4152f7105b8342a16f085863670ab5d51ddfbfd7522ce4fabe'
            '7bd9e8bedc09e7790a515fc24897e7255492850f2a07d74d926a61ac4a9332d3')

build() {
  cd "${srcdir}/2D-MMO-Launcher-${pkgver}"

  npm ci

  fish ./scripts/build-windows-launch-bridge.fish

  npm run tauri -- build --no-bundle
}

package() {
  cd "${srcdir}/2D-MMO-Launcher-${pkgver}"

  install -Dm755 \
    'src-tauri/target/release/two-d-mmo-launcher' \
    "${pkgdir}/usr/bin/two-d-mmo-launcher"

  install -d \
    "${pkgdir}/usr/lib/2D MMO Launcher/manifests"

  cp -a \
    src-tauri/manifests/. \
    "${pkgdir}/usr/lib/2D MMO Launcher/manifests/"

  install -Dm755 \
    'src-tauri/resources/WindowsLaunchBridge.exe' \
    "${pkgdir}/usr/lib/2D MMO Launcher/resources/WindowsLaunchBridge.exe"

  install -Dm644 \
    'src-tauri/icons/32x32.png' \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/two-d-mmo-launcher.png"

  install -Dm644 \
    'src-tauri/icons/128x128.png' \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/two-d-mmo-launcher.png"

  install -Dm644 \
    'src-tauri/icons/icon.png' \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/two-d-mmo-launcher.png"

  install -Dm644 \
    "${srcdir}/2d-mmo-launcher.desktop" \
    "${pkgdir}/usr/share/applications/2d-mmo-launcher.desktop"

  install -Dm644 \
    'LICENSE' \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
