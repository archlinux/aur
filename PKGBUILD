# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='mdviewer'
pkgname="${_pkgname}-git"
pkgdesc='Rendered display of markdown on terminal (latest git commit)'
pkgver=0.1.1.r53.gb935eea
pkgrel=2
url='https://github.com/noborus/mdviewer'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
license=('MIT')  # SPDX-License-Identifier: MIT
provides=("$_pkgname")
conflicts=("${provides[@]}")
makedepends=('git' 'go')
depends=('glibc')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/-rc\d*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  git clean -dfx
  mkdir -p build
  go mod tidy
}

build() {
  cd "$_pkgname"

  _pkgver=$(git describe --tags --abbrev=0 --always)
  _pkgrev=$(git rev-parse --verify --short HEAD)

  case "Z${CARCH:-unknown}" in
    'Zx86_64' | 'Zaarch64' )
      export LDFLAGS="$LDFLAGS -Wl,-z,shstk"
    ;;
    * ) : pass ;;
  esac

  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.Version=$_pkgver -X main.Revision=$_pkgrev" \
    -mod=readonly -modcacherw \
    -o build
}

check() {
  cd "$_pkgname"

  : go test ./...
  "build/$_pkgname" --version
}

package() {
  cd "$_pkgname"

  install -Dm0755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
