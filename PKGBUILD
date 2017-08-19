# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.9.4+99+g27f310d4
pkgrel=1
pkgdesc="XML parsing library, version 2"
arch=(i686 x86_64)
license=('MIT')
depends=('zlib' 'readline' 'ncurses' 'xz' 'icu')
options=(!makeflags)
makedepends=('python2' 'python' 'git')
url="http://www.xmlsoft.org/"
_commit=27f310d453b7e2e71847e5910a0961753aacdbd1  # master
source=(git+https://git.gnome.org/browse/libxml2#commit=$_commit
        https://www.w3.org/XML/Test/xmlts20080827.tar.gz
        libxml2-2.9.4-remove-pyverify_fd.patch
        bug786267.patch)
sha256sums=('SKIP'
            '96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7'
            'c9cebff010bd99c5453847e87b9fa8fdd7f744f415bf680b3650877789460ca9'
            'aca462fd71cec83cc8a98ccfc4065ab68167aab2a148cf7db39596a20f4a7ca7')

pkgver() {
  cd $pkgname
  git describe --long | sed -e 's/-/+/g' -e 's/^v//'
}

prepare() {
  mkdir build-py3
  mkdir build-py2
  mv xmlconf build-py2/
  cd $pkgname

  # https://bugs.archlinux.org/task/54828
  git revert -n 79c8a6b10593c709fd3ceea9deef35c1a3da70f0
  # https://bugs.archlinux.org/task/55134
  patch -Np1 -i ../bug786267.patch

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
