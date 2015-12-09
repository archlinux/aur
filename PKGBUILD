# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.9.3
pkgrel=1
pkgdesc="XML parsing library, version 2"
arch=(i686 x86_64)
license=('MIT')
depends=('zlib' 'readline' 'ncurses' 'xz')
makedepends=('python2')
optdepends=('python2: python bindings to libxml')
url="http://www.xmlsoft.org/"
source=(ftp://ftp.xmlsoft.org/${pkgname}/${pkgname}-${pkgver}.tar.gz
        http://www.w3.org/XML/Test/xmlts20080827.tar.gz)
md5sums=('daece17e045f1c107610e137ab50c179'
         'ae3d1ebe000a3972afa104ca7f0e1b4a')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -e 's|/usr/bin/python -u|/usr/bin/python2 -u|g' -e 's|/usr/bin/python$|/usr/bin/python2|g' -i python/tests/*.py
  mv ../xmlconf .
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-threads --with-history --with-python=/usr/bin/python2

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
