# Maintainer: Kevin Meagher <kmeagher@icecube.wisc.edu>
pkgname=photospline
pkgver=2.1.0
pkgrel=1
pkgdesc="Library for using the penalized spline technique to efficiently compute, store, and evaluate B-spline representations of such tables."
arch=('x86_64')
url="https://github.com/icecube/photospline"
license=('BSD')
depends=('cfitsio' 'blas' 'lapack' 'suitesparse' 'python-numpy')
makedepends=('cmake')
source=("https://github.com/icecube/photospline/archive/refs/tags/v${pkgver}.tar.gz"
		'suitesparse.patch')
sha256sums=('bd6c58df8893917909b79ef2510a2043f909fbb7020bdace328d4d36e0222b60'
            '50ba448340b43ab38e5243b1309dc2cf458fdbe884c8c28866d510f1a1f80d09')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/suitesparse.patch"
}

build() {
    cmake -B build -S "photospline-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
        make -C build DESTDIR="$pkgdir" install
        install -Dm644 "${pkgname}-${pkgver}/COPYING.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
