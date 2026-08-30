# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=clive
pkgver=0.12.17
pkgrel=3
pkgdesc="⚡ Automates terminal operations."
arch=('x86_64' 'aarch64')
url="https://github.com/koki-develop/clive"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='08808fc196a4c22e9d6d25ce78d78a5672325e02'
source=("git+https://github.com/koki-develop/clive.git#commit=$_commit")
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
