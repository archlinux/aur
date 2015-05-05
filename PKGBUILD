# Maintainer: Luke Shumaker <lukeshu@sbcglobal.net>
# Maintainer (AUR): Miguel Revilla <yo@miguelrevilla.com>
# Contributor (AUR): TDY <tdy@gmx.com>
# Contributor (AUR): Eduard "bekks" Warkentin <eduard.warkentin@gmail.com>

pkgname=(mdbtools gmdb2)
pkgver=0.7.1
pkgrel=1
pkgdesc="Utilities for viewing data and exporting schema from Microsoft Access database files"
arch=('i686' 'x86_64')
url="https://github.com/brianb/mdbtools"
license=('LGPL' 'GPL')
makedepends=('bison' 'flex' 'txt2man' 'autoconf' 'rarian' 'unixodbc' 'libgnomeui')
options=('!libtool' '!emptydirs')
source=($pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz
        0001-Fix-parallel-builds-make-jN-in-SQL-lexer-parser.patch::$url/commit/2892d519f3323cd3aa2b33690fe6f68504f0e516.patch
        0002-Fixes-build-error-introduced-by-previous-commit.patch::$url/commit/2f4b2d12fece5a046ccece256f73728604516326.patch
        0004-Added-.desktop-file-for-gmdb.patch::$url/commit/b449ed159d5acdca636066a4a6ba360f66174fc4.patch
        9999-autoconf-summary.patch)
md5sums=('477c7af98e75f8e6c987b020d6a822d8'
         'ee06850e2dcb517d5dbf421acdb7f647'
         'cc45c73cf9151deeb7e6ce03d2f95eff'
         '2f593a039d0d546e37b63b7c2c6c4b77'
         '1c570d626e092e5870ef704d1d1e0ca1')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  for patch in ../*.patch; do
    patch -Np1 -i "$patch"
  done
  sed -i 's/@LEXLIB@//' src/*/Makefile.am
  autoreconf -i -f
}  

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man \
              --with-unixodbc=/usr
  make
}

package_mdbtools() {
  depends=('unixodbc' 'glib2')
  optdepends=('gmdb2: graphical viewer for MDB files')
  
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" -C src/gmdb2 uninstall
}

package_gmdb2() {
  pkgdesc='Graphical viewer for Microsoft Access database files'
  license=('GPL')
  depends=("mdbtools=$pkgver" 'libgnomeui' 'desktop-file-utils')
  install=gmdb2.install

  cd "${srcdir}/${pkgbase}-${pkgver}/src/gmdb2"
  make DESTDIR="${pkgdir}" install
  install -Dm644 gmdb.desktop "$pkgdir"/usr/share/applications/gmdb2.desktop
}
