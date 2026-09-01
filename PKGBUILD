# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=go-perftuner
pkgver=0.6.2
pkgrel=6
pkgdesc="Helper tool for manual Go code optimization."
arch=('x86_64' 'aarch64')
url="https://github.com/go-perf/go-perftuner"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='ece170aa2233db3b708470a0eb8a7fb8d5be6224'
source=("git+https://github.com/go-perf/go-perftuner.git#commit=$_commit")
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
