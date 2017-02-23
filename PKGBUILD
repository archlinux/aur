# $Id: PKGBUILD 36062 2009-04-19 20:15:39Z jgc $
# Maintainer: Paul Gideon Dann <pdgiddie_at_gmail.com>

pkgname=poppler-qt-lcd
pkgver=0.52.0
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
md5sums=('dfdd55d5df39685bbb82b0c08fa4ef66'
         '9425ab6e09e6a1508fb83958bb59bcc0'
         'b4af67eae3097e4d7234c431e7d69e39'
         '557f60f180e4337820c9617f6d0c184a'
         '697056834a8786506b2bc882a7dee9c2')

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
