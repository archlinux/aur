# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: bemasher <bemasher@gmail.com>

pkgname=rtlamr-git
_pkgname=${pkgname%%-git}
pkgver=0.9.3.r16.gdcdddc5
pkgrel=1
pkgdesc="An rtl-sdr receiver for Itron ERT compatible smart meters operating in the 900MHz ISM band."
arch=('i686' 'x86_64')
url="https://github.com/bemasher/rtlamr"
license=('AGPL3')
depends=('rtl-sdr')
makedepends=('go' 'git')
provides=('rtlamr')
conflicts=('rtlamr')
source=("git+https://github.com/bemasher/rtlamr.git")
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
