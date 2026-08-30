# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=go-test-report
pkgver=0.9.3
pkgrel=5
pkgdesc="Captures go test output and parses it into a single self-contained HTML file."
arch=('x86_64' 'aarch64')
url="https://github.com/vakenbolt/go-test-report"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='511bd0a4d22d37e1ccefaa2ea9e77ee625531f73'
source=("git+https://github.com/vakenbolt/go-test-report.git#commit=$_commit")
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
