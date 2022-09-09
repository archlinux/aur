# Maintainer: Constantine Evans <const@costi.eu>

pkgname=oxdna-cuda-git

pkgdesc="DNA/RNA/etc simulator, from lorenzo-rovigatti/oxDNA, with CUDA support and analysis tools."

url="https://github.com/lorenzo-rovigatti/oxDNA"

pkgver=v3.2.1.r257.g6794178f
arch=('x86_64')
license=('GPL3')
provides=('oxdna')
conflicts=('oxdna')
pkgrel=1

depends=('python3' 'python-matplotlib' 'python-scikit-learn' 'python-setuptools' 'python-biopython' 'ipython')

makedepends=('git' 'cmake' 'gsl' 'cuda' 'gcc11' 'python-build' 'python-wheel' 'python-installer')
optdepends=('python-matplotlib: for plotting')

source=("git+https://github.com/lorenzo-rovigatti/oxDNA.git")
sha256sums=('SKIP')

pkgver() {
  cd "oxDNA"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cmake -B build -S "oxDNA" \
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

    cd "${srcdir}/build/oxpy/python/oxpy"
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 "${srcdir}/build/src/liboxdna_common.so" "${pkgdir}/usr/lib/liboxdna_common.so"
}
