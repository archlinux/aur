pkgname=cgal-ipelets
pkgver=4.9
pkgrel=2
ipever=7.2.7
pkgdesc="Ipelets from CGAL"
arch=('i686' 'x86_64')
url="http://www.cgal.org"
source=(https://github.com/CGAL/cgal/releases/download/releases%2FCGAL-${pkgver}/CGAL-${pkgver}.tar.xz
        no-skeleton.patch)
depends=('cgal' 'ipe')
makedepends=('cmake' 'boost' 'cgal' 'ipe')
license=('GPL' 'QPL')

prepare() {
  # Remove this once we switch to CGAL 4.8 (it's a problem with Boost)
  cd "$srcdir/CGAL-$pkgver/demo/CGAL_ipelets"
  patch < $srcdir/no-skeleton.patch
}

build() {
  cd "$srcdir/CGAL-$pkgver/demo/CGAL_ipelets"
  cmake .
  cmake . -DCMAKE_CXX_FLAGS="-std=c++11"        # putting it in the first line won't work (system-wide CGAL settings will override this choice)
  make
}

package() {
  mkdir -p "$pkgdir/usr/lib/ipe/$ipever/ipelets/"
  cp "$srcdir/CGAL-$pkgver/demo/CGAL_ipelets/"*.so "$pkgdir/usr/lib/ipe/$ipever/ipelets/"
  cp "$srcdir/CGAL-$pkgver/demo/CGAL_ipelets/lua/"* "$pkgdir/usr/lib/ipe/$ipever/ipelets/"
}
md5sums=('ee31343dbc4bf7b5b7501ec1650e9233'
         'f9e230e8c7f787f9eeccb2ed302dca66')
