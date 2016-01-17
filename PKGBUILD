# Maintainer: PhiBo <phibo at dinotools dot org>

pkgname=libemu-git
pkgver=r572.72f073c
pkgrel=1
pkgdesc="A small library written in c offering basic x86 emulation and shellcode detection"
url="https://github.com/buffer/libemu"
license=(GPLv2+)
arch=('i686' 'x86_64')
depends=(glibc)
makedepends=(git)
source=("$pkgname"::'git+https://github.com/buffer/libemu.git')
md5sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"

  sed -i s/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g ./configure.ac
  autoreconf -i || return 1
  CFLAGS="${CFLAGS} -Wno-unused-local-typedefs" ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir install
}
 
