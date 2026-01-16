# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-fabio
pkgver=2025.10.0
pkgrel=1
pkgdesc="I/O library for images produced by 2D X-ray detectors."
arch=('any')
url="http://www.silx.org"
license=('MIT' 'LGPL' 'Apache')
depends=('python-numpy' 'python-pillow' 'python-lxml' 'python-h5py')
optdepends=('python-pyqt5: for the fabio_viewer program')
makedepends=('cython' 'python-tomli' 'meson-python' 'python-build'
             'python-installer' 'python-wheel')
source=("https://github.com/silx-kit/${pkgname#*-}/archive/v${pkgver}.tar.gz")
sha256sums=('f82b0ed5cc3db58ef25c72f262e6747851091a0e61cfc495000692f130dbdcaa')

build() {
    cd "${pkgname#*-}-${pkgver}"

    # Remove ninja dependency, as it is brought with meson, and python-ninja
    # is not in the official repos
    sed -i "/^requires =/,/^\]/{/^[[:space:]]*'ninja',[[:space:]]*$/d}" pyproject.toml

    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname#*-}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
