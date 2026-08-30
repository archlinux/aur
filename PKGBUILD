# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=opsy
pkgver=0.0.3
pkgrel=5
pkgdesc="Opsy - Your AI-Powered SRE Colleague"
arch=('x86_64' 'aarch64')
url="https://github.com/datolabs-io/opsy"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='943f841e2436307842b30b5dd05aa4521d1a938c'
source=("git+https://github.com/datolabs-io/opsy.git#commit=$_commit")
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
    ./cmd/opsy
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
