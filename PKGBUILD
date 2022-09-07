# Maintainer: Constantine Evans <const@costi.eu>

pkgname=oxdna-cuda

pkgdesc="DNA/RNA/etc simulator, with CUDA support and analysis tools."

url="https://github.com/lorenzo-rovigatti/oxDNA"

pkgver=3.4.2
arch=('x86_64')
license=('GPL3')
provides=('oxdna')
conflicts=('oxdna')
pkgrel=2

depends=('python3' 'python-matplotlib' 'python-scikit-learn' 'python-setuptools' 'python-biopython' 'ipython')

makedepends=('git' 'cmake' 'gsl' 'cuda' 'gcc11' 'python-build' 'python-wheel' 'python-installer')
optdepends=('python-matplotlib: for plotting')

source=("https://github.com/lorenzo-rovigatti/oxDNA/archive/refs/tags/v3.4.2.tar.gz")

sha256sums=('dc5ada4a1e2239e519bba0b578e530a049579d5984fbf945763d68b010929957')

build() {
    cmake -B build -S "oxDNA-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_C_COMPILER='gcc-11' \
        -DCMAKE_CXX_COMPILER='g++-11' \
        -Wno-dev \
        -DCUDA=ON \
        -DPython=ON \
        -DCMAKE_SKIP_RPATH=YES \
        -DCMAKE_INSTALL_LIBDIR='lib/oxdna' \
        -DOxpySystemInstall=ON

    cmake --build build

    cd "oxDNA-${pkgver}/analysis"
    python -m build --no-isolation --wheel
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm755 "${srcdir}/build/bin/oxDNA" "${pkgdir}/usr/bin/oxDNA"
    install -Dm755 "${srcdir}/build/bin/DNAnalysis" "${pkgdir}/usr/bin/DNAnalysis"
    install -Dm755 "${srcdir}/build/bin/confGenerator" "${pkgdir}/usr/bin/confGenerator"

    cd "oxDNA-${pkgver}/analysis"
    python -m installer --destdir="$pkgdir" dist/*.whl

    cd "${srcdir}/build/oxpy/python/oxpy"
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 "${srcdir}/build/src/liboxdna_common.so" "${pkgdir}/usr/lib/liboxdna_common.so"
}
