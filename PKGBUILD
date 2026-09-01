# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=cascadia
pkgver=1.5.1
pkgrel=3
# pkglint: ignore=PB906
pkgdesc="Go cascadia package command line CSS selector"
arch=('x86_64' 'aarch64')
url="https://github.com/suntong/cascadia"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='66a5ec1593ae353c7e696c6227213830c6e315de'
source=("git+https://github.com/suntong/cascadia.git#commit=$_commit")
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
