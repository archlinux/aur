# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lsof-git
pkgver=4.93.2.r96.gdf01ed3
pkgrel=1
pkgdesc="List open files running processes"
arch=('i686' 'x86_64')
url="https://github.com/lsof-org/lsof"
license=('custom')
depends=('glibc' 'libtirpc')
makedepends=('git')
provides=('lsof')
conflicts=('lsof')
source=("git+https://github.com/lsof-org/lsof.git")
sha256sums=('SKIP')


pkgver() {
  cd "lsof"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "lsof"

  ./Configure -n linux
  make CC="cc $CFLAGS $CPPFLAGS $LDFLAGS"
}

package() {
  cd "lsof"

  install -Dm755 "lsof" -t "$pkgdir/usr/bin"
  install -Dm644 "Lsof.8" "$pkgdir/usr/share/man/man8/lsof.8"

  sed -n '/^ \* Copyright 1994 Purdue/,/removed or altered./p' "main.c" > "LICENSE"
  sed -i -e 's|^ \*||g;s|^ ||g' "LICENSE"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/lsof"
}
