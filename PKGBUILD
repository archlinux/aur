# Maintainer: enihcam <enihcam@archlinux.us>
# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-litellm
pkgver=1.92.0
pkgrel=1
pkgdesc="Call all LLM APIs using the OpenAI format"
arch=('any')
url="https://github.com/BerriAI/litellm"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-maturin')
depends=('python-aiohttp' 'python-click' 'python-fastuuid' 'python-httpx' 'python-jinja' 'python-jsonschema' 'python-openai' 'python-pydantic' 'python-dotenv' 'python-tiktoken' 'python-tokenizers' 'python-importlib-metadata')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/litellm/litellm-1.92.0.tar.gz")
sha256sums=('773adf5503ee1793289689c899394a83df8122993760d9acd782e32aa798db9d')

prepare() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    # Upstream pins maturin==1.9.4 in [build-system].requires; relax to any version
    # so python-maturin from [extra] can satisfy it.
    sed -i 's/maturin==[0-9.]*/maturin/g' pyproject.toml
}

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    export PYO3_PYTHON=/usr/bin/python
    export PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}