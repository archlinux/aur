# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='mycorrhiza'
pkgname="$_pkgname-git"
pkgver=1.15.1.r4.gda84a76
pkgrel=3
pkgdesc='Filesystem and git-based wiki engine written in Go using mycomarkup (development version)'
arch=('aarch64' 'armv7h' 'x86_64')
url='https://github.com/bouncepaw/mycorrhiza'
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
depends=('glibc')
makedepends=('git' 'go')
source=("git+$url.git")
provides=('mycorrhiza')
conflicts=("${provides[@]}")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"

  mkdir -p build
  go mod tidy
}

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.version=$pkgver" \
    -mod=readonly \
    -modcacherw \
    -o build \
     .
}

check() {
  cd "$_pkgname"

  : go test ./...

  build/mycorrhiza -version
}

package() {
  cd "$_pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin/" build/mycorrhiza
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm0644 -t "$pkgdir/usr/share/man/man1/" help/mycorrhiza.1
}

# eof
