# Maintainer: gilcu3 <gilcu3 [at] gmail [dot] com>

_pkgname=gpodder2go
pkgname=${_pkgname}-git
pkgver=0.1.2.r43.20c230d
pkgrel=1
pkgdesc='simple self-hosted, drop-in replacement for gpodder/mygpo'
arch=('x86_64')
url="https://github.com/oxtyped/gpodder2go"
license=('AGPL')
makedepends=('go')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  TAG=$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/^v//')
  COMMIT=$(git rev-parse --short HEAD)
  REVISION=$(git rev-list --count HEAD)
  printf "%s.r%s.%s" "$TAG" "$REVISION" "$COMMIT"
}

prepare(){
    cd "$_pkgname"
    mkdir -p build
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode external" -o build/$_pkgname
}


package() {
  cd "$_pkgname"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
