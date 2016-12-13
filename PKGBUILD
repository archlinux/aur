# $Id: PKGBUILD 36062 2009-04-19 20:15:39Z jgc $
# Maintainer: Paul Gideon Dann <pdgiddie_at_gmail.com>

pkgname=poppler-qt-lcd
pkgver=0.49.0
pkgrel=1
pkgdesc="Poppler Qt bindings, with patches to allow subpixel rendering via Cairo"
license=('GPL')
arch=(i686 x86_64)
provides=("poppler-qt=${pkgver}" "poppler-qt4=${pkgver}")
conflicts=('poppler-qt' 'poppler-qt4')
depends=('qt4' 'cairo' "poppler>=${pkgver}")
makedepends=('cmake' 'pkgconfig')
url="https://github.com/giddie/poppler-qt4-cairo-backend"
source=(http://poppler.freedesktop.org/poppler-${pkgver}.tar.xz
        0001-Cairo-backend-added-to-Qt4-wrapper.patch
        0002-Setting-default-Qt4-backend-to-Cairo.patch
        0003-Apply-subpixel-rendering-in-Cairo-Backend.patch
        0004-Don-t-build-the-main-poppler-library.patch)
md5sums=('9e057ed8eee1f9979fa75d8f044783b8'
         '2dced22cd5ca3b0432aeb643a20c5d98'
         'c89bbfba7d89b88c3120ff9f6b089ea9'
         '86be3ae0b8073ad315ccb5f65cb5d519'
         '3a767dda20553fad7fec9d3b907784aa')

build() {
  cd "${srcdir}/poppler-${pkgver}"

  for patch in ${srcdir}/*.patch; do
    patch -Np1 -i $patch
  done;

  mkdir -p build
  cd build
  cmake -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_CPP=OFF -DENABLE_UTILS=OFF \
        -DWITH_GLIB=OFF -DBUILD_QT4_TESTS=OFF \
        ..
  make poppler-qt4
}

package() {
  cd "${srcdir}/poppler-${pkgver}/build"

  make DESTDIR="${pkgdir}" -C qt4/src install
  msg "Removing unwanted pkg-config files"
  rm -f "${pkgdir}"/usr/lib/pkgconfig/poppler{,-splash,-cairo}.pc
}
