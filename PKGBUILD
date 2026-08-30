# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=tabtoy
pkgver=3.1.4
pkgrel=5
pkgdesc="高性能表格数据导出器"
arch=('x86_64' 'aarch64')
url="https://github.com/davyxu/tabtoy"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='0fbde52cba30f8f9705515cd891b89dbf050cdde'
source=("git+https://github.com/davyxu/tabtoy.git#commit=$_commit")
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
