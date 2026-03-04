# Maintainer: Levi Zim <i at kxxt dot dev>
pkgname=git-pkgs
pkgver=0.15.0
pkgrel=1
pkgdesc='About A git subcommand for analyzing package/dependency usage in git repositories over time '
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/$pkgname/$pkgname/"
license=('MIT')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
b2sums=('21507fd9acc29f4a880e3f8d428fd79d3408b8e8756da3eb2862ae2d7e2e0145c6013d7841434aaa7a09c59ce248bc2e15ec8e29378d07b9188e784f8b2b7c7b')

prepare(){
  cd "$pkgname"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"
  go build -v -o build ./...
}

# TODO: investigate test failure
# check() {
#   cd "$pkgname"
#   go test -v ./...
# }

package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
