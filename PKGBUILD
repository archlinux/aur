# Maintainer: Daniel Isenmann <daniel [at] archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=gc-git
_pkgname=bdwgc
pkgver=8.1.99
pkgrel=1
pkgdesc="A garbage collector for C and C++"
arch=('x86_64')
url="https://www.hboehm.info/gc/"
license=('GPL')
depends=('gcc-libs')
source=(git+https://github.com/ivmai/bdwgc.git)
sha512sums=('skip')
conflicts=('gc')
provides=('gc')

prepare() {
  cd ${_pkgname}

}

build() {
  cd ${_pkgname}
  ./autogen.sh
  ./configure --prefix=/usr --enable-cplusplus --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd ${_pkgname}
  make check
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
  sed 's|GC_MALLOC 1L|gc 3|g' doc/gc.man |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/man/man3/gc.3"
}
