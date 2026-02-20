# Maintainer: Terromur <terromuroz@proton.me>
# Maintainer: 00ein00 <ein420@proton.me>
pkgname=hytale-f2p-git
_pkgname=hytale-f2p
pkgver=2.3.2.r468.ge7a0339
pkgrel=1
pkgdesc="Hytale-F2P - unofficial Hytale Launcher for free to play with multiplayer support"
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
  '46488fada4775d9976d7b7b62f8d1f1f8d9a9a9d8f8aa9af4f2e2153019f6a30')

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
