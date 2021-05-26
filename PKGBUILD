# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Milian Reichardt <mreichardt95@gmail.com>

_pkgname=cpuminer-multi
pkgname=$_pkgname-git
pkgver=1.3.5.r27.g8ccbb81
pkgrel=2
pkgdesc='Multi-algo CPUMiner & Reference Cryptonote Miner (JSON-RPC 2.0) - git version'
arch=('x86_64')
url="https://github.com/tpruvot/$_pkgname"
license=('GPL')
depends=('curl' 'jansson' 'openssl')
makedepends=('git')
provides=('cpuminer' 'cpuminer-multi')
conflicts=('cpuminer')
source=("git+$url.git"
        '0001-Fix-compile-error-with-GCC-11.patch')
sha256sums=('SKIP'
            '01f94fea8cc2753eee74a3d532b60d3e07319940f4b183bab80b5e9934009f92')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long | sed 's/^v//;s/-multi-\([0-9]*-g[0-9A-Fa-f]*\)$/-r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  for p in "$srcdir"/*.patch; do
    patch -Np1 -i "$p"
  done
}

build() {
  cd "$srcdir/$_pkgname"

  CFLAGS+=' -Wa,--noexecstack'
  ./autogen.sh
  ./configure --prefix=/usr --with-crypto --with-curl
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
}
