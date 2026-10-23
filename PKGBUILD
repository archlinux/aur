# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-fabio
pkgver=2026.06
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
sha256sums=('884d599f2e5cb830e75b69bb17068dc246044485cff3ac62afdcd3089bed1695')

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
