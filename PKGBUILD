# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=rad
pkgver=0.12.1
pkgrel=3
pkgdesc="Modern CLI scripts made easy."
arch=('x86_64' 'aarch64')
url="https://github.com/amterp/rad"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='8b07cf24ec93597547c9a6d01178cd86404ee687'
source=("git+https://github.com/amterp/rad.git#commit=$_commit")
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
