# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio
pkgname=python-${_name}
pkgver=5.34.0
pkgrel=2
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=('x86_64' 'aarch64')
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/${_name}@${pkgver}.tar.gz")
source_x86_64=("pnpm::https://github.com/pnpm/pnpm/releases/download/v9.15.9/pnpm-linuxstatic-x64")
source_aarch64=("pnpm::https://github.com/pnpm/pnpm/releases/download/v9.15.9/pnpm-linuxstatic-arm64")
sha256sums=('f0783fee7863c5c2291bac6de91bd92efa81304654c2677f97a79804e660b590')
sha256sums_x86_64=('038f2a41ccdabc823d09e5697fff85f2e74d5c37591f6d58dfd33a59ffa17fc0')
sha256sums_aarch64=('2f8069dbb472b93a54d4c016b2e36968586c87f62e659dd966472a78cada5d99')
depends=('python' 'python-aiofiles' 'python-anyio' 'python-audioop-lts' 'python-fastapi' 'python-ffmpy' 'python-groovy' 'python-gradio-client' 'python-httpx' 'python-huggingface-hub' 'python-jinja' 'python-markupsafe' 'python-numpy' 'python-orjson' 'python-packaging' 'python-pandas' 'python-pillow' 'python-pydantic' 'python-python-multipart' 'python-pydub' 'python-pyyaml' 'python-ruff' 'python-safehttpx' 'python-semantic-version' 'python-starlette' 'python-tomlkit' 'python-typer' 'python-typing_extensions' 'python-urllib3' 'uvicorn')
makedepends=('python-hatchling' 'python-hatch-requirements-txt' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('ipython' 'python-altair' 'python-boto3' 'python-matplotlib' 'python-hypothesis' 'python-polars' 'python-email-validator' 'python-pytest' 'python-pytest-asyncio' 'python-pytest-cov' 'python-pytest-rerunfailures' 'python-respx' 'python-scikit-image' 'python-pytorch' 'python-tqdm' 'python-transformers' 'python-vega_datasets' 'python-diffusers' 'python-mcp' 'python-tf-keras' 'python-openai')
optdepends=('python-authlib: oauth' 'python-itsdangerous: oauth' 'python-mcp: mcp' 'python-pydantic: mcp')
install='python-gradio.install'

prepare(){
  chmod +x pnpm
  ln -sf "${srcdir}"/pnpm "${srcdir}"/${_name}-${_name}-${pkgver}/pnpm
}

build() {
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  python scripts/generate_theme.py | true
  env PATH="${srcdir}"/${_name}-${_name}-${pkgver}:$PATH ./pnpm i --frozen-lockfile --ignore-scripts
  env PATH="${srcdir}"/${_name}-${_name}-${pkgver}:$PATH ./pnpm build
  python -m build --wheel --no-isolation
}

check() {
    local pytest_options=(
    -vv
    # Test Gradio inside Docker
    --ignore test/test_docker
    # Need HuggingFace token
    --deselect test/test_buttons.py::TestOAuthButtons::test_login_button_warns_when_not_on_spaces
    --deselect test/test_external.py
    # Need custom tunnel
    --deselect test/test_tunneling.py::test_setup_custom_tunnel
    # Failed tests
    --deselect test/test_mcp.py::test_mcp_sse_transport
    --deselect test/test_components.py::test_component_example_values
    --deselect test/test_components.py::test_component_example_payloads
  )
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  ulimit -n 8192
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/pip install -U gradio-pdf # Prevent cercular dependencies
  PATH="${srcdir}/${_name}-${_name}-${pkgver}/test-env/bin:$PATH" test-env/bin/python -m pytest "${pytest_options[@]}" test
}

package() {
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
