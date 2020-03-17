# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=rarian
pkgver=0.8.1
pkgrel=7
pkgdesc="Documentation meta-data library, designed as a replacement for Scrollkeeper."
arch=('x86_64')
url="https://rarian.freedesktop.org/"
license=('GPL')
depends=('gcc-libs' 'sh')
makedepends=('libxslt')
source=(https://download.gnome.org/sources/${pkgname}/0.8/${pkgname}-${pkgver}.tar.bz2
        user-segfault.patch)
md5sums=('75091185e13da67a0ff4279de1757b94'
         '457e9827197009cfa360911fe49a5ad7')
sha256sums=('aafe886d46e467eb3414e91fa9e42955bd4b618c3e19c42c773026b205a84577'
            '518b1834d4f44e92161f0cf2f72a6474f0ec687ea53562c64109df90d343fe71')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np0 -i ../user-segfault.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
     --localstatedir=/var --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
