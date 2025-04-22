# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='jorge'
pkgname="$_pkgname-git"
pkgver=0.9.1.r8.g9cf08c4
pkgrel=2
pkgdesc='Personal site generator with org-mode support (latest commit)'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/facundoolano/jorge'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=("$_pkgname")
conflicts=("${provides[@]}")
depends=('glibc')
makedepends=('git' 'go')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags \
  | sed 's/^v//;s/-rc\d*//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
    -o build
}

check() {
  cd "$_pkgname"

  go test ./...

  build/jorge --version
}

package() {
  cd "$_pkgname"

  install -vDm0755 -t "$pkgdir/usr/bin/" build/jorge
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# eof
