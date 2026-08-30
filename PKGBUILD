# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=json2struct
pkgver=1.9.3
pkgrel=5
pkgdesc="CLI tool to convert JSON to struct type definitions"
arch=('x86_64' 'aarch64')
url="https://github.com/marhaupe/json2struct"
license=('GPL-3.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='c93267813f929bfd3f0fea41160db9a72c4e5a86'
source=("git+https://github.com/marhaupe/json2struct.git#commit=$_commit")
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
