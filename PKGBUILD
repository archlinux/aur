# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=nerdctl
pkgver=0.16.0
pkgrel=1
pkgdesc="Docker-compatible CLI for containerd"
arch=('x86_64')
url="https://github.com/containerd/nerdctl"
license=('Apache')
depends=('containerd')
makedepends=('git' 'go')
optdepends=(
  'buildkit'
  'cni-plugins'
  'rootlesskit'
  'slirp4netns'
) # others: cni-isolation-plugin
options=('!lto')
_commit='0ddaffd2ce304dd917267470883898feff9463dc'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

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
    -X github.com/containerd/nerdctl/pkg/version.Revision=$(git rev-parse HEAD)" \
    -o build \
    ./cmd/...
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/nerdctl
}
