# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=kubectl-tree
pkgver=0.6.0
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
b2sums=('cabfb56c3c5fd4bd5aadb8d18faef5712f9352fa8d407e593d2ac2f5bc72157c007972657c3e0745007f128c84851c357ca84c11be1fcab138e5f4fc136c30df')

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
