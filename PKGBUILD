# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=dendrite
pkgver=0.1.0
pkgrel=2
pkgdesc="A second-generation Matrix homeserver written in Go"
arch=('x86_64')
url='https://github.com/matrix-org/dendrite'
license=('Apache')
makedepends=('git' 'go')
_commit=570528e5f19d76fe2fd7ea646246eea9650b1b60    #refs/tags/v0.1.0^{}
source=("git+https://github.com/matrix-org/dendrite.git#commit=$_commit")
sha256sums=('SKIP')

prepare(){
  cd "$pkgname"
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build ./cmd/dendrite-monolith-server
  go build ./cmd/generate-config
  go build ./cmd/generate-keys
}

check() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go test ./cmd/dendrite-monolith-server
}

package() {
  cd "$pkgname"
  install -Dm755 ./dendrite-monolith-server "$pkgdir/usr/bin/${pkgname}"
  install -Dm755 ./generate-config          "$pkgdir/usr/bin/${pkgname}-generate-config"
  install -Dm755 ./generate-keys            "$pkgdir/usr/bin/${pkgname}-generate-keys"
}
