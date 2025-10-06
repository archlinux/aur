# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>
pkgname=python-dessert
_name=${pkgname#python-}
pkgver=1.6.1
pkgrel=1
pkgdesc="Assertion introspection via AST rewriting"
arch=('any')
url="https://github.com/getslash/dessert"
license=('MIT')
depends=(
    'python'
    'python-munch'
    'python-atomicwrites'
    'python-attrs'
    'python-setuptools'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
    'python-hatch-vcs'
)
checkdepends=(
    'python-pytest'
    'python-emport'
    'python-pylint'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('53e5a06afa394c8c6a4556c08054f1fd28986bd7bcd1d69f92722af5e97627c1')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    # Install the package in a temporary location for testing
    python -m installer --destdir="$PWD/tmp_install" dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    export PYTHONPATH="$PWD/tmp_install$site_packages:$PYTHONPATH"
    python -m pytest
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
