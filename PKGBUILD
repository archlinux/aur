# Maintainer: Axel Gembe <derago@gmail.com>
pkgname=plexdrive
pkgver=5.1.0
pkgrel=1
pkgdesc='Plexdrive allows you to mount your Google Drive account as read-only fuse filesystem, with direct delete option on the filesystem.'
arch=('any')
url='https://github.com/dweidenfeld/plexdrive'
license=('MIT')
depends=('fuse')
makedepends=(
  'go'
  'git'
)
provides=("$pkgname")
conflicts=("$pkgname")
source=(https://github.com/dweidenfeld/plexdrive/archive/5.1.0.tar.gz)
sha256sums=('4fa3afc59edcd4ba1917e32af8b0202b9ab7256541c54e417b591d7fd54c632e')

prepare() {
  mkdir -p gopath/src/github.com/dweidenfeld
  ln -rTsf $pkgname-$pkgver gopath/src/github.com/dweidenfeld/$pkgname
  export GOPATH="$srcdir"/gopath

  cd gopath/src/github.com/dweidenfeld/$pkgname
  go get -v
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/dweidenfeld/$pkgname
  go build \
    -trimpath \
    -o $pkgname \
    .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
