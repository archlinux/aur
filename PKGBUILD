# $Id: PKGBUILD 36062 2009-04-19 20:15:39Z jgc $
# Maintainer: Paul Gideon Dann <pdgiddie_at_gmail.com>

pkgname=poppler-qt-lcd
pkgver=21.07.0
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
        0002-Setting-default-Qt5-backend-to-Cairo.patch)
md5sums=('3c4b500a0af4cf1dc4a1c66fa48b7551'
         '20ef6dd8416b1c86f905dd6f37be97da'
         '401899119f201c3adb83290e5356a830')

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
