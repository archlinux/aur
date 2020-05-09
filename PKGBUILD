# Maintainer: Pietro Carrara <pbcarrara@inf.ufrgs.br>

pkgname=gwenview-auto-resize-git
pkgver=r6357.3da2a238
pkgrel=1
pkgdesc='A fast and easy to use image viewer for KDE - Patched to resize window to fit image'
arch=('i686' 'x86_64')
url='http://kde.org/applications/graphics/gwenview/'
license=('GPL')
depends=(kactivities baloo libkipi libkdcraw kparts kitemmodels cfitsio phonon-qt5 purpose perl)
optdepends=('qt5-imageformats: support for tiff, webp, and more image formats'
            'kimageformats: support for dds, xcf, exr, psd, and more image formats'
            'kipi-plugins: export to various online services'
            'kamera: import pictures from gphoto2 cameras')
makedepends=(git extra-cmake-modules kdoctools)
conflicts=('kdegraphics-gwenview' 'gwenview')
provides=('gwenview')
source=("git://anongit.kde.org/gwenview.git")
install=$pkgname.install
sha256sums=('SKIP')

pkgver() {
  cd gwenview
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd gwenview
  git apply ../../window-sizing-auto.patch
  cd ..

  mkdir -p build
}

build() { 
  cd build
  cmake ../gwenview \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
