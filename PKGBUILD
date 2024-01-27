# Contributor: Constantine Evans <const@costi.eu>

pkgname=oxdna-cuda

pkgdesc="DNA/RNA/etc simulator, with CUDA support and analysis tools."

url="https://github.com/lorenzo-rovigatti/oxDNA"

pkgver=3.6.0
arch=('x86_64')
license=('GPL3')
provides=('oxdna')
conflicts=('oxdna')
pkgrel=1

depends=('python3' 'python-matplotlib' 'python-scikit-learn' 'python-setuptools' 'python-biopython' 'ipython')

makedepends=('git' 'cmake' 'gsl' 'cuda' 'gcc12' 'python-build' 'python-wheel' 'python-installer' 'cython' 'python-setuptools-scm')
optdepends=('python-matplotlib: for plotting')

source=("https://github.com/lorenzo-rovigatti/oxDNA/archive/refs/tags/v3.6.0.tar.gz")

sha256sums=('61426ee9444cf6bb53078efe773f54f8fde0c7071c147655aa2136b4212c9fec')

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
