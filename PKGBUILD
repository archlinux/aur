# Maintainer: Brice <b@bnema.dev>
pkgname=turtlectl-git
pkgver=r2.795e83c
pkgrel=1
pkgdesc='A Go CLI tool to manage and run Turtle WoW on Linux (X11/Wayland)'
arch=('x86_64')
url="https://github.com/bnema/turtlectl"
license=('MIT')
makedepends=('go' 'git')
provides=('turtlectl')
conflicts=('turtlectl')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/turtlectl .
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 build/turtlectl "$pkgdir/usr/bin/turtlectl"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
