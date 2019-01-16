# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Caleb Bassi <calebjbassi@gmail.com>

pkgname=gotop
pkgver=1.7.1
pkgrel=3
pkgdesc='A terminal based graphical activity monitor inspired by gtop and vtop'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/cjbassi/gotop"
license=(AGPL3)
provides=(gotop)
conflicts=(gotop)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cjbassi/gotop/archive/${pkgver}.tar.gz")
sha256sums=('0041d36e664870d0b461b80bba4a2fb5120af1030230f09e3e9887a67c117363')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  install -m755 -d "$srcdir/go/src/github.com/cjbassi"
  cp -a "$srcdir/$pkgname-$pkgver" "$srcdir/go/src/github.com/cjbassi/gotop"
}

build() {
  cd "$srcdir/go/src/github.com/cjbassi/gotop"

  export GOPATH="$srcdir/go"
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  go get -v github.com/cjbassi/gotop
  make dist/gotop
}

package() {
  install -Dm755 "$srcdir"/go/bin/gotop "$pkgdir"/usr/bin/gotop
}
