# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>

_realname=libxml2
pkgname=${_realname}-linenum
pkgver=2.9.2
pkgrel=1
pkgdesc="XML parsing library, version 2, with high line number patch applied"
arch=(i686 x86_64)
license=('MIT')
depends=('zlib' 'readline' 'ncurses' 'xz')
makedepends=('python2')
optdepends=('python2: python bindings to libxml')
url="http://www.xmlsoft.org/"
source=(ftp://ftp.xmlsoft.org/${_realname}/${_realname}-${pkgver}.tar.gz
        http://www.w3.org/XML/Test/xmlts20080827.tar.gz
        revert-catalog-initialize.patch
        fix-CVE-2014-3660.patch
        bug325533-16bit-linenum.patch)
md5sums=('9e6a9aca9d155737868b3dc5fd82f788'
         'ae3d1ebe000a3972afa104ca7f0e1b4a'
         'fdb2e26174ac9cced85ffbf4fb782187'
         '71c88ee5a133461a8ab8aaa194899453'
         '72d9e5a59dfe070effb4a59102d40195')
provides=('libxml2')
conflicts=('libxml2')

prepare() {
  cd ${_realname}-${pkgver}
  sed -e 's|/usr/bin/python -u|/usr/bin/python2 -u|g' -e 's|/usr/bin/python$|/usr/bin/python2|g' -i python/tests/*.py
  mv ../xmlconf .
  patch -Np1 -i ../revert-catalog-initialize.patch
  patch -Np1 -i ../fix-CVE-2014-3660.patch
  patch -p0 -b -i ../bug325533-16bit-linenum.patch
}

build() {
  cd ${_realname}-${pkgver}
  ./configure --prefix=/usr --with-threads --with-history --with-python=/usr/bin/python2
  make
}

check() {
  cd ${_realname}-${pkgver}
  make check
}

package() {
  cd ${_realname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_realname}/COPYING"
}
