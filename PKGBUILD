# Maintainer: H3mul <phil.d324@gmail.com>
_pkgname=zoekt
pkgname=zoekt-git
pkgbase=zoekt-git
pkgver=r1881.c747a3b
pkgrel=1
pkgdesc='Fast trigram based code search'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/sourcegraph/zoekt'
license=('Apache-2.0')
makedepends=('go' 'git')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')
provides=(zoekt)
options=(strip docs !libtool !staticlibs !lto !debug)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  mkdir -p build/
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

check() {
  cd "$_pkgname"
  go test -v ./...
}

package() {
  cd "$_pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/*

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
}
