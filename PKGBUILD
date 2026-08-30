# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=sqsmover
pkgver=0.4.0
pkgrel=5
pkgdesc="AWS SQS Message mover"
arch=('x86_64' 'aarch64')
url="https://github.com/mercury2269/sqsmover"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='1c096cc223aa0231a099acfc767b1cc43306d2aa'
source=("git+https://github.com/mercury2269/sqsmover.git#commit=$_commit")
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
  install -Dm 644 README.MD -t "$pkgdir/usr/share/doc/$pkgname"
}
