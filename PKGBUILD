# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Alexander Bogdanov <andorn@gmail.com>

pkgname=kchmviewer
pkgver=5.2
pkgrel=1
pkgdesc="A .chm files (MS HTML help file format) viewer"
arch=('i686' 'x86_64')
url="http://kchmviewer.sourceforge.net/"
license=('GPL')
depends=('chmlib' 'kdelibs' 'qt' 'xdg-utils')
makedepends=('automoc4' 'cmake')
options=('libtool')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'kchmview-build-fix.diff')
md5sums=('9798c7f949d1137949e69a8c226415f9'
         '555b08c8aca9883e7916dc1fe11a8aea')

build() {
  cd build-${pkgver}

  # got patch from http://bugs.gentoo.org/320191
  patch -Np1 -i ${srcdir}/kchmview-build-fix.diff

  cmake . -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd build-${pkgver}

  make DESTDIR=${pkgdir} install

  #icon file
  install -D -m644 ${srcdir}/build-${pkgver}/packages/${pkgname}.png \
    ${pkgdir}/usr/share/pixmaps/${pkgname}.png

  #msits.protocol file provided by kdegraphics package
  rm -rf ${pkgdir}/usr/share/kde4
  #kio_msits.so file provided by kdegraphics package - FS#14376
  rm -rf ${pkgdir}/usr/lib
}
