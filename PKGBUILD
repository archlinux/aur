# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=nirvana
pkgver=0.3.1
pkgrel=5
pkgdesc="Golang Restful API Framework for Productivity"
arch=('x86_64' 'aarch64')
url="https://github.com/caicloud/nirvana"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='6349af227fd0cd84904bbfef5dc5e7c1c7affe58'
source=("git+https://github.com/caicloud/nirvana.git#commit=$_commit")
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
    ./cmd/nirvana
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
