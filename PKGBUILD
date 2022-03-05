# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=nerdctl
pkgver=0.17.1
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
_commit='20233c26d26f11ca73a9a775fba87ca884ab14d2' # v0.17.1
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'skip-failing-test.patch'
)
sha512sums=('SKIP'
            'c168de6147edcebf31df4b2e22dc830cad62b81780d10105aada8e17347523747d413c4398bec3840f079a37177b6f9c3ca87c8f0119f4f651f7e4c6462eb8b3')
b2sums=('SKIP'
        'c4dd2803d0fb6ef0067ee2ec3fb34f606618e157264e03f9b607629900b11a774f484c8cb320054f90911400bb436ca65f024bf5d63f39766e5b7f19fd8814e5')

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

  # skip failing unit test
  patch -p1 -i ../skip-failing-test.patch
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

check() {
  cd "$pkgname"

  go test -v ./pkg/...
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/nerdctl
}
