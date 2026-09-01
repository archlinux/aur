# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=codeowners
pkgver=1.2.1
pkgrel=5
# pkglint: ignore=PB906
pkgdesc="🔒 Command line tool and Go library for CODEOWNERS files"
arch=('x86_64' 'aarch64')
url="https://github.com/hmarr/codeowners"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='80b677677fb26df8188a6b8736eb44e6792a0e3e'
source=("git+https://github.com/hmarr/codeowners.git#commit=$_commit")
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
    ./cmd/codeowners
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
