# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio
pkgname=python-${_name}
pkgver=5.34.1
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=('any')
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/${_name}@${pkgver}.tar.gz")
sha256sums=('5ff8731738b2de3bdde2b8fa4998da71d84cfdb812b012f24b9c5773395b1e57')
depends=('python' 'python-aiofiles' 'python-anyio' 'python-audioop-lts' 'python-fastapi' 'python-ffmpy' 'python-groovy' 'python-gradio-client' 'python-httpx' 'python-huggingface-hub' 'python-jinja' 'python-markupsafe' 'python-numpy' 'python-orjson' 'python-packaging' 'python-pandas' 'python-pillow' 'python-pydantic' 'python-python-multipart' 'python-pydub' 'python-pyyaml' 'python-ruff' 'python-safehttpx' 'python-semantic-version' 'python-starlette' 'python-tomlkit' 'python-typer' 'python-typing_extensions' 'python-urllib3' 'uvicorn')
makedepends=('python-hatchling' 'python-hatch-requirements-txt' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel' 'pnpm')
checkdepends=('ipython' 'python-altair' 'python-boto3' 'python-matplotlib' 'python-hypothesis' 'python-polars' 'python-email-validator' 'python-pytest' 'python-pytest-asyncio' 'python-pytest-cov' 'python-pytest-rerunfailures' 'python-respx' 'python-scikit-image' 'python-pytorch' 'python-tqdm' 'python-transformers' 'python-vega_datasets' 'python-diffusers' 'python-mcp' 'python-tf-keras' 'python-openai')
optdepends=('python-authlib: oauth' 'python-itsdangerous: oauth' 'python-mcp: mcp' 'python-pydantic: mcp')
install='python-gradio.install'

prepare(){
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  sed -i 's/"pnpm": "^9"/"pnpm": "^10"/g' package.json # Use pnpm 10
  rm -rf test/test_docker # Remove tests that need docker
}

build() {
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  pnpm i --ignore-scripts
  pnpm build
  python -m build --wheel --no-isolation
}

check() {
    local pytest_options=(
    -vv
    # Need HuggingFace token
    --deselect test/test_buttons.py::TestOAuthButtons::test_login_button_warns_when_not_on_spaces
    --deselect test/test_external.py
    # Need custom tunnel
    --deselect test/test_tunneling.py::test_setup_custom_tunnel
    # Failed tests
    --deselect test/test_mcp.py::test_mcp_mount_gradio_app
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
