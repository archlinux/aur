# Maintainer: Fabio Heday <fheday@gmail.com>

pkgname=splinterpy-git
pkgver=v3.0.r9.gbce2916
pkgrel=1
epoch=1
license=('APACHE')
pkgdesc="Library for multivariate function approximation with splines (B-spline, P-spline, and more) with interfaces to C++, C, Python and MATLAB - Git build"
arch=(i686 x86_64)
url="https://github.com/bgrimstad/splinter/"
makedepends=(cmake boost git clang)
source=('git+https://github.com/bgrimstad/splinter.git')
sha512sums=('SKIP')
options=(!emptydirs)

pkgver() {
  cd splinter
  git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  export CXX=$(which clang++)
  cd splinter
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX="${pkgdir}"/ -DLIBRARY_INSTALL_DIRECTORY="${pkgdir}"/usr/lib/
  make -j
  cd ../python
  python setup.py build
#  ./scripts/build_release.sh
}

package() {
  cd splinter/build
  make install
  cd ../python
  python setup.py install --root="$pkgdir"/ --optimize=1 --prefix=/usr/
#--skip-build
#  make DESTDIR="${pkgdir}/" install
}

