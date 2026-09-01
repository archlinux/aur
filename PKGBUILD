# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=mirrorbits
pkgver=0.6.2
pkgrel=4
pkgdesc="Mirrorbits is a geographical download redirector written in Go for distributing files efficiently across a set of mirrors."
arch=('x86_64' 'aarch64')
url="https://github.com/etix/mirrorbits"
license=('MIT')
depends=('glibc' 'zlib')
makedepends=('go' 'git')
_commit='9061cc3e06a00c04cd92965dae46850f2785a91b'
source=("git+https://github.com/etix/mirrorbits.git#commit=$_commit")
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
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
