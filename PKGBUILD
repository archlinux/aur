# Maintainer: 00ein00 <ein420@proton.me>
pkgname=f2p-evo
_pkgname=f2p-evo
pkgver=0.3.27.r172.g0def849 # auto-updated
pkgrel=1
pkgdesc="F2P Evo — unofficial Hytale launcher (Rust + Tauri 2 + Vue 3) with multiplayer, mods, chat, and auto-updates"
arch=('x86_64')
url="https://git.sanhost.net/sanasol/f2p-evo"
license=('custom')
depends=('webkit2gtk-4.1' 'libayatana-appindicator')
makedepends=('rust' 'nodejs' 'git' 'clang' 'pkgconf')
provides=('f2p-evo')
conflicts=('f2p-evo' 'hytale-f2p-git')
replaces=('f2p-evo')
source=("git+$url.git"
  "F2P-Evo.desktop")
sha256sums=('SKIP'
  '1dbc9a72ea40f901584870540e18f309463d011c1bbbe362c19b85e4eff9b3d0')

pkgver() {
  cd "$_pkgname"
  version=$(git describe --abbrev=0 --tags --match "v[0-9]*")
  commits=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "${version#v}" "$commits" "$hash"
}

build() {
  cd "$_pkgname"

  export CC=clang
  export CXX=clang++

  npm ci

  npm run tauri build -- --config '{"bundle":{"active":false}}'
}

package() {
  # Single native binary (everything embedded)
  install -Dm755 "$_pkgname/src-tauri/target/release/f2p-evo" "$pkgdir/usr/bin/f2p-evo"

  # Desktop entry
  install -Dm644 "F2P-Evo.desktop" "$pkgdir/usr/share/applications/F2P-Evo.desktop"

  # Icons (Tauri 2 standard sizes)
  install -Dm644 "$_pkgname/src-tauri/icons/32x32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/f2p-evo.png"
  install -Dm644 "$_pkgname/src-tauri/icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/f2p-evo.png"
  install -Dm644 "$_pkgname/src-tauri/icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/f2p-evo.png"
}
