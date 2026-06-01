# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-crewai
_pkgname=crewai
pkgver=1.14.6
pkgrel=1
pkgdesc="Framework for orchestrating role-playing, autonomous AI agents"
arch=('any')
url="https://github.com/crewAIInc/crewAI"
license=('MIT')
depends=(
    'python'
    # As of 1.14.6 crewai is split: the importable crewai module hard-imports
    # crewai_core.* and crewai_cli, so these two sibling packages are required.
    'python-crewai-core'
    'python-crewai-cli'
    'python-pydantic'
    'python-pydantic-settings'
    'python-openai'
    'python-instructor'
    'python-pdfplumber'
    'python-regex'
    'python-opentelemetry-api'
    'python-opentelemetry-sdk'
    'python-opentelemetry-exporter-otlp-proto-http'
    'python-chromadb'
    'python-tokenizers'
    'python-openpyxl'
    'python-dotenv'
    'python-pyjwt'
    'python-click'
    'python-appdirs'
    'python-jsonref'
    'python-json_repair'
    'python-tomli-w'
    'python-tomli'
    'python-json5'
    'python-portalocker'
    'python-httpx'
    'python-mcp'
    'python-aiosqlite'
    'python-yaml'
    'python-aiofiles'
    'python-lancedb'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)
optdepends=(
    'litellm: for LiteLLM provider support'
    'python-anthropic: for Anthropic provider support'
    'python-tiktoken: for token counting with embeddings'
    'python-pandas: for data analysis features'
    'python-docling: for document parsing support'
)
source=("$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/c/crewai/${_pkgname}-${pkgver}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/crewAIInc/crewAI/main/LICENSE")
sha256sums=('e8f0cfbee70ded59ede89fce42741cb2608800132bdf9c6d8e753c90b93e246f'
            'febc00dc5a0557ca8afbcdc6d3896731dc42f4cecabd87e6c98326212f8dbf36')

prepare() {
    cd "$_pkgname-$pkgver"
    # Allow Python 3.14
    sed -i 's/requires-python = ">=3.10, <3.14"/requires-python = ">=3.10"/' pyproject.toml
    # Relax overly strict version pins for Arch's rolling-release versions.
    # All of these are minor/compatible bumps; crewai HEAD/upstream track them too.
    # openai: Arch is one minor behind the >=2.30.0 floor; 2.29->2.30 is non-breaking
    sed -i 's/openai>=2.30.0,<3/openai>=2.29.0,<3/' pyproject.toml
    # pydantic: Arch ships 2.13.x which violates the upstream <2.13 cap
    sed -i 's/pydantic>=2.11.9,<2.13/pydantic>=2.11.9,<3/' pyproject.toml
    # chromadb: v1.x is backward compatible
    sed -i 's/chromadb~=1.1.0/chromadb>=1.1.0,<2/' pyproject.toml
    # portalocker: v3 has no API breaks
    sed -i 's/portalocker~=2.7.0/portalocker>=2.7.0/' pyproject.toml
    # Relax other minor "~=" pins where Arch is newer than the implied upper bound
    sed -i 's/click~=8.1.7/click>=8.1.7,<9/' pyproject.toml
    sed -i 's/mcp~=1.26.0/mcp>=1.26.0/' pyproject.toml
    sed -i 's/json5~=0.10.0/json5>=0.10.0/' pyproject.toml
    sed -i 's/tomli-w~=1.1.0/tomli-w>=1.1.0/' pyproject.toml
    sed -i 's/tomli~=2.0.2/tomli>=2.0.2/' pyproject.toml
    sed -i 's/aiosqlite~=0.21.0/aiosqlite>=0.21.0/' pyproject.toml
    sed -i 's/aiofiles~=24.1.0/aiofiles>=24.1.0/' pyproject.toml
    sed -i 's/pydantic-settings~=2.10.1/pydantic-settings>=2.10.1,<3/' pyproject.toml
    sed -i 's/json-repair~=0.25.2/json-repair>=0.25.2/' pyproject.toml
    # opentelemetry: compatible within 1.x
    sed -i 's/opentelemetry-api~=1.34.0/opentelemetry-api>=1.34.0/' pyproject.toml
    sed -i 's/opentelemetry-sdk~=1.34.0/opentelemetry-sdk>=1.34.0/' pyproject.toml
    sed -i 's/opentelemetry-exporter-otlp-proto-http~=1.34.0/opentelemetry-exporter-otlp-proto-http>=1.34.0/' pyproject.toml
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    rm -rf "$srcdir/test-install"
    python -m installer --destdir="$srcdir/test-install" dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    PYTHONPATH="$srcdir/test-install$site_packages:$PYTHONPATH" python -c "
import crewai
print(f'crewai {crewai.__version__} imported successfully')
"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
