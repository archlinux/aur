# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=websitino-bin
pkgver=0.2.8
pkgrel=4
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
sha256sums=('1c603c6ad893aebc3f27154e3adde8de191bffb8ed5be6cecb56ed1fffc54c38')

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
