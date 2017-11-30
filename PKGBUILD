# $Id: PKGBUILD 36062 2009-04-19 20:15:39Z jgc $
# Maintainer: Paul Gideon Dann <pdgiddie_at_gmail.com>

pkgname=poppler-qt-lcd
pkgver=0.61.1
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
md5sums=('2d3dcea88d6a814317fac74d2a16c3cd'
         '90d723430b0789645a2ed3b0321682db'
         '70d9321df8089c6f91cc2c18995870ec'
         'c62c09b41f8ef0d2d86a6fc3fa6b65b0'
         '305bd77d5e3ea256959df12f22cb0bcd')

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
        -DWITH_GLIB=OFF \
        ..
  make poppler-qt4
}

package() {
  cd "${srcdir}/poppler-${pkgver}/build"

  make DESTDIR="${pkgdir}" -C qt4/src install
  msg "Removing unwanted pkg-config files"
  mv "${pkgdir}"/usr/lib{64,}
  rm -f "${pkgdir}"/usr/lib/pkgconfig/poppler{,-splash,-cairo}.pc
}
