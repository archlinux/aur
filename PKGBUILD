#!/bin/sh
# PKGBUILD for release package (builds from tagged source)
# This is used for the AUR system-bridge package
# pkgver is set to 5.0.0 is replaced in the update-aur.sh script

pkgname=system-bridge
pkgver=5.6.1
epoch=2
pkgrel=1
pkgdesc="A bridge for your systems"
makedepends=('git' 'mise')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timmo001/system-bridge/archive/refs/tags/5.6.1.tar.gz")
sha256sums=('2dd752d0032c20d9ee395ee8c0bf42021ea4b990b33af7a7a2e9d6cb3bf10c41')
conflicts=('system-bridge-git' 'system-bridge-git-debug')

arch=('x86_64')
url="https://github.com/timmo001/system-bridge"
license=('Apache-2.0')
keywords=('system-bridge' 'automation' 'home-assistant' 'api' 'websocket')
depends=('libx11' 'libxtst' 'libxkbcommon' 'libxkbcommon-x11')
provides=('system-bridge')
options=('!strip')

build() {
  ver="$pkgver"
  ver="${ver/.beta./-beta.}"
  ver="${ver/.alpha./-alpha.}"
  ver="${ver/.rc./-rc.}"
  cd "${srcdir}/${pkgname}-${ver}"
  export MISE_DATA_DIR="${srcdir}/.mise"
  export MISE_CACHE_DIR="${srcdir}/.cache/mise"
  # Isolate from the building user's global mise config so the build only
  # installs this repo's mise.toml tools (bun, go, node) instead of their
  # entire personal toolset.
  export MISE_CONFIG_DIR="${srcdir}/.config/mise"
  export PATH="${MISE_DATA_DIR}/shims:${PATH}"
  export STATIC_EXPORT=true
  export CGO_ENABLED=1
  mise trust -a
  mise install
  mise exec -C web-client -- bun install --frozen-lockfile
  mise run build_web_client
  mise run build_tui
  mise exec -- go build -v -ldflags="-X 'github.com/timmo001/system-bridge/version.Version=${pkgver}'" -o "system-bridge" .
  ./system-bridge completions bash >system-bridge.bash
  ./system-bridge completions zsh >_system-bridge
  ./system-bridge completions fish >system-bridge.fish
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
  install -Dm755 system-bridge-tui "$pkgdir/usr/bin/system-bridge-tui"
  install -Dm644 system-bridge.bash "$pkgdir/usr/share/bash-completion/completions/system-bridge"
  install -Dm644 _system-bridge "$pkgdir/usr/share/zsh/site-functions/_system-bridge"
  install -Dm644 system-bridge.fish "$pkgdir/usr/share/fish/vendor_completions.d/system-bridge.fish"
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
