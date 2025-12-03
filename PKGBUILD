# Maintainer: Constantine Evans <const@costi.eu>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=oxdna-cuda-git
pkgdesc="DNA/RNA/etc simulator, from lorenzo-rovigatti/oxDNA, with CUDA support and analysis tools."
url="https://github.com/lorenzo-rovigatti/oxDNA"
pkgver=3.7.0.r73.ga9ff2844
arch=('x86_64')
license=('GPL-3.0-only')
provides=('oxdna')
conflicts=('oxdna')
pkgrel=1
depends=('python3' 'python-matplotlib' 'python-scikit-learn' 'python-setuptools' 'ipython')
makedepends=('git' 'cmake' 'gsl' 'cuda' 'gcc14' 'python-build' 'python-wheel' 'python-installer' 'cython' 'python-setuptools-scm')
options=(!lto)
source=("git+https://github.com/lorenzo-rovigatti/oxDNA.git#branch=CUDA13")
sha256sums=('SKIP')

pkgver() {
  cd "oxDNA"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cmake -B build -S "oxDNA" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_C_COMPILER='gcc-14' \
        -DCMAKE_CXX_COMPILER='g++-14' \
        -Wno-dev \
        -DCUDA=ON \
        -DPython=ON \
        -DCMAKE_SKIP_RPATH=YES \
        -DCMAKE_INSTALL_LIBDIR='lib/oxdna' \
        -DOxpySystemInstall=ON

    cmake --build build

    cd "oxDNA/analysis"
    python -m build --no-isolation --wheel
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm755 "${srcdir}/build/bin/oxDNA" "${pkgdir}/usr/bin/oxDNA"
    install -Dm755 "${srcdir}/build/bin/DNAnalysis" "${pkgdir}/usr/bin/DNAnalysis"
    install -Dm755 "${srcdir}/build/bin/confGenerator" "${pkgdir}/usr/bin/confGenerator"

    cd "oxDNA/analysis"
    python -m installer --destdir="$pkgdir" dist/*.whl

    cd "${srcdir}/build/python"
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 "${srcdir}/build/src/liboxdna_common.so" "${pkgdir}/usr/lib/liboxdna_common.so"
}
