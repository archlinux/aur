#!/bin/sh
# PKGBUILD for AUR -git (development) package
# This is used for the AUR system-bridge-git package
# pkgver is set to 5.0.0+dev is replaced in the update-aur.sh script

pkgname=system-bridge-git
pkgver=5.6.1.r5792.g7c5567e
pkgrel=1
pkgdesc="A bridge for your systems (git version)"
makedepends=('git' 'mise')
source=("$pkgname::git+https://github.com/timmo001/system-bridge.git")
md5sums=('SKIP')
conflicts=('system-bridge' 'system-bridge-debug')

arch=('x86_64')
url="https://github.com/timmo001/system-bridge"
license=('Apache-2.0')
keywords=('system-bridge' 'automation' 'home-assistant' 'api' 'websocket')
depends=('libx11' 'libxtst' 'libxkbcommon' 'libxkbcommon-x11')
provides=('system-bridge')
options=('!strip')

build() {
  cd "$pkgname"
  export MISE_DATA_DIR="${srcdir}/.mise"
  export MISE_CACHE_DIR="${srcdir}/.cache/mise"
  export PATH="${MISE_DATA_DIR}/shims:${PATH}"
  export STATIC_EXPORT=true
  export CGO_ENABLED=1
  mise trust -a
  mise install
  mise exec -C web-client -- bun install --frozen-lockfile
  mise exec -- make build_web_client
  mise exec -- make build_tui
  local version
  version="$(cd "$srcdir/$pkgname" && git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)")"
  mise exec -- go build -v -ldflags="-X 'github.com/timmo001/system-bridge/version.Version=${version}'" -o "system-bridge" .
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
  cd "$srcdir/$pkgname"
  install -Dm755 system-bridge "$pkgdir/usr/bin/system-bridge"
  install -Dm755 system-bridge-tui "$pkgdir/usr/bin/system-bridge-tui"
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
