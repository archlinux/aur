# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>
pkgname=python-dessert
_name=${pkgname#python-}
pkgver=1.5.0
pkgrel=1
pkgdesc="Assertion introspection via AST rewriting"
arch=('any')
url="https://github.com/getslash/dessert"
license=('MIT')
depends=(
    'python'
    'python-munch'
    'python-py'
    'python-atomicwrites'
    'python-attrs'
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
sha256sums=('27916b1ffc932ae139385ada34ca4d2f851c66f48a2aa44295a438480fa59831')

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
