# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Alexander Bogdanov <andorn@gmail.com>

pkgname=kchmviewer
pkgver=6.1
pkgrel=1
pkgdesc="A .chm files (MS HTML help file format) viewer"
arch=('i686' 'x86_64')
url="http://kchmviewer.sourceforge.net/"
license=('GPL')
depends=('desktop-file-utils' 'chmlib' 'kdebase-runtime' 'xdg-utils')
makedepends=('automoc4' 'cmake' 'patch')
options=('libtool')
install=$pkgname.install
changelog=$pkgname.changelog
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname-build.patch)
sha256sums=('f673c3aaca735d799d14b9f6f1b302e9bb77d5c0a0b601b4b5e0beed1c99fe78'
            '567bdcaa1809618fe3a441345586a491247b76e4dd46db8ff8497bd53d74adbc')

build() {
  cd $pkgname-$pkgver

  patch -Np1 -i "${srcdir}"/$pkgname-build.patch

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=${pkgdir} install

#icon file
  install -D -m644 "${srcdir}"/$pkgname-$pkgver/packages/$pkgname.png \
    ${pkgdir}/usr/share/pixmaps/$pkgname.png

#msits.protocol file provided by kdegraphics-okular package
  rm -rf ${pkgdir}/usr/share/kde4
#kio_msits.so file provided by kdegraphics-okular package - FS#14376
  rm -rf ${pkgdir}/usr/lib
}
