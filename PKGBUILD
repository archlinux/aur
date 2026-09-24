# Maintainer: Daniel Hufschläger <daniel at hufschlaeger dot net>

pkgname=tasky-git
pkgver=V0.6.r16.5a3e86e
pkgrel=1
pkgdesc='A sleek, powerful CLI task management tool'
arch=('x86_64')
license=('GPL-3.0-or-later')
url='https://github.com/shahriaarrr/Tasky'
makedepends=('git' 'go')
options=(!lto)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  git describe --long --tags --always |
    sed 's/^v//; s/-/.r/; s/-g/./'
}

prepare() {
  cd "$srcdir/$pkgname"
  go mod verify
}

build() {
  cd "$srcdir/$pkgname"

  export CGO_ENABLED=0

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o tasky \
    ./cli/tasky
}

check() {
  cd "$srcdir/$pkgname"

  go test -mod=readonly ./...
}

package() {
  install -Dm755 "$srcdir/$pkgname/tasky" \
    "$pkgdir/usr/bin/tasky"
}
