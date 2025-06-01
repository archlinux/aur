# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=anycable-go
pkgdesc="AnyCable WebSocket Server written in Go"
pkgver=1.6.2
pkgrel=1
arch=('i686' 'x86_64')
url="http://anycable.io"
license=('MIT')
makedepends=('go' 'rsync')
source=("https://github.com/anycable/anycable/archive/v${pkgver}.tar.gz")
sha256sums=('2f38f8231e3d52873bdfadac7eadcb048dcae48c0d3075a3fd8ce8ac143fd110')

# See https://wiki.archlinux.org/index.php/Go_package_guidelines
prepare(){
  mkdir -p gopath/src/github.com/anycable
  ln -rTsf anycable-${pkgver} "${srcdir}/gopath/src/github.com/anycable/anycable"
  cd "${srcdir}/gopath/src/github.com/anycable/anycable"
  export GOPATH="$srcdir"/gopath
}

build() {
  cd "anycable-${pkgver}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=$pkgver" \
    -a -o $pkgname cmd/anycable-go/main.go
}

package() {
  cd "anycable-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
