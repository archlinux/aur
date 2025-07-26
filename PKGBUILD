# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=transifex-cli-git
pkgver=1.6.17.r0.ge7feea3
pkgrel=2
pkgdesc="The Transifex command-line client"
arch=('i686' 'x86_64')
url="https://github.com/transifex/cli"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
provides=("transifex-cli=$pkgver")
conflicts=('transifex-cli')
source=("git+https://github.com/transifex/cli.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "cli"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "cli"

  go build \
    ./...
}

check() {
  cd "cli"

  #go test \
  #  ./...
}

package() {
  cd "cli"

  GOBIN="$pkgdir/usr/bin" \
    go install ./

  mv "$pkgdir/usr/bin/cli" "$pkgdir/usr/bin/tx-cli"
}
