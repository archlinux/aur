# Maintainer: agony <27015 at riseup dot net>

pkgname=keep-sorted
pkgver=0.11.0
pkgrel=1
pkgdesc='Language-agnostic formatter that sorts lines between two markers in a larger file'
arch=('x86_64' 'aarch64')
url='https://github.com/google/keep-sorted'
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('97f37f8d4fb677fd06422e141a11471e12ce4410cff7d3b0b142dfcfa8bd6a4c')

prepare() {
  cd "${pkgname}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "${pkgname}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -v -ldflags=-linkmode=external -o build/keep-sorted .
}

check() {
  cd "${pkgname}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  go test ./...
}

package() {
  cd "${pkgname}"
  install -Dm755 build/keep-sorted -t "${pkgdir}/usr/bin"
}
