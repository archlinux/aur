# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=cloud189
pkgver=0.7.0
pkgrel=1
pkgdesc="基于天翼云接口的go客户端"
arch=('x86_64' 'aarch64')
url="https://github.com/gowsp/cloud189"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='cb51d6aef0bf9dc1e521c7968843350a27af2c77'
source=("git+https://github.com/gowsp/cloud189.git#commit=$_commit")
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
    ./cmd/cloud189
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
