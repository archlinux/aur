pkgname=lib32-intel-gmmlib
tarname=${pkgname/lib32-/}

pkgver=22.3.2
pkgrel=1
pkgdesc="Intel Graphics Memory Management Library"
arch=(x86_64)
url="https://github.com/intel/gmmlib/"
license=(MIT)
depends=(lib32-gcc-libs)
makedepends=(cmake)
provides=(lib32-intel-gmmlib)
conflicts=(lib32-intel-gmmlib)
replaces=(lib32-intel-gmmlib)
options=(!emptydirs)
source=("https://github.com/${tarname/-//}/archive/${tarname}-${pkgver}.tar.gz")
sha256sums=('f725fbb4291ab67bbc7b31e1a268f523df384667360c931b40144db861be53d7')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake -B build -S gmmlib-${tarname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DRUN_TEST_SUITE=ON \
    -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  rm -r "$pkgdir/usr/include"
  
  install -Dm644 gmmlib-${tarname}-${pkgver}/LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
