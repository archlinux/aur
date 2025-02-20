# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio
pkgname=python-${_name}
pkgver=5.16.1
pkgrel=4
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=('x86_64' 'aarch64')
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/${_name}@${pkgver}.tar.gz"
        "https://files.pythonhosted.org/packages/py3/g/gradio-pdf/gradio_pdf-0.0.22-py3-none-any.whl")
source_x86_64=("pnpm::https://github.com/pnpm/pnpm/releases/download/v9.15.5/pnpm-linuxstatic-x64")
source_aarch64=("pnpm::https://github.com/pnpm/pnpm/releases/download/v9.15.5/pnpm-linuxstatic-arm64")
sha256sums=('52848de66cb1d2e6b00516b75b8b63ae633c47bcc0db8a7f9c01d43b20cdec6a'
            '6f710eca3464d2d37aee742eb2f10dbe76772ebe5dfcfb993da40c710c9ad1b5')
sha256sums_x86_64=('aba9e8f4d8ec69f282f8ce1b3e316d1391135e7e46fd529ddca0c35c0275dc0a')
sha256sums_aarch64=('d95fe67108268df12a750429e1f48c46a1d25bfeb17ca142cfcbbe3bbada8a1c')
depends=('python>=3.10' 'python-aiofiles' 'python-anyio' 'python-audioop-lts' 'python-fastapi' 'python-ffmpy' 'python-gradio-client' 'python-httpx' 'python-huggingface-hub' 'python-jinja' 'python-markupsafe' 'python-numpy' 'python-orjson' 'python-packaging' 'python-pandas' 'python-pillow' 'python-pydantic' 'python-python-multipart' 'python-pydub' 'python-pyyaml' 'python-ruff' 'python-safehttpx' 'python-semantic-version' 'python-starlette' 'python-tomlkit' 'python-typer' 'python-typing_extensions' 'python-urllib3' 'uvicorn')
makedepends=('python-hatchling' 'python-hatch-requirements-txt' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('ipython' 'python-altair' 'python-boto3' 'python-coverage' 'python-fastapi' 'python-matplotlib' 'python-httpx' 'python-huggingface-hub' 'python-hypothesis' 'python-polars' 'python-pydantic' 'python-email-validator' 'python-pytest' 'python-pytest-asyncio' 'python-pytest-cov' 'python-pytest-rerunfailures' 'python-ruff' 'python-respx' 'python-scikit-image' 'python-pytorch' 'python-tqdm' 'python-transformers' 'python-vega_datasets' 'python-diffusers')
optdepends=('python-authlib: oauth' 'python-itsdangerous: oauth')

prepare(){
  chmod +x pnpm
  ln -sf $(pwd)/pnpm "${srcdir}"/${_name}-${_name}-${pkgver}/pnpm
}

build() {
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  env PATH=$(pwd):$PATH ./pnpm i --frozen-lockfile --ignore-scripts
  env PATH=$(pwd):$PATH ./pnpm build
  python -m build --wheel --no-isolation
}

check() {
    local pytest_options=(
    # Need HuggingFace token
    --deselect test/test_buttons.py::TestOAuthButtons::test_login_button_warns_when_not_on_spaces
    --deselect test/test_external.py::TestLoadInterface::test_numerical_to_label_space
    --deselect test/test_external.py::TestLoadInterface::test_private_space
    --deselect test/test_external.py::TestLoadInterface::test_multiple_spaces_one_private
    --deselect test/test_external.py::TestLoadInterface::test_loading_files_via_proxy_works
    --deselect test/test_external.py::TestLoadInterface::test_private_space_v4_sse_v1
    --deselect test/test_external.py::TestLoadInterfaceWithExamples::test_interface_with_examples
    # Need tf_keras package
    --deselect test/test_pipelines.py::test_text_to_text_model_from_pipeline
    --deselect test/test_pipelines.py::test_interface_in_blocks
    --deselect test/test_pipelines.py::test_transformers_load_from_pipeline
    # Need custom tunnel
    --deselect test/test_tunneling.py::test_setup_custom_tunnel
  )
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  ulimit -n 8192
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "${srcdir}"/*.whl
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -p no:flaky "${pytest_options[@]}" test -vv --override-ini="addopts="
}

package() {
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
