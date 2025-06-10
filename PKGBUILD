# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=quartodoc
pkgver=0.11.1
pkgrel=1
pkgdesc="Generate Python package API reference documentation using Markdown and Quarto"
arch=('any')
url='https://machow.github.io/quartodoc'
license=('MIT')
depends=(
    'python-black'
    'python-click'
    'python-griffe>=0.33'
    'python-importlib-metadata>=5.1.0'
    'python-importlib_resources>=5.10.2'
    'python-plum-dispatch>2.0.0'
    'python-pydantic'
    'python-pyyaml'
    'python-requests'
    'python-sphobjinv>=2.3.1'
    'python-tabulate>=0.9.0'
    'python-typing_extensions>=4.4.0'
    'python-watchdog>=3.0.0'
    'python>=3.10'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools-scm'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
    'python-pytest-cov'
    'python-syrupy'
)
source=("${pkgname}-${pkgver}::git+https://github.com/machow/quartodoc.git#tag=v${pkgver}")
b2sums=('be1ef2414171e5762072efe3beb5faad6c45f498e7a91e79be18597b5ee7140cd6d42451b7e14c6e5506a16085097430698fb73ea55a96f36d5716d7cde295a6')

check() {
    cd $pkgname-$pkgver
    PYTHONPATH=. pytest
}

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    rm -rf "$pkgdir/$site_packages/$pkgname/tests"
}
