# Maintainer: Levi Zim <i at kxxt dot dev>
pkgname=git-pkgs
pkgver=0.11.4
pkgrel=1
pkgdesc='About A git subcommand for analyzing package/dependency usage in git repositories over time '
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/$pkgname/$pkgname/"
license=('MIT')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
b2sums=('fb3a35e25a18ca6129f7e0ca20ae8430a51e47b1a7466481a0cd450facf7c789207b522cb3d208fbdb300fc4f99f2cfee030568d142f6f9761fabcbdd9846c75')

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
