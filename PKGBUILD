# Maintainer: Gaël Donval <gdonval+aur at google mail>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgbase='dynd'
pkgname='dynd'
pkgver=0.7.2
pkgrel=1
pkgdesc='A dynamic array library (similar to python-numpy but written in C++).'
groups=('blaze-ecosystem')
arch=('i686' 'x86_64')
url='https://github.com/libdynd/libdynd'
license=('BSD')
makedepends=('cmake')
depends=('fftw')
source=("https://github.com/libdynd/libdynd/archive/v${pkgver}.tar.gz")
sha1sums=('e360c8da6cbb6b8f6d719458c067defbfee5d475')
md5sums=('7447e1c0620cfd51c32bc260a01e0a2c')

build() {
  cd "${srcdir}"/libdynd-$pkgver
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DDYND_FFTW=ON \
        -DFFTW_PATH=/usr/include \
        -DDYND_LLVM=OFF \
        -DDYND_BUILD_BENCHMARKS=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_CXX_FLAGS="-march=native -O3 -pipe -fstack-protector-strong " \
        -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-DNDEBUG" \
        ..
  make
}

check() {
  LD_LIBRARY_PATH="${srcdir}/libdynd-$pkgver/build:$LD_LIBRARY_PATH"
  ${srcdir}/libdynd-$pkgver/build/tests/./test_libdynd
}

package_dynd() {
  cd "${srcdir}"/libdynd-$pkgver
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  cd build
  make DESTDIR="$pkgdir/" install
  rm "${pkgdir}"/usr/bin/test_libdynd
}
