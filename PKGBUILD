# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-stanio
_name=stanio
pkgver=0.5.1
pkgrel=3
pkgdesc="A package to prepare inputs to Stan and reading its outputs"
arch=(any)
url=https://github.com/stan-dev/stanio
license=(BSD-3-Clause)
depends=(python-numpy)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
checkdepends=(
    python-pandas
    python-pytest
    python-pytest-cov
)
source=($_name-$pkgver.tar.gz::https://github.com/stan-dev/$_name/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('387e5a185243afb0bb5cf7ed6af00f3a1f1122be53159a85470ef88cbf45976c6008ae40e8e2f78739411ebab5ddc35ed40ac78fe2d73c78a9502d75df939867')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd $_name-$pkgver
    python -m installer --destdir=test_dir dist/*.whl
    PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest -v test
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
