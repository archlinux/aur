# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-fabio
pkgver=2023.10
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
sha256sums=('8508b8d6433ed399cb8abf4b3b079396a7033c1192605c4ec5f9dd143448128c')

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
