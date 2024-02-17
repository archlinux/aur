# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-pyfai
pkgver=2024.02
pkgrel=1
pkgdesc="Fast Azimuthal Integration in Python."
arch=('any')
url="http://www.silx.org"
license=('GPLv3' 'BSD' 'MIT')
depends=('python-numpy' 'python-scipy' 'python-matplotlib' 'python-fabio'
         'python-h5py' 'python-pyopencl' 'python-pyqt5' 'fftw'
         'opencl-driver')
optdepends=('python-silx: for additional functionality, like pyFAI-calib2')
makedepends=('cython' 'meson-python' 'python-build' 'python-installer'
             'python-wheel')
source=("https://github.com/silx-kit/pyFAI/archive/v${pkgver}.tar.gz")
sha256sums=('249b23007f28d0d93514b706f11c9721884375621749a037b158ca8ea40acb02')

build() {
    cd "pyFAI-${pkgver}"

    # Remove ninja dependency, as it is brought with meson, and python-ninja
    # is not in the official repos
    sed -i "/^requires =/,/^\]/{/^[[:space:]]*'ninja',[[:space:]]*$/d}" pyproject.toml
    # Remove non-existing package name from requirements
    sed -i "/^requires =/,/^\]/{/^[[:space:]]*'oldest-supported-numpy',[[:space:]]*$/d}" pyproject.toml

    python -m build --wheel --no-isolation
}

package() {
    cd "pyFAI-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D LICENSES.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D copyright "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
