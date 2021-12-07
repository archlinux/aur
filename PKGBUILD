# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=nerdctl
pkgver=0.14.0
pkgrel=1
pkgdesc="Docker-compatible CLI for containerd"
arch=('x86_64')
url="https://github.com/containerd/nerdctl"
license=('Apache')
depends=('containerd')
makedepends=('go')
optdepends=('cni-plugins') # others: cni-isolation-plugin, buildkit, rootlesskit, slirp4netns
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4d2054f7ecb5ea4d9d41c07bf7899fd5b60663bc4762deef3bb898762ca07f9f9e4e409910a45ec6a09233935d2c402d4cd86ca85a46e73048906632d92146a1')
b2sums=('bdb7555e0b9ec08c1bd8badc7e42432957f1c0a36d5fc8bbf7b974a78d4dd87c25a1e1347703798a48230ae78d1bb6fbd4cf7315fd0d115c7ca0ecd4dc058853')

prepare() {
  cd "$pkgname-$pkgver"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname-$pkgver"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/containerd/nerdctl/pkg/version.Version=$pkgver \
    -X github.com/containerd/nerdctl/pkg/version.Revision=tarball" \
    -o build \
    ./cmd/...
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/nerdctl
}
