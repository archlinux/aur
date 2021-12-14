# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=nerdctl
pkgver=0.15.0
pkgrel=1
pkgdesc="Docker-compatible CLI for containerd"
arch=('x86_64')
url="https://github.com/containerd/nerdctl"
license=('Apache')
depends=('containerd')
makedepends=('go')
optdepends=(
  'buildkit'
  'cni-plugins'
  'rootlesskit'
  'slirp4netns'
) # others: cni-isolation-plugin
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0b940813206b0a550d0ffc591f36b45f590f449341aee25d04754e8faac7057060ffbb5e8ee2a0499fa72e3295ba7ab94131baf9349e1e70e23ddce37a04f396')
b2sums=('a0ad209e365fc4495f992848ba91bbb7b93aea7ff7cc9e4dcbd57aa10caf330e0188fb4650ae588bc9fde384ae7ad81a5b80c02af49fafd0181c3016a9703b3c')

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
