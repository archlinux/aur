# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-flake8-pyproject
_name=Flake8-pyproject
pkgver=1.2.3
pkgrel=3
pkgdesc="Flake8 plug-in loading the configuration from pyproject.toml"
arch=(any)
url="https://github.com/john-hen/${_name}"
license=('MIT')
groups=()
depends=(flake8 python-tomli python-wheel)
checkdepends=(python-pytest python-pytest-cov)
makedepends=(python-build python-installer python-flit-core)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(8f065721c53c1fe22d423d82db99eef6559b463a8701aa03b03668d43abfc851)

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
    python -m installer --destdir=tmp_test_install dist/*.whl
}

check() {
    cd "$srcdir/$_src_folder"

    local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    export PYTHONPATH="$PWD/tmp_test_install/${site_packages}:$PYTHONPATH"
    export PATH="$PWD/tmp_test_install/usr/bin/:$PATH"

    python -m pytest
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

