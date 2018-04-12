# $Id$
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor Romain Bouchaud-Leduc <r0m1.bl@camaris.org>

pkgname=trickle
pkgver=1.07
pkgrel=9
pkgdesc="Lightweight userspace bandwidth shaper"
arch=('i686' 'x86_64')
url="http://monkey.org/~marius/trickle"
license=('BSD')
depends=('libevent')
source=("http://monkey.org/~marius/trickle/${pkgname}-${pkgver}.tar.gz"
        "fix-crasher.patch")
md5sums=('860ebc4abbbd82957c20a28bd9390d7d'
         'a072091bce131e9f7229bff85ed5858c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # FS#27549
  sed -i 's|^_select(int|select(int|' trickle-overload.c

  # FS#35872
  patch -Np1 -i "${srcdir}/fix-crasher.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ./configure --prefix=/usr \
              --mandir=/usr/share/man
  sed -i "s|.*in_addr_t.*||g" config.h
  make -j1
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
