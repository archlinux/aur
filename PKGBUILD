# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.9.4+12+ge905f08
pkgrel=3
pkgdesc="XML parsing library, version 2"
arch=(i686 x86_64)
license=('MIT')
depends=('zlib' 'readline' 'ncurses' 'xz')
options=(!makeflags)
makedepends=('python2' 'python' 'git')
url="http://www.xmlsoft.org/"
_commit=e905f08123e4a6e7731549e6f09dadff4cab65bd  # master
source=(git://git.gnome.org/libxml2#commit=$_commit
        http://www.w3.org/XML/Test/xmlts20080827.tar.gz)
md5sums=('SKIP'
         'ae3d1ebe000a3972afa104ca7f0e1b4a')

pkgver() {
  cd $pkgname
  git describe --long | sed -e 's/-/+/g' -e 's/^v//'
}

prepare() {
  mkdir build-py3
  mkdir build-py2
  mv xmlconf build-py2/
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd build-py2
  ../$pkgname/configure --prefix=/usr --with-threads --with-history --with-python=/usr/bin/python2
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make

  cd ../build-py3
  ../$pkgname/configure --prefix=/usr --with-threads --with-history --with-python=/usr/bin/python
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
