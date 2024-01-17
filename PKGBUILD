# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-stanio
_name=stanio
pkgver=0.4.0
pkgrel=1
pkgdesc="A package to prepare inputs to Stan and reading its outputs"
arch=('any')
url="https://github.com/WardBrian/stanio"
license=('BSD-3-Clause')
depends=('python-numpy')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
checkdepends=(
    'python-pandas'
    'python-pytest'
    'python-pytest-cov'
)
source=("${_name}-${pkgver}.tar.gz::https://github.com/WardBrian/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('6d3b596fa4c2006b171482959b328ddcb49f74536958c48044b139b413a9a5748985528b4d6814cd7484df363c80d1cbbe24ff16e2e05f9eb181ff3e55b65270')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd "${_name}-${pkgver}"
    python -m installer --destdir=test_dir dist/*.whl
    PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest -v test
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
