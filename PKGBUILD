# Contributor: Constantine Evans <const@costi.eu>

pkgname=oxdna-cuda

pkgdesc="DNA/RNA/etc simulator, with CUDA support and analysis tools."

url="https://github.com/lorenzo-rovigatti/oxDNA"

pkgver=3.7.0
arch=('x86_64')
license=('GPL3')
provides=('oxdna')
conflicts=('oxdna')
pkgrel=1

depends=('python3' 'python-matplotlib' 'python-scikit-learn' 'python-setuptools' 'ipython')

makedepends=('git' 'cmake' 'gsl' 'cuda>=12.6.1' 'gcc12' 'python-build' 'python-wheel' 'python-installer' 'cython' 'python-setuptools-scm')
optdepends=('python-matplotlib: for plotting')

source=("https://github.com/lorenzo-rovigatti/oxDNA/archive/refs/tags/v3.7.0.tar.gz")

sha256sums=('74d6675a544e9c7a52ff692e698744f190a508c65d62dd08c065ff887414a787')

build() {
    cmake -B build -S "oxDNA-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_C_COMPILER='gcc-12' \
        -DCMAKE_CXX_COMPILER='g++-12' \
        -Wno-dev \
        -DCUDA=ON \
        -DPython=ON \
        -DCMAKE_SKIP_RPATH=YES \
        -DCMAKE_INSTALL_LIBDIR='lib/oxdna' \
        -DOxpySystemInstall=ON \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF \

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

    install -Dm644 "${srcdir}/build/src/liboxdna_common.so" "${pkgdir}/usr/lib/"
}
