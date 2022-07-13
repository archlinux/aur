# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=firectl
pkgver=0.1.0
pkgrel=2
pkgdesc='A command-line tool to run Firecracker microVMs'
arch=('x86_64')
url='https://github.com/firecracker-microvm/firectl'
license=('Apache')
depends=('firecracker')
makedepends=('git' 'go')
options=('!lto')
_commit='9260d0f18e103ee2178f40a5e4a57c52baffc628'
source=("$pkgname::git+$url#commit=$_commit")
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
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o build \
    .
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"
}
