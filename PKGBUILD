# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=0.8
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
depends=('python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/cvs-fast-export/"
license=('GPL2')
source=(http://www.catb.org/~esr/$pkgname/$pkgname-$pkgver.tar.gz
        'cvssync.txt::https://gitorious.org/cvs-fast-export/cvs-fast-export/raw/759a97ffa0b13af12dbf9cacfce96f049e1f0f0f:cvssync.asc'
        0001_fix-makefile.patch)
sha256sums=('856c09c9fb5e03fe0c59b0a6cc58c11debf6d58745f7762472be16360b4effe1'
            'SKIP'
            '5c75fde5feedf1d1cf73110ec86f61ff85b701163f64f19416c4b7d328a0fb82')

prepare() {
  cd ${pkgname}-${pkgver}

  # Grumble about "make install" targets that don't work...
  patch Makefile ../0001_fix-makefile.patch

  # Naming this *.asc in the source array makes makepkg
  # think it's a GPG signature...
  ln -s ../cvssync.txt cvssync.asc

  2to3 -w cvssync
}

build() {
  cd ${pkgname}-${pkgver}

  make $pkgname{,.1} cvssync.1
}

package() {
  cd ${pkgname}-${pkgver}

  make prefix=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
