# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=gocovsh
pkgver=0.6.1
pkgrel=6
pkgdesc="Go Coverage in your terminal: a tool for exploring Go Coverage reports from the command line 💻"
arch=('x86_64' 'aarch64')
url="https://github.com/orlangure/gocovsh"
license=('GPL-3.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='095e5572fec8626dfac6f39225632c73e5aded58'
source=("git+https://github.com/orlangure/gocovsh.git#commit=$_commit")
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
