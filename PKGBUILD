# Maintainer: hexchain <arch at hexchain dot org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Qi Xiao <xiaqqaix at gmail dot com>

pkgname=elvish-git
_pkgname=elvish
pkgver=0.21.0.dev.r161.g06979ef
pkgrel=1
pkgdesc="A friendly and expressive Unix shell"
arch=('x86_64')
url="https://elv.sh"
license=('BSD')
depends=('glibc')
makedepends=('git' 'go')
install="elvish.install"
options=('!lto')
source=("elvish::git+https://github.com/elves/elvish.git")
b2sums=('SKIP')
provides=('elvish')
conflicts=('elvish')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$_pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" \
    -X github.com/elves/elvish/pkg/buildinfo.Reproducible=true \
    -X github.com/elves/elvish/pkg/buildinfo.Version=$pkgver" \
    -o build \
    ./cmd/...
}

check() {
  cd "$_pkgname"
  go test -v -race ./...
}

package() {
  cd "$_pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/elvish

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$_pkgname" ./*.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}

