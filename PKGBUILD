# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=kubectl-tree
pkgver=0.4.6
pkgrel=1
pkgdesc="kubectl plugin to browse Kubernetes object hierarchies as a tree"
arch=(x86_64 aarch64)
url="https://github.com/ahmetb/kubectl-tree"
license=(Apache-2.0)
depends=(glibc kubectl)
makedepends=(go)
groups=(kubectl-plugins)
# we cannot use LTO as otherwise we do not get reproducible package with full RELRO
options=('!lto')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('8e3e657578ccc23d88314acaac0760dd797e042d43b0b5b554f0289715d074a81c3094d846ad3b0485db3d801bddbacc319c5700221243fe093516fbb0337b5c')

build() {
  cd $pkgname-$pkgver

  # set GOPATH so makepkg puts source files into the debug package
  export GOPATH="$srcdir"

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false -linkmode external -extldflags \"$LDFLAGS\" -X main.version=$pkgver" \
    -o $pkgname ./cmd/$pkgname
}

package() {
  cd $pkgname-$pkgver
  install -vDm 755 $pkgname -t "$pkgdir/usr/bin/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
