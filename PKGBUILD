# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=kubectl-tree
pkgver=0.4.3
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
b2sums=('b11503947b86582fd491ee06f6f2e45e8bb63c66d8a7366ea3dce32985e77d748f9022264a6d9c9ed1d4d6cd86358c1f147168d0aa81e9e0cbb0b96a9fde4403')

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
