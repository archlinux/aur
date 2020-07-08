# $Id: PKGBUILD 36062 2009-04-19 20:15:39Z jgc $
# Maintainer: Paul Gideon Dann <pdgiddie_at_gmail.com>

pkgname=poppler-qt-lcd
pkgver=0.90.0
pkgrel=1
pkgdesc="Poppler Qt bindings, with patches to allow subpixel rendering via Cairo"
license=('GPL')
arch=(i686 x86_64)
provides=("poppler-qt=${pkgver}" "poppler-qt5=${pkgver}")
conflicts=('poppler-qt' 'poppler-qt4' 'poppler-qt5')
depends=('qt5-base' 'cairo' "poppler>=${pkgver}")
makedepends=('cmake' 'pkgconfig')
url="https://github.com/giddie/poppler-cairo-backend"
source=(http://poppler.freedesktop.org/poppler-${pkgver}.tar.xz
        0001-Cairo-backend-added-to-Qt5-wrapper.patch
        0002-Setting-default-Qt5-backend-to-Cairo.patch
        0003-Apply-subpixel-rendering-in-Cairo-Backend.patch
        0004-Don-t-build-the-main-poppler-library.patch)
md5sums=('5af9e25d8d2b9efc0d538ce2213be22e'
         'b1a858ca760121cb90e124a8abccaf54'
         'f49c3fd78d35a10a51823cf22fdbe062'
         'd294271efda705ddf9599845d1f11278'
         '814117bb456f8106f59562ec6783d9fe')

build() {
  cd "${srcdir}/poppler-${pkgver}"

  for patch in ${srcdir}/*.patch; do
    patch -Np1 -i $patch
  done;

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_CPP=OFF -DENABLE_UTILS=OFF \
        -DWITH_GLIB=OFF \
        ..
  make poppler-qt5
}

package() {
  cd "${srcdir}/poppler-${pkgver}/build"

  make DESTDIR="${pkgdir}" -C qt5/src install
  msg "Removing unwanted pkg-config files"
  rm -f "${pkgdir}"/usr/lib/pkgconfig/poppler{,-splash,-cairo}.pc
}
