# Maintainer: aserdevyt <aserdevyt@outlook.com>

pkgname=ash-shell-git
pkgver=20250820.230306
pkgrel=1
pkgdesc="A modern, secure, feature-rich Linux shell written in C"
arch=('x86_64')
url="https://github.com/aserdevyt/ash-shell"
license=('GPL3')
depends=('readline')
makedepends=('git' 'cmake' 'make' 'gcc')
optdepends=('kitty: proper Unicode/font rendering inside the shell')
source=("git+https://github.com/aserdevyt/ash-shell.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ash-shell"

  # Make sure we’re not using stale refs
  git fetch --unshallow --tags --force >/dev/null 2>&1 || true
  git gc --prune=all --aggressive >/dev/null 2>&1 || true

  # Format: YYYYMMDD.HHMMSS (UTC)
  git log -1 --format="%cd" --date=format:'%Y%m%d.%H%M%S'
}


#pkgver() {
#  cd "$srcdir/ash-shell"
#  local _ver
#  _ver="$(git describe --tags --long 2>/dev/null || echo 0.0.0-0-g$(git rev-parse --short HEAD))"
#  printf "%s" "${_ver//-/.}"
#}

build() {
  cd "$srcdir/ash-shell"
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "$srcdir/ash-shell/build"
  install -Dm755 ash "$pkgdir/usr/bin/ash"
}

