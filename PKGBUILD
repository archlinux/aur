# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=photoqt
pkgver=3.4
pkgrel=3
pkgdesc="Fast and highly configurable image viewer with a simple and nice interface."
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
depends=('exiv2' 'imagemagick' 'qt5-imageformats' 'qt5-multimedia' 'qt5-svg' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'libraw' 'qt5-graphicaleffects' 'hicolor-icon-theme'
'libarchive' 'kimageformats5' 'pugixml' 'mpv' 'resvg')
# To use GraphicsMagick instead of ImageMagick replace it in the depends array above
# These dependencies are disabled in the cmake call below: 'freeimage' 'devil-ilut' 'poppler-qt5'
optdepends=('libqpsd-git: PSB/PSD support'
            'xcftools: XCF support')
makedepends=('cmake' 'qt5-tools' 'extra-cmake-modules')
source=(https://photoqt.org/downloads/source/$pkgname-$pkgver.tar.gz
        exiv2.patch)
sha256sums=('9157fdfb323daed10c992d0de2aacdebbdd3ff57e7a9f715de140f9cc5cc2dab'
            'e482087979d3bc4303a84a7f2fef716baf3e013771b9a85ed0cd85d12dd5038f')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # To build PhotoQt with less features, add -Dxxxx=OFF to
  # the next line (where xxxx is the respective CMake option).
  # to use GraphicsMagick instead of ImageMagick add: -DIMAGEMAGICK=OFF -DGRAPHICSMAGICK=ON
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DFREEIMAGE=OFF -DDEVIL=OFF -DPOPPLER=OFF -DIMAGEMAGICK=ON -DGRAPHICSMAGICK=OFF -DLIBVIPS=OFF -DVIDEO_MPV=ON -DCHROMECAST=OFF -DRESVG=ON
  
  patch -p0 < $srcdir/exiv2.patch

}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
