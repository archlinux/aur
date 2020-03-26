# Maintainer: Axel Gembe <derago@gmail.com>
pkgname=plexdrive-git
_pkgname=${pkgname/-git/}
pkgver=5.1.0.r0.g65ff5d4
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
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/dweidenfeld/plexdrive.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p gopath/src/github.com/dweidenfeld
  ln -rTsf $pkgname gopath/src/github.com/dweidenfeld/$pkgname
  export GOPATH="$srcdir"/gopath

  cd gopath/src/github.com/dweidenfeld/$pkgname
  go get -v
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/dweidenfeld/$pkgname
  go build \
    -trimpath \
    -o $_pkgname \
    .
}

package() {
  cd "$pkgname"
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
