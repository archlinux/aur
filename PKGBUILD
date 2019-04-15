# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=scaleway-cli
pkgver=1.19
pkgrel=1
pkgdesc="Manage BareMetal Servers from Command Line"
arch=('i686' 'x86_64')
url="https://scaleway.com"
license=('MIT')
makedepends=('go' 'git')
source=("https://github.com/scaleway/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('307bb2a67cd8b8a7fb58524dfe3f65bbba476496c051e289e76f11d0508a0ab7')

prepare() {
  # setup local gopath
  export GOPATH="$srcdir/.gopath"
  mkdir -p "$GOPATH/src/github.com/scaleway/"
  ln -s "$srcdir/$pkgname-$pkgver" "$GOPATH/src/github.com/scaleway/$pkgname"
}

build() {
  cd "$GOPATH/src/github.com/scaleway/$pkgname"
  go build \
    -buildmode=pie \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X github.com/scaleway/scaleway-cli/pkg/scwversion.GITCOMMIT=nogit -extldflags ${LDFLAGS}" \
    -o scw ./cmd/scw
}

check() {
  cd "$GOPATH/src/github.com/scaleway/$pkgname"
  go test -ldflags \
    "-X github.com/scaleway/scaleway-cli/pkg/scwversion.GITCOMMIT=nogit" \
    -i ./cmd/scw
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 scw "$pkgdir/usr/bin/scw"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
