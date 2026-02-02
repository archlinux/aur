# Maintainer: Terromur <terromuroz@proton.me>
# Maintainer: 00ein00 <ein420@proton.me>
pkgname=hytale-f2p-git
_pkgname=Hytale-F2P
pkgver=2.2.1.r293.ga6c61ae
pkgrel=1
pkgdesc="Hytale-F2P - unofficial Hytale Launcher for free to play with multiplayer support"
arch=('x86_64')
url="https://github.com/amiayweb/Hytale-F2P"
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
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname/GUI/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
}
