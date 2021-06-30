# Maintainer: Owen Trigueros <owentrigueros@gmail.com>

pkgname=freeling
_pkgname=FreeLing
pkgver=4.2
pkgrel=2
pkgdesc="C++ library providing language analysis functionalities for a variety of languages"
arch=('x86_64')
url="http://nlp.lsi.upc.edu/freeling"
license=('AGPL')
depends=('boost' 'icu' 'zlib' 'eigen')
makedepends=('cmake' 'swig' 'python')
optdepends=('python: python API support')
source=("https://github.com/TALP-UPC/FreeLing/releases/download/$pkgver/FreeLing-src-$pkgver.tar.gz"
        "https://github.com/TALP-UPC/FreeLing/releases/download/$pkgver/FreeLing-langs-src-$pkgver.tar.gz"
        "freeling-4.2.patch")
md5sums=("d8ecbb03de2235335d4997a55f2cb073"
         "b4de527a48e0d423c1b659505b526572"
         "9b026acfef35575e200ecc21267c1081")

prepare() {
    cd "$_pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/$pkgname-$pkgver.patch"
}

build() {
    cmake -B build -S "$_pkgname-$pkgver" \
        -DPYTHON3_API=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_FLAGS='-fpermissive' \
        -Wno-dev
    make -C build
}

package() {
    make DESTDIR="$pkgdir" -C build install
}
