# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: Daniel Isenmann <daniel [at] archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=gc-static
pkgver=7.4.2
pkgrel=1
pkgdesc="A garbage collector for C and C++ (includes static library)"
arch=('i686' 'x86_64')
url="http://www.hboehm.info/gc/"
license=('GPL')
depends=('gcc-libs' 'libatomic_ops')
conflicts=('gc')
provides=('gc')
replaces=('gc')
options=('staticlibs')
source=("http://www.hboehm.info/gc/gc_source/gc-${pkgver}.tar.gz"
        noelision.patch)
md5sums=('12c05fd2811d989341d8c6d81f66af87'
         '0be354bf60cc18363dc4c1601697717b')

prepare() {
  cd "gc-${pkgver}"

  # https://bugs.archlinux.org/task/39631
  # https://github.com/ivmai/bdwgc/pull/51
  patch -p1 -i ../noelision.patch

  sed -i 's#pkgdata#doc#' doc/doc.am
}

build() {
  cd "gc-${pkgver}"
  autoreconf -fi
  ./configure --prefix=/usr --enable-cplusplus
  make
}

check() {
  cd "gc-${pkgver}"
  make check
}

package() {
  cd "gc-${pkgver}"
  make DESTDIR="${pkgdir}" install

  sed -i -e 's/GC_MALLOC 1L/gc 3/' doc/gc.man
  install -m755 -d "${pkgdir}/usr/share/man/man3"
  install -m644 doc/gc.man "${pkgdir}/usr/share/man/man3/gc.3"
}
