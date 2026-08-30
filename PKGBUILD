# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=checkip
pkgver=0.53.3
pkgrel=3
pkgdesc="Get (security) info about IP addresses"
arch=('x86_64' 'aarch64')
url="https://github.com/jreisinger/checkip"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='32aa6276d85429715c58377458f408a2f9249c20'
source=("git+https://github.com/jreisinger/checkip.git#commit=$_commit")
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
