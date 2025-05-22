# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio
pkgname=python-${_name}
pkgver=5.30.0
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=('x86_64' 'aarch64')
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/${_name}@${pkgver}.tar.gz")
source_x86_64=("pnpm::https://github.com/pnpm/pnpm/releases/download/v9.15.9/pnpm-linuxstatic-x64")
source_aarch64=("pnpm::https://github.com/pnpm/pnpm/releases/download/v9.15.9/pnpm-linuxstatic-arm64")
sha256sums=('8d9ee409df9c3848c29de11cb703b17d87fb773ea9c8e0416c1a78e5ffec0a9b')
sha256sums_x86_64=('038f2a41ccdabc823d09e5697fff85f2e74d5c37591f6d58dfd33a59ffa17fc0')
sha256sums_aarch64=('2f8069dbb472b93a54d4c016b2e36968586c87f62e659dd966472a78cada5d99')
depends=('python' 'python-aiofiles' 'python-anyio' 'python-audioop-lts' 'python-fastapi' 'python-ffmpy' 'python-groovy' 'python-gradio-client' 'python-httpx' 'python-huggingface-hub' 'python-jinja' 'python-markupsafe' 'python-numpy' 'python-orjson' 'python-packaging' 'python-pandas' 'python-pillow' 'python-pydantic' 'python-python-multipart' 'python-pydub' 'python-pyyaml' 'python-ruff' 'python-safehttpx' 'python-semantic-version' 'python-starlette' 'python-tomlkit' 'python-typer' 'python-typing_extensions' 'python-urllib3' 'uvicorn')
makedepends=('python-hatchling' 'python-hatch-requirements-txt' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('ipython' 'python-altair' 'python-fastapi' 'python-matplotlib' 'python-httpx' 'python-huggingface-hub' 'python-hypothesis' 'python-polars' 'python-pydantic' 'python-email-validator' 'python-pytest' 'python-pytest-asyncio' 'python-pytest-cov' 'python-pytest-rerunfailures' 'python-respx' 'python-scikit-image' 'python-pytorch' 'python-tqdm' 'python-transformers' 'python-vega_datasets' 'python-diffusers')
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
    -p no:flaky
    # Test Gradio inside Docker
    --ignore test/test_docker
    # Need HuggingFace token
    --deselect test/test_buttons.py::TestOAuthButtons::test_login_button_warns_when_not_on_spaces
    --deselect test/test_external.py::TestLoadInterface::test_numerical_to_label_space
    --deselect test/test_external.py::TestLoadInterface::test_private_space
    --deselect test/test_external.py::TestLoadInterface::test_multiple_spaces_one_private
    --deselect test/test_external.py::TestLoadInterface::test_loading_files_via_proxy_works
    --deselect test/test_external.py::TestLoadInterface::test_private_space_v4_sse_v1
    --deselect test/test_external.py::TestLoadInterfaceWithExamples::test_interface_with_examples
    --deselect test/test_external.py::TestLoadInterface::test_image_classification_model
    --deselect test/test_external.py::TestLoadInterface::test_translation_model
    --deselect test/test_external.py::TestLoadInterface::test_visual_question_answering
    --deselect test/test_external.py::TestLoadInterface::test_sentiment_model
    --deselect test/test_external.py::TestLoadInterface::test_image_to_text
    --deselect test/test_external.py::TestLoadInterface::test_speech_recognition_model
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
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/pip install -U gradio-pdf # Prevent cercular dependencies
  PATH="${srcdir}/${_name}-${_name}-${pkgver}/test-env/bin:$PATH" test-env/bin/python -m pytest "${pytest_options[@]}" test
}

package() {
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
