# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.9.7+4+g72182550
pkgrel=2
pkgdesc="XML parsing library, version 2"
arch=(i686 x86_64)
license=('MIT')
depends=('zlib' 'readline' 'ncurses' 'xz' 'icu')
options=(!makeflags)
makedepends=('python2' 'python' 'git')
url="http://www.xmlsoft.org/"
_commit=72182550926d31ad17357bd3ed69e49d7e69df02  # master~7
source=(git+https://git.gnome.org/browse/libxml2#commit=$_commit
        https://www.w3.org/XML/Test/xmlts20130923.tar.gz
        libxml2-2.9.4-remove-pyverify_fd.patch)
sha256sums=('SKIP'
            '9b61db9f5dbffa545f4b8d78422167083a8568c59bd1129f94138f936cf6fc1f'
            'c9cebff010bd99c5453847e87b9fa8fdd7f744f415bf680b3650877789460ca9')

pkgver() {
  cd $pkgname
  git describe --long | sed -e 's/-rc/rc/' -e 's/-/+/g' -e 's/^v//'
}

prepare() {
  mkdir build-py3
  mkdir build-py2
  mv xmlconf build-py2/
  cd $pkgname

  patch -Np1 -i ../libxml2-2.9.4-remove-pyverify_fd.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd build-py2
  ../$pkgname/configure --prefix=/usr --with-threads --with-history --with-python=/usr/bin/python2 --with-icu
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make

  cd ../build-py3
  ../$pkgname/configure --prefix=/usr --with-threads --with-history --with-python=/usr/bin/python --with-icu
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  PYTHONHASHSEED=0 make
}

check() {
  cd build-py2
  make check
}

package() {
  cd build-py2
  find doc -type f -exec chmod 0644 {} \;

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  cd ../build-py3/python
  PYTHONHASHSEED=0 make DESTDIR="${pkgdir}" install
}
