# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio-client
pkgname=python-${_name}
pkgver=1.10.4
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=(any)
url='https://github.com/gradio-app/gradio/tree/main/client/python'
license=('Apache-2.0')
source=("https://github.com/gradio-app/gradio/archive/refs/tags/${_name//-/_}@${pkgver}.tar.gz")
sha256sums=('c6dbef3245dd266c5802906220fc1f3b6890951d5005b3b51aa377edff4f1a53')
depends=('python' 'python-fsspec' 'python-httpx' 'python-huggingface-hub' 'python-packaging' 'python-typing_extensions' 'python-websockets')
makedepends=('python-hatchling' 'python-hatch-requirements-txt' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
_gradio_depends=('python-aiofiles' 'python-anyio' 'python-audioop-lts' 'python-fastapi' 'python-ffmpy' 'python-groovy' 'python-gradio-client' 'python-httpx' 'python-huggingface-hub' 'python-jinja' 'python-markupsafe' 'python-numpy' 'python-orjson' 'python-packaging' 'python-pandas' 'python-pillow' 'python-pydantic' 'python-python-multipart' 'python-pydub' 'python-pyyaml' 'python-ruff' 'python-safehttpx' 'python-semantic-version' 'python-starlette' 'python-tomlkit' 'python-typer' 'python-typing_extensions' 'python-urllib3' 'uvicorn')
checkdepends=('python-pytest-asyncio' 'python-pytest' 'python-pytest-xdist' 'python-pydub' ${_gradio_depends[@]})

build() {
  cd "${srcdir}"/${_name//-client/}-${_name//-/_}-${pkgver}/${_name//gradio-/}/${pkgname//-gradio-client/}
  python -m build --wheel --no-isolation
  cd ../..
  python -m build --wheel --no-isolation

}

check() {
  local pytest_options=(
    -vv
    --deselect test/test_client.py # Need HF_TOKEN
  )
  cd "${srcdir}"/${_name//-client/}-${_name//-/_}-${pkgver}/${_name//gradio-/}/${pkgname//-gradio-client/}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer ../../dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" test
}

package() {
  cd "${srcdir}"/${_name//-client/}-${_name//-/_}-${pkgver}/${_name//gradio-/}/${pkgname//-gradio-client/}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
