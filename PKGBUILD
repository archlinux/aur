# Maintainer: Smoolak <smoolak@gmail.com>

_pkgname=optimum_quanto
pkgname=python-optimum-quanto
pkgver=0.2.7
pkgrel=1
pkgdesc='A pytorch quantization backend for optimum'
arch=('any')
url='https://github.com/huggingface/optimum-quanto'
license=('Apache-2.0')
depends=(
    'python'
    'python-pytorch'
    'python-ninja'
    'python-numpy'
    'python-safetensors'
    'python-huggingface-hub'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'python-setuptools-scm'
)
optdepends=(
    'python-pytest: for the dev extra (running tests)'
    'python-ruff: for the dev extra (linting)'
    'python-torchvision: for the examples extra'
    'python-transformers: for the examples extra'
    'python-diffusers: for the examples extra'
    'python-datasets: for the examples extra'
    'python-accelerate: for the examples extra'
    'python-sentencepiece: for the examples extra'
    'python-scipy: for the examples extra'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('91b5c2dc8a9100297dc7924a93747fb77ab010784b5e1f6d0208976ba054dade')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    # sdist ships no SCM metadata; setuptools_scm needs an explicit version
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import optimum.quanto; print(getattr(optimum.quanto, '__version__', 'ok'))"
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
