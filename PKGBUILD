# Maintainer: aman333nolawz <Nolawz333@protonmail.com>

pkgname=nerv-git
pkgver=0.1.2.r0.g7668ed5
pkgrel=1
pkgdesc='Small terminal todo application written in Go'
arch=('x86_64')
url='https://github.com/aman333nolawz/nerv'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('nerv')
conflicts=('nerv')
source=('git+https://github.com/aman333nolawz/nerv.git')
sha256sums=('SKIP')

pkgver() {
  cd nerv
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd nerv
  export GOFLAGS='-modcacherw'
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"
  go mod download
}

build() {
  cd nerv

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"

  go build -ldflags "-linkmode=external" -o nerv .
}

check() {
  cd nerv

  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"

  go test ./...
}

package() {
  cd nerv

  install -Dm755 nerv "${pkgdir}/usr/bin/nerv"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
