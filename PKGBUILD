# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC2034,SC2154,SC2164

_name=backports.shutil_get_terminal_size

pkgname=python-backports.shutil_get_terminal_size
pkgver=1.0.0
pkgrel=1
pkgdesc="A backport of the get_terminal_size function from Python 3.3's shutil."

arch=("any")
license=("MIT")
url="https://github.com/chrippa/backports.shutil_get_terminal_size"

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('c076f20ed474aecc36f386c69152c778f1522c54b7e1746211ff67f57a634802bb9c904bce56a62b3af968327d4a932da7cafc8a8058128de14f8ad6da92c181')

depends=(
    "python"
    "python-backports"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-setuptools-scm"
    "python-wheel"
)
checkdepends=(
    "python-pytest"
    "python-pytest-mock"
    "python-virtualenv"
)

prepare() {
    cd "$srcdir/$_name-$pkgver"
    rm backports/__init__.py # Provided by python-backports
}

build() {
    cd "$srcdir/$_name-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
        python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_name-$pkgver"

    python -m venv --system-site-packages venv
    source venv/bin/activate
    pip install ./dist/*.whl
    PYTHONPATH="$PYTHONPATH:." pytest
    rm -rf venv
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
