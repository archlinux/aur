# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=docker-buildx-git
pkgver=0.12.1.r76.g78adfc80
pkgrel=1
pkgdesc="Docker CLI plugin for extended build capabilities with BuildKit"
arch=('i686' 'x86_64')
url="https://github.com/docker/buildx"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
provides=("docker-buildx=$pkgver")
conflicts=('docker-buildx')
source=("git+https://github.com/docker/buildx.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "buildx"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "buildx"

  go build \
    ./cmd/...
}

check() {
  cd "buildx"

  #go test \
  #  ./...
}

package() {
  cd "buildx"

  install -Dm755 "buildx" -t "$pkgdir/usr/lib/docker/cli-plugins/docker-buildx"
}
