# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio
pkgname=python-${_name}
pkgver=5.41.0
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=('any')
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/${_name}@${pkgver}.tar.gz"
        "https://files.pythonhosted.org/packages/py3/g/gradio-pdf/gradio_pdf-0.0.22-py3-none-any.whl") # Prevent cercular dependencies
noextract=('gradio_pdf-0.0.22-py3-none-any.whl')
sha256sums=('8bb1f133e693f25499ff62532ce20ef8e394d0c5dbada84e6ef9e3e91afeea91'
            '6f710eca3464d2d37aee742eb2f10dbe76772ebe5dfcfb993da40c710c9ad1b5')
depends=('python' 'python-aiofiles' 'python-anyio' 'python-audioop-lts' 'python-brotli' 'python-fastapi' 'python-ffmpy' 'python-groovy' 'python-gradio-client' 'python-httpx' 'python-huggingface-hub' 'python-jinja' 'python-markupsafe' 'python-numpy' 'python-orjson' 'python-packaging' 'python-pandas' 'python-pillow' 'python-pydantic' 'python-python-multipart' 'python-pydub' 'python-pyyaml' 'python-ruff' 'python-safehttpx' 'python-semantic-version' 'python-starlette' 'python-tomlkit' 'python-typer' 'python-typing_extensions' 'python-urllib3' 'uvicorn')
makedepends=('python-hatchling' 'python-hatch-requirements-txt' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel' 'pnpm')
checkdepends=('ipython' 'python-altair' 'python-boto3' 'python-matplotlib' 'python-hypothesis' 'python-openai' 'python-polars' 'python-email-validator' 'python-pytest' 'python-pytest-asyncio' 'python-pytest-rerunfailures' 'python-respx' 'python-scikit-image' 'python-pytorch' 'python-tqdm' 'python-transformers' 'python-vega_datasets' 'python-diffusers' 'python-mcp' 'python-tf-keras')
optdepends=('python-authlib: oauth' 'python-itsdangerous: oauth' 'python-mcp: mcp' 'python-pydantic: mcp')

prepare(){
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  sed -i 's/"pnpm": "^9"/"pnpm": "^10"/g' package.json # Use pnpm 10
  rm -rf test/test_docker # Remove tests that need docker
}

build() {
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  pnpm i --ignore-scripts
  NODE_OPTIONS="--max-old-space-size=8192" pnpm build
  PYTHONPATH="${srcdir}/${_name}-${_name}-${pkgver}:$PYTHONPATH" python -c "import gradio"
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
    # Failed
    --deselect test/test_blocks.py::test_post_process_file_blocked
  )
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  ulimit -n 8192
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer "${srcdir}"/*.whl
  PATH="${srcdir}/${_name}-${_name}-${pkgver}/test-env/bin:$PATH" test-env/bin/python -m pytest "${pytest_options[@]}" test
}

package() {
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
