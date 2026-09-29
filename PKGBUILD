# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=faas-cli
pkgver=0.18.14
pkgrel=1
pkgdesc="Official CLI for OpenFaaS"
arch=('x86_64' 'aarch64')
url="https://github.com/openfaas/faas-cli"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='7a39d637981b77cbc3b1e1605feec1bf7c66c528'
source=("git+https://github.com/openfaas/faas-cli.git#commit=$_commit")
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
