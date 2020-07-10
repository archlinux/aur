# Maintainer: Bakasura <bakasura@protonmail.ch>

pkgname=hexchat-fishlim-reloaded-git
pkgver=r9.ee43aac
pkgrel=1
pkgdesc="FiSHLiM support to HexChat with with steroids!"
url="https://github.com/BakasuraRCE/hexchat-fishlim-reloaded"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('hexchat' 'openssl>=0.9.8')
makedepends=('git' 'meson')
conflicts=('hexchat-fishlim-reloaded')
provides=('hexchat-fishlim-reloaded')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname}"
  arch-meson build -D local_install=false
  ninja -C build
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build test
  DESTDIR="${pkgdir}" ninja -C build install
}

