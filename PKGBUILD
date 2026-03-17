# Maintainer: Terromur <terromuroz@proton.me>
# Maintainer: 00ein00 <ein420@proton.me>
pkgname=hytale-f2p-git
_pkgname=hytale-f2p
pkgver=2.4.8.r516.ga2b60ba
pkgrel=1
pkgdesc="Hytale-F2P - unofficial Hytale Launcher for free to play with multiplayer support (This project has been superseded by F2P Evo. Download the new launcher: https://git.sanhost.net/sanasol/f2p-evo/releases/latest)"
arch=('x86_64')
url="https://git.sanhost.net/sanasol/hytale-f2p"
license=('custom')
depends=('at-spi2-core' 'gtk3')
makedepends=('npm' 'jq' 'git' 'libxcrypt-compat' 'nodejs' 'electron-builder')
provides=('hytale-f2p-git')
conflicts=('Hytale-F2P-git')
replaces=('Hytale-F2P-git')
source=("git+$url.git" "Hytale-F2P.desktop")
sha256sums=('SKIP'
  'f1856d4d02f2c66b565e8980dae540c864d7b32d5a1d94c89dc785795b724797')

pkgver() {
  cd "$_pkgname"
  version=$(git describe --abbrev=0 --tags --match "v[0-9]*")
  commits=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "${version#v}" "$commits" "$hash"
}

build() {
  cd "$_pkgname"
  npm ci
  npm run build:linux -- dir
}

package() {
  mkdir -p "$pkgdir/opt/$_pkgname"
  cp -r "$_pkgname/dist/linux-unpacked/"* "$pkgdir/opt/$_pkgname"
  install -Dm644 "Hytale-F2P.desktop" "$pkgdir/usr/share/applications/Hytale-F2P.desktop"
  install -Dm644 "$_pkgname/GUI/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
}
