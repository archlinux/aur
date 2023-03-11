# Maintainer: David Florness <david at florness dot com>
pkgname=tallyard-git
_pkgname=tallyard
pkgver=0.6.1.r0.g03a3e09
pkgrel=1
arch=('x86_64')
pkgdesc="an authenticated voting system that ensures voter privacy while preventing double-voting"
url="https://tallyard.xyz"
license=('MPL2')
depends=('libolm')
makedepends=('go>=1.18')
source=("git+https://git.hnitbjorg.xyz/~edwargix/tallyard")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="$srcdir"/.go
  make
}

check() {
  cd "$srcdir/$_pkgname"
  go test ./...
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 $_pkgname $pkgdir/usr/bin/$_pkgname
}
