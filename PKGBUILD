# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-stanio-git
_name=stanio
pkgver=r39.13e0f1b
pkgrel=2
pkgdesc="A package to prepare inputs to Stan and reading its outputs"
arch=(any)
url=https://github.com/stan-dev/stanio
license=(BSD-3-Clause)
provides=(python-stanio)
conflicts=(python-stanio)
depends=(python-numpy)
makedepends=(
    git
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
source=($_name::git+https://github.com/stan-dev/$_name.git)
b2sums=(SKIP)

pkgver() {
    cd $_name
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd $_name
    python -m installer --destdir=test_dir dist/*.whl
    PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest -v test
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
