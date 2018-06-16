# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

_pkgname=LightGBM
pkgname=lightgbm
pkgver=2.1.1
pkgrel=2
pkgdesc="Distributed gradient boosting framework based on decision tree algorithms."
arch=('x86_64')
url="https://github.com/Microsoft/LightGBM"
license=('MIT')
depends=('python' 'boost-libs' 'ocl-icd')
makedepends=('boost' 'cmake' 'opencl-headers')
source=("https://github.com/Microsoft/LightGBM/archive/v${pkgver}.tar.gz")
sha256sums=('07da54e835f4d9991fbc526b4e0c9d0d2a47e514c6eb94de2fbb49c33c8a1e6e')

build() {
    cd "${_pkgname}-${pkgver}"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_OPENMP=ON \
        -DUSE_GPU=ON \

    cmake --build build
}

package() {
    cd "${_pkgname}-${pkgver}"
    cmake --build build -- DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Python
    cd python-package
    python setup.py install --root="$pkgdir/" --optimize=1 --gpu --precompile
    rm "$pkgdir/usr/lib/python3.6/site-packages/lightgbm/lib_lightgbm.so"
    # they should check the env first and not hardlink
    ln -s "$pkgdir/usr/lib/lib_lightgbm.so" "$pkgdir/usr/lib/python3.6/site-packages/lightgbm/lib_lightgbm.so"
}
