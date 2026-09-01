# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=go-carpet
pkgver=1.10.0
pkgrel=6
pkgdesc="Tool for show test coverage in terminal for Go source files"
arch=('x86_64' 'aarch64')
url="https://github.com/msoap/go-carpet"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='1367ca780f1ea2764d24d05c471d2b6a6e81b713'
source=("git+https://github.com/msoap/go-carpet.git#commit=$_commit")
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
    -ldflags='-linkmode=external -s -w' \
    -o $pkgname \
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
