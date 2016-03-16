# Maintainer: Flávio Zavan <flaviozavan at gmail dot com>

pkgname=('face-analysis-sdk')
pkgver=0.1
pkgrel=1
pkgdesc="Facial detection, landmark tracking and expression transfer library"
arch=('i686' 'x86_64')
license=('custom')
url="http://face.ci2cv.net/"
depends=('opencv')
makedepends=('cmake')

source=("https://github.com/ci2cv/face-analysis-sdk/archive/stable.zip"
    "includes.patch")

md5sums=('30d54cb3aab3dd8e59e4d7d081c3561e'
    'cfd0ba1a7d7fea1fe40a947e2e90a2b4')

_cmakeopts=('-D OpenCV_DIR=/usr/share/opencv'
            '-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr')

build() {
  cd "${pkgname}-stable"
  patch -p1 < ../includes.patch
  mkdir -p build
  cd build
  cmake ${_cmakeopts[@]} ..
  make
}

package() {
  cd "${pkgname}-stable/build"
  cd bin
  find -type f | while read i; do install -D "$i" "$pkgdir/usr/bin/$i"; done
  cd ..
  cd lib
  find -type f | while read i; do install -D "$i" "$pkgdir/usr/lib/$i"; done
  cd ../..
  cd src
  find -type f -name "*.h" -o -name "*.hpp" | while read i; do
    install -D "$i" "$pkgdir/usr/include/face-analysis-sdk/$i"
  done
}
