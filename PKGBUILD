# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
pkgname=python-spiceypy
pkgver=8.1.0
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N67) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy/"
license=('MIT')
makedepends=('cython' 'python-numpy' 'python-scikit-build-core' 'python-build' 'python-wheel' 'python-installer')
depends=('python-numpy')
checkdepends=('python-pytest' 'python-pytest-benchmark' 'python-pandas')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andrewannex/spiceypy/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('6e8c6ef6617bffd1dafedf0eb1a3064940a2b7742e0a676ffbec61a5c23689a8512cf485b4fffbbaac1ea5012a0fc5e2fb2ae19579a69a38f6ee8709ff64a467')

build() {

    cd "${srcdir}/SpiceyPy-${pkgver}"

    python -m build --wheel --no-isolation

}

check() {

    cd "${srcdir}/SpiceyPy-${pkgver}"

    python -m installer --destdir="${PWD}/testroot" dist/*.whl

    local site_packages
    site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

    PYTHONPATH="${PWD}/testroot/${site_packages}" \
        python -m pytest -q --pyargs spiceypy --benchmark-disable \
            -k 'not download and not internet and not network'

}

package() {

    cd "${srcdir}/SpiceyPy-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
