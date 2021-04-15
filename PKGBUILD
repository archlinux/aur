# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=tora
pkgver=3.2
pkgrel=2
pkgdesc="SQL IDE for Oracle, MySQL and PostgreSQL dbs"
arch=('x86_64')
url="https://github.com/tora-tool/tora"
license=('GPL')
depends=('qscintilla-qt5')
makedepends=('cmake' 'boost')
options=('!libtool' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        missing-qbuttongroup.patch
        fix-missing-includes.patch)
sha256sums=('a1055250e5cce668fec10ba67d05c338a1401edf8621193ade4789e3b1c58b15'
            '57d37715984bf10bb357bcbddcd7de00e8f6bb5ec5d66f99dd2a3367232a5863'
            'fbdaf36124e17df20dee1925d9557db1848643f8c0503f59021ba0c3216ff11b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # https://github.com/tora-tool/tora/issues/95#issuecomment-393641305
  sed -i '/FIND_LIBRARY(QSCINTILLA_LIBRARY/s/qt5scintilla2/qscintilla2_qt5/' cmake/modules/FindQScintilla.cmake
  
  patch -Np1 -i "$srcdir/missing-qbuttongroup.patch"
  patch -Np1 -i "$srcdir/fix-missing-includes.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake ../$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DQSCINTILLA_INCLUDE_DIR=/usr/include/qt \
        -DWANT_INTERNAL_LOKI=ON
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
