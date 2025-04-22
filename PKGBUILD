# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='tget'
pkgname="${_pkgname}-git"
pkgver=0.1.1.r6.g97ffbe2
pkgrel=2
pkgdesc='Like wget but for torrents (latest commit)'
arch=('aarch64' 'x86_64')
url='https://github.com/sweetbbak/tget'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=("$_pkgname")
conflicts=('nodejs-tget' "$_pkgname")
depends=('gcc-libs' 'glibc')
makedepends=('git' 'go')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags \
  | sed 's/^[Vv]//;s/-rc\d*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  mkdir -p build
  go mod tidy
}

build() {
  cd "$_pkgname"

  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external" \
    -mod=readonly \
    -modcacherw \
      ./cmd/tget
}

check() {
  cd "$_pkgname"

  go test ./...

  ./tget --version
}

package() {
  cd "$_pkgname"

  install -vDm0755 -t "$pkgdir/usr/bin/" \
    tget
  install -vDm0644 -t "$pkgdir/usr/share/applications/" \
    "$_pkgname.desktop"
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    README.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE
}

# eof
