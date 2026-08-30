# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=dockerfilegraph
pkgver=0.21.0
pkgrel=3
pkgdesc="Visualize your multi-stage Dockerfiles"
arch=('x86_64' 'aarch64')
url="https://github.com/patrickhoefler/dockerfilegraph"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='45dee19aaecc20ac50179a5f44659dd00883230d'
source=("git+https://github.com/patrickhoefler/dockerfilegraph.git#commit=$_commit")
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
