# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>

_name=dspy
pkgname=python-$_name
pkgver=3.2.1
pkgrel=1
pkgdesc="The framework for programming (not prompting) language models"
arch=('any')
url="https://github.com/stanfordnlp/dspy"
license=('MIT')
depends=(
    'litellm'
    'python'
    'python-anyio'
    'python-asyncer'
    'python-cachetools'
    'python-cloudpickle'
    'python-diskcache'
    'python-gepa'
    'python-json_repair'
    'python-numpy'
    'python-openai'
    'python-orjson'
    'python-pydantic'
    'python-regex'
    'python-requests'
    'python-tenacity'
    'python-tqdm'
    'python-typeguard'
    'python-xxhash'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'python-anthropic: anthropic extra (Anthropic LM provider)'
    'python-weaviate-client: weaviate extra (Weaviate retriever)'
    'python-mcp: mcp extra (Model Context Protocol tools)'
    'python-langchain-core: langchain extra (LangChain integration)'
    'python-optuna: optuna extra (Optuna-based optimizers)'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('245d6531753cd3e844e7cc47835cfb283c8f57a36a977beabe5034457d9c7241')

prepare() {
    cd "$srcdir/$_name-$pkgver"
    # Relax exact (==) version pins that Arch's newer deps violate.
    sed -i -E 's/"asyncer==0\.0\.8"/"asyncer>=0.0.8"/' pyproject.toml
    sed -i -E 's/"typeguard==4\.4\.3"/"typeguard>=4.4.3"/' pyproject.toml
    sed -i -E 's/"gepa\[dspy\]==0\.0\.27"/"gepa>=0.0.27"/' pyproject.toml
}

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_name-$pkgver"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import dspy; print(getattr(dspy, '__version__', 'ok'))"
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
