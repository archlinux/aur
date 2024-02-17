# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-stanio
_name=stanio
pkgver=0.5.0
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
b2sums=('f5edc41c4b80bb6b7a5a9c7bd71e4d901ba4a893a56b7b281e0923250698238c5a96dd87e90044d3d420e341443683656b08759c4df8191ee9c809d0046cd967')

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
