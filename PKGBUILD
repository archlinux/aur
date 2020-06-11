# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: maz-1 <ohmygod19993@gmail.com>

pkgname=('qt5-heif-git')
pkgbase=qt-heif-image-plugin
pkgver=0.3.3.r4.g671166e
pkgrel=4
pkgdesc="Enables HEIF support in Qt applications"
arch=('x86_64')
url="https://github.com/jakar/qt-heif-image-plugin"
license=('LGPL')
depends=('libheif')
makedepends=('cmake' 'qt5-base')
provides=('qt5-heif')
conflicts=('qt5-heif')
source=('git+https://github.com/jakar/qt-heif-image-plugin.git' 'imagethumbnail-heif.desktop')
sha256sums=('SKIP'
            'e2810903300af8ff1689112faf6aa062c6112f387b0a643bf35082cd5ab8d14c')

pkgver() {
  cd "$srcdir/$pkgbase"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build-qt5
  cd build-qt5
  cmake "$srcdir/$pkgbase" -DCMAKE_INSTALL_PREFIX="/usr" -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5
  make
}

package_qt5-heif-git() {
  depends+=('qt5-base')

  cd build-qt5
  make DESTDIR=$pkgdir install
	
  install -Dm755 "${srcdir}/imagethumbnail-heif.desktop" "${pkgdir}/usr/share/kservices5/imagethumbnail-heif.desktop"
}
