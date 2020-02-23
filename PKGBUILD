# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libots
pkgver=0.5.0
pkgrel=6
pkgdesc='Open Text Summarizer'
url='https://libots.sourceforge.net/'
arch=('x86_64')
license=('GPL')
depends=('libxml2' 'glib2' 'popt')
source=("https://sources.archlinux.org/other/packages/libots/ots-$pkgver.tar.gz"
        libots-fix-build.patch)
sha256sums=('ea908d22256166d1200fef55a82dd3ea8e096a249eaaf0b926f3577f1a63e137'
            '0c5033302ffe8d87dd2f85745ea2a531ac573a901302d1b15bf51a3327102f6a')

prepare() {
  cd ots-${pkgver}
  touch gtk-doc.make
  sed 's/en.xml$//' -i dic/Makefile.am
  patch -p1 -i ../libots-fix-build.patch # Fix makefile dependencies (Debian)
  libtoolize --force
  aclocal
  automake --add-missing --force
  autoconf
}

build() {
  cd ots-${pkgver}
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd ots-${pkgver}
  make DESTDIR="${pkgdir}" install
}
