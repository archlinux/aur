# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openexr
pkgver=2.5.5
pkgrel=1
pkgdesc="An high dynamic-range image file format library"
url="https://www.openexr.com/"
arch=('x86_64')
license=('BSD')
depends=('zlib')
makedepends=('cmake' 'python' 'boost' 'freeglut' 'python-numpy' 'chrpath')
optdepends=('boost-libs: python support' 'python: python support') 
conflicts=('ilmbase')
replaces=('ilmbase')
source=($pkgname-$pkgver.tar.gz::"https://github.com/openexr/openexr/archive/v$pkgver.tar.gz")
sha256sums=('59e98361cb31456a9634378d0f653a2b9554b8900f233450f2396ff495ea76b3')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D -m644 $pkgname-$pkgver/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"

# Install missing python module
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  install -Dm755 build/python3*/imathnumpy.so -t "$pkgdir"/$_pythonpath 
}
