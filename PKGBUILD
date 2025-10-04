#!/bin/sh
# PKGBUILD for release package (builds from tagged source)
# This is used for the AUR system-bridge package
# pkgver is set to 5.0.0 is replaced in the update-aur.sh script

pkgname=system-bridge
pkgver=5.1.2
epoch=2
pkgrel=1
pkgdesc="A bridge for your systems"
makedepends=('git' 'go' 'bun-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timmo001/system-bridge/archive/refs/tags/5.1.2.tar.gz")
sha256sums=('2bedbe0919bfda1ef684af61c7ed092c281ae8a0c2540cbda4b2735ba52180f4')
conflicts=('system-bridge-git')

arch=('x86_64')
url="https://github.com/timmo001/system-bridge"
license=('Apache-2.0')
keywords=('system-bridge' 'automation' 'home-assistant' 'api' 'websocket')
depends=('libx11' 'libxtst' 'libxkbcommon' 'libxkbcommon-x11')
provides=('system-bridge')

build() {
  ver="$pkgver"
  ver="${ver/.beta./-beta.}"
  ver="${ver/.alpha./-alpha.}"
  ver="${ver/.rc./-rc.}"
  cd "${srcdir}/${pkgname}-${ver}"
  export STATIC_EXPORT=true
  export CGO_ENABLED=1
  make build_web_client
  go build -v -ldflags="-X 'github.com/timmo001/system-bridge/version.Version=${pkgver}'" -o "system-bridge" .
}

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/16x16/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/48x48/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  ver="$pkgver"
  ver="${ver/.beta./-beta.}"
  ver="${ver/.alpha./-alpha.}"
  ver="${ver/.rc./-rc.}"
  cd "${srcdir}/${pkgname}-${ver}"
  install -Dm755 system-bridge "$pkgdir/usr/bin/system-bridge"
  install -Dm644 .scripts/linux/system-bridge.desktop "$pkgdir/usr/share/applications/system-bridge.desktop"
  install -Dm644 .resources/system-bridge-dimmed.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/system-bridge.svg"
  install -Dm644 .resources/system-bridge-dimmed-16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/system-bridge.png"
  install -Dm644 .resources/system-bridge-dimmed-32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/system-bridge.png"
  install -Dm644 .resources/system-bridge-dimmed-48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/system-bridge.png"
  install -Dm644 .resources/system-bridge-dimmed-128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/system-bridge.png"
  install -Dm644 .resources/system-bridge-dimmed-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/system-bridge.png"
  install -Dm644 .resources/system-bridge-dimmed-512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/system-bridge.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
