pkgname=gat-git
pkgver=r130.3f578d4
pkgrel=1
pkgdesc='Cat alternative written in Go.'
arch=('x86_64')
url="https://github.com/koki-develop/gat"
license=('GPL')
makedepends=('go')
source=("$pkgname::git+https://github.com/koki-develop/gat.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare(){
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
  go build -o build
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 "$srcdir"/"$pkgname"/build/gat "$pkgdir"/usr/bin/gat
}
