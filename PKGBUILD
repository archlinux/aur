# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=jaggr
pkgver=1.0.1
pkgrel=6
pkgdesc="JSON Aggregation CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/rs/jaggr"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='af08f8a4a77e6618a39abc031f77313d29b62c60'
source=("git+https://github.com/rs/jaggr.git#commit=$_commit")
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
