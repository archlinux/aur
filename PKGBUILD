# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=protolock
pkgver=0.17.0
pkgrel=5
pkgdesc="Protocol Buffer companion tool. Track your .proto files and prevent changes to messages and services which impact API compatibility."
arch=('x86_64' 'aarch64')
url="https://github.com/nilslice/protolock"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('go' 'git')
_commit='70788742d42631c082e044d0dc224ab3ed14f602'
source=("git+https://github.com/nilslice/protolock.git#commit=$_commit")
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
    ./cmd/protolock
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
