# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.9.3+14+gd5bd2a9
pkgrel=1
pkgdesc="XML parsing library, version 2"
arch=(i686 x86_64)
license=('MIT')
depends=('zlib' 'readline' 'ncurses' 'xz')
makedepends=('python2' 'python' 'git')
url="http://www.xmlsoft.org/"
source=('git://git.gnome.org/libxml2#commit=d5bd2a9a'
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
  mv xmlconf build-py3/
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
  make
}

check() {
  cd build-py3
  make check
}

package() {
  cd build-py3
  find doc -type f -exec chmod 0644 {} \;

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  cd ../build-py2/python
  make DESTDIR="${pkgdir}" install
}
