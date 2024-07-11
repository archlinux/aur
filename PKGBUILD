_base=pyFFTW
pkgname=python-${_base,,}
pkgver=0.14.0
pkgrel=1
pkgdesc="A pythonic wrapper around FFTW"
arch=(x86_64 aarch64)
url="https://github.com/${_base}/${_base}"
license=(BSD-3-Clause)
depends=(fftw python-numpy openmp)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
checkdepends=(python-pytest python-scipy python-dask)
optdepends=('python-scipy: scipy.fftpack support'
    'python-dask: dask.fft support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('337e7cba161a78f0cdfc7903cb483d7ddc519e648c1b2e27ff9737f1e7d35854')

build() {
    cd ${_base}-${pkgver}
    CFLAGS="$CFLAGS -Wno-incompatible-pointer-types"
    # don't overwrite other entries in $CFLAGS
    python setup.py \
        build_ext \
        --include-dirs=/usr/include \
        --library-dirs=/usr/lib \
        --inplace
    python -m build --wheel --skip-dependency-check --no-isolation
}

# disable check function to speed up build process if necessary
check() {
    cd ${_base}-${pkgver}
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -m pytest
}

package() {
    cd ${_base}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
