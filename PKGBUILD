# Maintainer: VanLaser <gabi_laser at yahoo com>

pkgname='eql5-git'
pkgver='r254.dbb1c60'
pkgrel=1
pkgdesc='Embedded Qt Lisp (Qt5 binding embedded in ECL, embeddable in Qt)'
arch=('x86_64')
url='https://gitlab.com/eql/EQL5'
# TODO: also install license file
license=('MIT')
depends=('ecl'
         'qt5-base'
         'qt5-tools'
         'qt5-multimedia'
         'qt5-quickcontrols'
         'qt5-svg'
         'qt5-webengine')
makedepends=('git'
             'qt5-tools')
conflicts=('eql5')
provides=('eql5')             
source=('git+https://gitlab.com/eql/EQL5')
sha256sums=('SKIP')

pkgver() {
         cd EQL5
         printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
          cd EQL5/src/
          sed -i 's/\/usr\/local\/bin/\/usr\/bin/' *.pro
	  sed -i 's/\/usr\/local\/lib/\/usr\/lib/' *.pro
}

build() {
        cd EQL5/src/
        ecl -shell make.lisp
        qmake eql5.pro
        make -j8
	sed -i 's/\/usr\/local\/include/\/usr\/include/' *.pro
}

package() {
          cd EQL5/src/
          make INSTALL_ROOT="$pkgdir/" install
	  cd $srcdir/EQL5
	  install -Dm644 LICENSE-1.MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	  install -Dm644 LICENSE-2-MAKE-QIMAGE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MAKE_QIMAGE"
}
