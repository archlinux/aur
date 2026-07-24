# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-multimark
_pkgname=multimark
pkgver=0.2.0
pkgrel=1
pkgdesc="Python bindings to cmark: CommonMark parsing and rendering (HTML, LaTeX, man, XML)"
arch=('x86_64')
url="https://github.com/posit-dev/multimark"
license=('MIT' 'BSD-2-Clause')
depends=(
    'python'
    'python-cffi'
    'python-click'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools-scm'
    'python-wheel'
)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('15a53111c52e0a65c200b57a5068a618734af52fc5d6512e8b9884fadbb2b8b8')

build() {
    cd "$_pkgname-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir=tmp_install dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
