# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio
pkgname=python-$_name
pkgver=6.0.2
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=('any')
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
depends=('python' 'python-aiofiles' 'python-anyio' 'python-brotli' 'python-fastapi' 'python-ffmpy' 'python-groovy' 'python-gradio-client' 'python-httpx' 'python-huggingface-hub' 'python-jinja' 'python-markupsafe' 'python-numpy' 'python-orjson' 'python-packaging' 'python-pandas' 'python-pillow' 'python-pydantic' 'python-python-multipart' 'python-pydub' 'python-pyyaml' 'python-safehttpx' 'python-semantic-version' 'python-starlette' 'python-tomlkit' 'python-typer' 'python-typing_extensions' 'uvicorn')
makedepends=('python-hatchling' 'python-hatch-requirements-txt' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel' 'pnpm')
checkdepends=('ipython' 'python-altair' 'python-boto3' 'python-gradio-pdf' 'python-matplotlib' 'python-hypothesis' 'jupyter-nbformat' 'python-openai' 'python-polars' 'python-email-validator' 'python-pytest' 'python-pytest-asyncio' 'python-pytest-rerunfailures' 'python-respx' 'python-scikit-image' 'python-pytorch' 'python-tqdm' 'python-transformers' 'python-vega_datasets' 'python-diffusers' 'python-mcp' 'python-tf-keras' 'python-itsdangerous')
optdepends=('python-authlib: oauth' 'python-itsdangerous: oauth' 'python-mcp: mcp' 'python-pydantic: mcp' 'ruff: needed for custom component docs generation')
source=("$url/archive/refs/tags/$_name@$pkgver.tar.gz")
sha256sums=('2162b735193be26637ecb4aa830fc73cabc0f8b92822a260a1a10b18752d2620')

prepare(){
  cd "$srcdir"/$_name-$_name-$pkgver
  rm -rf test/test_docker # Remove tests that need docker
}

build() {
  cd "$srcdir"/$_name-$_name-$pkgver
  pnpm i --frozen-lockfile --ignore-scripts
  NODE_OPTIONS="--max-old-space-size=8192" pnpm build
  PYTHONPATH=$PWD python -c "import gradio"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    # Need HuggingFace token
    --deselect test/test_buttons.py::TestOAuthButtons::test_login_button_warns_when_not_on_spaces
    --deselect test/test_external.py
    # Need to be fixed by developers
    --deselect test/test_pipelines.py
  )
  cd "$srcdir"/$_name-$_name-$pkgver
  ulimit -n 16384
  PYTHONPATH=$PWD:$PWD/client/python pytest "${pytest_options[@]}" test
}

package() {
  cd "$srcdir"/$_name-$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
