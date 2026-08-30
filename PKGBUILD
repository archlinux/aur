# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=prxy
pkgver=0.1.0
pkgrel=5
pkgdesc="🔌 Command-line reverse proxy for forwarding HTTP requests through an outbound proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/Madh93/prxy"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='564d9b32b04814c9d4b350b1cfb3c694422ffe61'
source=("git+https://github.com/Madh93/prxy.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname" || exit
  go mod download -modcacherw
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  cd "$pkgname" || exit
  go build -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
