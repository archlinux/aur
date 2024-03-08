# Maintainer: Arthur Deierlein <arthur at deierlein dot ch>

_pkgname=vault-gui
pkgname=$_pkgname-git
pkgver=0.2.0.r0.g4e5ee2c
pkgrel=1
pkgdesc="GUI for Hashicorps Vault"
arch=('x86_64')
url="https://github.com/adfinis/vault-gui"
license=('MIT')
depends=('openssl' 'webkit2gtk')
makedepends=('cargo' 'git' 'pnpm')
source=("$_pkgname::git+$url")
provides=('vault-gui')
b2sums=('SKIP')
conflicts=('vault-gui-bin')

build() {
  cd "$_pkgname"
  pnpm i --frozen-lockfile
  pnpm run build:vite
  pnpm tauri build -b deb
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

package() {
  cd "$srcdir/$_pkgname"
  cp -R ./src-tauri/target/release/bundle/deb/vault-gui_0.0.0_amd64/data/usr/ ${pkgdir}
}

# vim: ts=2 sw=2 et:
