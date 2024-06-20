# $Id: PKGBUILD 36062 2009-04-19 20:15:39Z jgc $
# Maintainer: Paul Gideon Dann <pdgiddie_at_gmail.com>

pkgname=poppler-qt-lcd
pkgver=24.06.1
pkgrel=1
pkgdesc="Poppler Qt bindings, with patches to allow subpixel rendering via Cairo"
license=('GPL')
arch=(i686 x86_64)
provides=("poppler-qt5=${pkgver}" "libpoppler-qt5.so")
conflicts=('poppler-qt5')
depends=('qt5-base' 'cairo' "poppler>=${pkgver}")
makedepends=('cmake' 'pkgconfig' 'boost')
url="https://github.com/giddie/poppler-cairo-backend"
source=(http://poppler.freedesktop.org/poppler-${pkgver}.tar.xz
        0001-Cairo-backend-added-to-Qt5-wrapper.patch
        0002-Setting-default-Qt5-backend-to-Cairo.patch)
md5sums=('938fed7c45fcc424ce5201d4d77c9a81'
         '6eacbd40a3330ba6f805ef0edd2566ba'
         'ee1daeebf2a83e52cbc56c320d8a73b9')

build() {
  cd "${srcdir}/poppler-${pkgver}"

  for patch in ${srcdir}/*.patch; do
    patch -Np1 -i $patch
  done;

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_CPP=OFF \
        -DENABLE_UTILS=OFF \
        -DWITH_GLIB=OFF \
        -DENABLE_QT6=OFF \
        ..
  make poppler-qt5
}

package() {
  cd "${srcdir}/poppler-${pkgver}/build"

  make DESTDIR="${pkgdir}" -C qt5/src install
  msg "Removing unwanted pkg-config files"
  rm -f "${pkgdir}"/usr/lib/pkgconfig/poppler{,-splash,-cairo}.pc
}
