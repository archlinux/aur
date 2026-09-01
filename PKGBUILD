# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=fil
pkgver=0.3.0
pkgrel=4
pkgdesc="😋 Unix file command written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/file-go/fil"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='b40841ade50ca3e80cc94835c73b8c80b62f7bbc'
source=("git+https://github.com/file-go/fil.git#commit=$_commit")
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
  install -Dm 644 ReadMe.md -t "$pkgdir/usr/share/doc/$pkgname"
  # Upstream states the licence in its README and ships no LICENSE file.
  install -Dm 644 ReadMe.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
