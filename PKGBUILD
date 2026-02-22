# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
pkgname=python-spiceypy
pkgver=8.0.2
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N67) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy/"
license=('MIT')
makedepends=('cython' 'python-numpy' 'python-scikit-build-core' 'python-build' 'python-wheel' 'python-installer')
depends=('python-numpy')
checkdepends=('python-pytest' 'python-pytest-benchmark' 'python-pandas')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andrewannex/spiceypy/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('275e8fa541a5722ae1b6d21c5f1fdf400c2f90ada6de94c6105f07baa47bd1f803fff9af8c8f7cec4f65fb6e1ce863ecfc9f2569aeb51e449b42c3bbe3697656')

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
