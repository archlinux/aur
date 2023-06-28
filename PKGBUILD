# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hey-git
pkgver=0.1.4.r5.g8985827
pkgrel=1
pkgdesc="HTTP load generator, ApacheBench (ab) replacement"
arch=('i686' 'x86_64')
url="https://github.com/rakyll/hey"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
provides=("hey=$pkgver")
conflicts=('hey')
source=("git+https://github.com/rakyll/hey.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "hey"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "hey"

  go build \
    ./...
}

check() {
  cd "hey"

  go test \
    ./...
}

package() {
  cd "hey"

  GOBIN="$pkgdir/usr/bin" \
    go install ./
}
