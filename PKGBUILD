# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=zkcli
pkgver=0.4.0
pkgrel=5
pkgdesc="A interactive Zookeeper client."
arch=('x86_64' 'aarch64')
url="https://github.com/let-us-go/zkcli"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='14e740bc9461e8bae20665f0fd8ef0a64cd9f81a'
source=("git+https://github.com/let-us-go/zkcli.git#commit=$_commit")
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
