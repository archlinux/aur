# Maintainer: Kevin Slagle <kjslag_at_gmail.com>
# Contributor: Paul Gideon Dann <pdgiddie_at_gmail.com>

# Poppler supports two different backends: Cairo and Splash (a low-level backend inherited from Xpdf).
# Although Cairo renders better and faster than Splash, the Qt bindinds for Poppler currently only supports Splash due to political reasons:
# https://bugs.freedesktop.org/show_bug.cgi?id=25240

# This package is based off of Paul Gideon Dann's poppler-qt-lcd package, which uses Cairo as the default backend for the Qt4 bindings and also includes patches for subpixel rendering in Cairo.
# (The subpixel rendering patches are not included in this package.)
# https://aur.archlinux.org/packages/poppler-qt-lcd

# The included patches add Cairo support to the Qt5 bindings and set Cairo as the default backend.
# The patches are based off of Paul Gideon Dann's patches for the Qt4 bindings:
# https://github.com/giddie/poppler-qt4-cairo-backend

pkgname=poppler-qt5-cairo
pkgver=0.63.0
pkgrel=1
pkgdesc="Poppler Qt5 bindings, with patches to use the Cairo backend instead of Splash"
license=('GPL')
arch=(i686 x86_64)
provides=("poppler-qt5=${pkgver}")
conflicts=('poppler-qt5')
depends=('qt5-base' 'cairo' "poppler>=${pkgver}")
makedepends=('cmake' 'pkgconfig')
#url="https://github.com/giddie/poppler-qt4-cairo-backend"
source=(http://poppler.freedesktop.org/poppler-${pkgver}.tar.xz
        0001-Cairo-backend-added-to-Qt5-wrapper.patch
        0002-Setting-default-Qt5-backend-to-Cairo.patch
        0003-Do-not-build-the-main-poppler-library.patch)
md5sums=('66a54da4896b1408611699feda5c1821'
         '0879e52d77ac583c8efd9f724f4756fa'
         'f51b0d3f1115d9393dadd5474c32b39f'
         'd195c70fafbabd334b104bccf6f52a43')

prepare() {
  mkdir build

  cd poppler-$pkgver
  for patch in ${srcdir}/*.patch; do
    patch -Np1 -i $patch
  done
}

build() {
  cd build
  cmake ../poppler-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_XPDF_HEADERS=ON \
    -DENABLE_UTILS=OFF \
    -DENABLE_CPP=OFF \
    -DENABLE_GLIB=OFF \
    -DBUILD_QT5_TESTS=OFF
  make poppler-qt5
}

package() {
  cd build

  make -C qt5 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-qt5.pc "${pkgdir}/usr/lib/pkgconfig/"
}
