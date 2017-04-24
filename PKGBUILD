# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.9.4+16+g07418011
pkgrel=2
pkgdesc="XML parsing library, version 2"
arch=(i686 x86_64)
license=('MIT')
depends=('zlib' 'readline' 'ncurses' 'xz' 'icu')
options=(!makeflags)
makedepends=('python2' 'python' 'git')
url="http://www.xmlsoft.org/"
_commit=074180119fc90d5fd04ef9e8a5ee1910d6f9ad8e  # master
source=(git+https://git.gnome.org/browse/libxml2#commit=$_commit
        https://www.w3.org/XML/Test/xmlts20080827.tar.gz
        libxml2-2.9.4-remove-pyverify_fd.patch)
sha256sums=('SKIP'
            '96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7'
            'c201b0d6364a7b9df58ce40a5fc506e58945a3fbb834af9c1193a35665789d60')

pkgver() {
  cd $pkgname
  git describe --long | sed -e 's/-/+/g' -e 's/^v//'
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
