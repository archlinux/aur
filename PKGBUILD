# Maintainer: Igor Shimanogov <shimanogov.in@phystech.edu>

pkgname=devzat-git
pkgver=2025.07.14
pkgrel=1
pkgdesc='custom SSH server that takes you to a chat instead of a shell prompt'
arch=('x86_64')
url="https://github.com/quackduck/devzat"
license=('MIT')
conflicts=('devzat')
provides=('devzat')
makedepends=('go' 'git')
depends=('glibc')
source=("git+$url.git")
sha256sums=('SKIP')

prepare(){
  cd devzat
  mkdir -p build/
}

build() {
  cd devzat
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd devzat
  go test ./...
}

package() {
  cd devzat
  install -Dm755 build/devzat "$pkgdir"/usr/bin/devzat
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
