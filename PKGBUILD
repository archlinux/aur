# Maintainer: Axel Gembe <derago@gmail.com>
pkgname=plexdrive
pkgver=5.0.0
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
source=(https://github.com/dweidenfeld/plexdrive/archive/5.0.0.tar.gz)
sha256sums=('68763993a3da3d8ccd0dc18b3a5db7ab7ad8d03fde2d9be2ef4829e8356225bd')

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
