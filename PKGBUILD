# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=websitino-bin
pkgver=0.2.14
pkgrel=1
pkgdesc="A lightweight static file server for local development"
arch=('x86_64')
url="https://github.com/trikko/websitino"
license=('MIT')
provides=('websitino')
conflicts=('websitino')
options=('!strip' '!debug')

latestver() {
  local tmp
  tmp=$(mktemp) || return 1
  trap 'rm -f "$tmp"' RETURN
  curl -fsSL 'https://trikko.github.io/websitino/linux/websitino' -o "$tmp" || return 1
  chmod +x "$tmp" || return 1
  "$tmp" --version | sed -nE 's/.*\(v([0-9]+\.[0-9]+\.[0-9]+)\).*/\1/p'
}

source=("websitino-${pkgver}::https://trikko.github.io/websitino/linux/websitino")
sha256sums=('8d0dbabc710aa93695f952d50e4749c4e9e454cbcf928d9c1a368c35ec5baaf4')

prepare() {
  chmod +x "${srcdir}/websitino-${pkgver}"
}

package() {
  # Create directories
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  
  # Install binary
  install -Dm755 "${srcdir}/websitino-${pkgver}" "${pkgdir}/usr/bin/websitino"
  
  # Install license
  curl -s "https://raw.githubusercontent.com/trikko/websitino/main/LICENSE" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
