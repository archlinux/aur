_pkgbase=protobuf-language-server
pkgname=${_pkgbase}-git
pkgver=v0.1.0.r0.g2546944
pkgrel=1
pkgdesc='Protobuf Language Server'
arch=('x86_64')
url="https://github.com/lasorda/protobuf-language-server"
license=('Apache-2.0')
makedepends=('go')
source=('git+https://github.com/lasorda/protobuf-language-server.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$_pkgbase"
  mkdir -p build/
}

build() {
  cd "$_pkgbase"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./...
}

check() {
  cd "$_pkgbase"
  go test ./...
}

package() {
  cd "$_pkgbase"
  install -Dm755 build/$_pkgbase "$pkgdir"/usr/bin/$_pkgbase
}
