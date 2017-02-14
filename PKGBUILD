# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Gunther Schulz < mail at guntherschulz.de > 
# Contributor: Kévin Guilloy <kevin at guilloy dot ath dot cx>

pkgname=qwtpolar
pkgver=1.1.1
pkgrel=1
pkgdesc='Qwt library that contains classes for displaying values on a polar coordinate system'
arch=('i686' 'x86_64')
url='http://qwtpolar.sourceforge.net/'
license=('custom:qwt')
depends=('gcc-libs' 'glibc' 'qt4' 'qwt')
source=("http://sourceforge.net/projects/qwtpolar/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
sha1sums=('38edf5220c971eef0e88fcc6db7c718e6198ccac')

prepare() {
  cd $pkgname-$pkgver

  sed -e '/^\s*QWT_POLAR_INSTALL_PREFIX/ s|=.*|= /usr|' \
      -e '/^QWT_POLAR_INSTALL_DOCS/ s|/doc|/share/doc/qwtpolar|' \
      -e '/^QWT_POLAR_INSTALL_HEADERS/ s|/include|/include/qwt|' \
      -e '/^QWT_POLAR_INSTALL_FEATURES/ s|/features|/share/qt4/mkspecs/features|' \
      -e '/^QWT_POLAR_INSTALL_PLUGINS/ s|/plugins|/lib/qt4/plugins|' \
      -e '/QwtPolarExamples/ s/^/# /' \
      -i qwtpolarconfig.pri
}

build() {
  cd $pkgname-$pkgver

  qmake-qt4 qwtpolar.pro
  make
}

package() {
  cd $pkgname-$pkgver

  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  mv "$pkgdir/usr/share/doc/qwtpolar/man/" "$pkgdir/usr/share/"
  rm "$pkgdir/usr/share/man/man3/qwtlicense.3"
}
