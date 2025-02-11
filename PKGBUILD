# Maintainer: Javs <admin@fxs.life>
# Description: A versatile port-based automation engine designed for red team operations, optimized for network exploration and internal automation tasks.

pkgname=gogo-git
_gitname=gogo
pkgver=2.13.6 
pkgrel=1
pkgdesc="A versatile port-based automation engine for red team operations, capable of scanning and extracting key information in complex network environments."
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'mips')
url="https://github.com/chainreactors/gogo.git"
license=('GPL')
depends=('go' 'git')
makedepends=('go' 'git')
source=('git+https://github.com/chainreactors/gogo.git')
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$_gitname"
  git submodule update --init --recursive
  
  pkgver="$pkgver-$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/$_gitname/v2"

    case $CARCH in
    x86_64)
      GOARCH=amd64
      ;;
    armv7h|aarch64)
      GOARCH=arm64
      ;;
    i686)
      GOARCH=386
      ;;
    mips)
      GOARCH=mips
      ;;
    *)
      echo "Unknown architecture: $CARCH"
      exit 1
      ;;
  esac

  GOOS=linux go mod tidy
  GOOS=linux go generate
  GOOS=linux go build -o gogo .
}

package() {
  cd "$srcdir/$_gitname/v2"

  install -Dm755 gogo "$pkgdir/usr/bin/gogo"
}
