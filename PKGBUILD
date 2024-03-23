# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=rtlamr-collect-git
_pkgname=${pkgname%%-git}
pkgver=1.0.3.r0.g7951486
pkgrel=1
pkgdesc="Data aggregation for rtlamr."
arch=('any')
url="https://github.com/bemasher/rtlamr-collect"
license=('AGPL3')
depends=('rtl-sdr')
makedepends=('go' 'git')
provides=('rtlamr-collect')
conflicts=('rtlamr-collect')
source=("git+https://github.com/bemasher/rtlamr-collect.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "$_pkgname"
  go test ./...
}


package() {
  cd "$_pkgname"
  install -p -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}

# vim:set ts=2 sw=2 et:
