# Maintainer: a821
# Contributor: Daniel Isenmann <daniel [at] archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=gc-git
pkgver=8.2.0.r513.g515d30eb
pkgrel=1
pkgdesc="A garbage collector for C and C++"
arch=('x86_64')
url="https://www.hboehm.info/gc/"
license=('GPL')
depends=('gcc-libs')
source=($pkgname::git+https://github.com/ivmai/bdwgc.git)
sha512sums=('SKIP')
conflicts=('gc')
provides=('gc')

pkgver() {
  cd $pkgname
  git describe | sed -e 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --enable-cplusplus --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  sed 's|GC_MALLOC 1L|gc 3|g' gc.man |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/man/man3/gc.3"
}
