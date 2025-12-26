# Maintainer: tecknian <user393220@proton.me>
pkgname=mncalc-git
pkgver=r5.d9872fc
pkgrel=1
pkgdesc='Command-line alternative to macro-nutrient calculator websites'
arch=('x86_64')
url='https://codeberg.org/tecknian/mncalc'
license=('BSD 2-Clause')
makedepends=('go' 'git')
provides=("${pkgname%-git}")
conflicts=()
source=("git+$url.git")
sha256sums=('SKIP')
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "$srcdir/${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  CGO_ENABLED=0 go build -ldflags -extldflags="-static -s -w" -o build/mncalc ./cmd/mncalc/main.go
}
package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 build/mncalc "$pkgdir/usr/bin/mncalc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
