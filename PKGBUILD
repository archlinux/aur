# Maintainer: MoetaYuko <loli at yuko dot moe>

pkgname=python-jupytext
pkgver=1.15.2
pkgrel=1
pkgdesc="Jupyter notebooks as Markdown documents, Julia, Python or R scripts"
url="https://github.com/mwouts/jupytext"
depends=(
    jupyter-nbformat
    python-pyaml
    python-toml
    python-markdown-it-py
    python-mdit_py_plugins
)
makedepends=(
    # jupyterlab
    npm
    # python-jupyter-packaging
    # python-build
    python-installer
    # python-setuptools
    # python-wheel
)
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fd59e1656b9e2345eae7dc8ed137c7f4f06c12daf75465ec17ff88721df82c55')

prepare() {
    # The jlab extension has to be built with jlab3
    # See: https://github.com/mwouts/jupytext/issues/1116
    cd $srcdir
    python -m venv venv
    source venv/bin/activate
    python -m pip install build wheel jupyter-packaging~=0.7.9 'jupyterlab>=3,<4'
    deactivate
}

build() {
    cd $srcdir/jupytext-$pkgver
    source ../venv/bin/activate
    BUILD_JUPYTERLAB_EXTENSION=1 python -m build --wheel --no-isolation
    deactivate
}

package() {
    cd $srcdir/jupytext-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:et:ts=4:sw=4
