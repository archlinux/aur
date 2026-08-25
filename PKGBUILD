# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio
pkgname=python-$_name
pkgver=6.26.0
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=('any')
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
depends=('python' 'python-anyio' 'python-audioop-lts' 'python-brotli' 'python-fastapi' 'python-groovy' 'python-gradio-client' 'python-hf-gradio' 'python-httpx' 'python-huggingface-hub' 'python-jinja' 'python-markupsafe' 'python-numpy' 'python-orjson' 'python-packaging' 'python-pandas' 'python-pillow' 'python-pydantic' 'python-python-multipart' 'python-pydub' 'python-pyyaml' 'python-safehttpx' 'python-semantic-version' 'python-starlette' 'python-tomlkit' 'python-typer' 'python-typing_extensions' 'uvicorn' 'python-pytz')
makedepends=('python-hatchling' 'python-hatch-requirements-txt' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel' 'pnpm' 'npm')
checkdepends=('ipython' 'python-altair' 'python-boto3' 'python-matplotlib' 'python-hypothesis' 'jupyter-nbformat' 'python-openai' 'python-polars' 'python-email-validator' 'python-pytest' 'python-pytest-asyncio' 'python-pytest-rerunfailures' 'python-requests' 'python-respx' 'python-scikit-image' 'python-pytorch' 'python-tqdm' 'python-transformers' 'python-vega_datasets' 'python-diffusers' 'python-authlib' 'python-itsdangerous' 'python-mcp' 'mime-types' 'ffmpeg')
optdepends=('python-authlib: oauth' 'python-itsdangerous: oauth'
            'python-mcp: mcp' 'python-pydantic: mcp'
            'ruff: needed for custom component docs generation'
            'ffmpeg: audio/video processing')
source=("$url/archive/refs/tags/$_name@$pkgver.tar.gz")
sha256sums=('ad4becfa5b4258dc08e38ffa8ac108440e9f83d6c8ee9bbb7773a4b1924af6d8')

prepare(){
  cd "$srcdir"/$_name-$_name-$pkgver
  # Remove tests that need docker
  rm -rf test/test_docker
  # Fix tests
  sed -i 's/package_json\["dependencies"\]/package_json.setdefault("dependencies", {})/' gradio/cli/commands/components/_create_utils.py
  sed -i 's/            "TabbedInterface",/            "TabbedInterface",\n            "Workflow",/' gradio/utils.py
  sed -i "s/f\"{url}\//f\"{url.rstrip('\/')}\//g" test/test_routes.py
  sed -i "s/f\"{local_url}\//f\"{local_url.rstrip('\/')}\//g" test/test_routes.py
  sed -i 's/"-map", "0:a:0", "-f", "md5", "-"/"-map", "0:a:0", "-c", "copy", "-f", "md5", "-"/' test/test_processing_utils.py
}

build() {
  cd "$srcdir"/$_name-$_name-$pkgver
  PYTHONPATH=$PWD python scripts/generate_theme.py
  pnpm i --frozen-lockfile --ignore-scripts
  NODE_OPTIONS="--max-old-space-size=8192" pnpm build
  PYTHONPATH=$PWD python scripts/download_offline_assets.py
  PYTHONPATH=$PWD python -c "import gradio"
  local _fc=$PWD/gradio/_frontend_code/$pkgver
  local _find=(
    -type f \( -name '*.ts' -o -name '*.svelte' -o -name '*.json' \)
    ! -path '*/node_modules/*'
    ! -path '*/dist/*'
    ! -path '*/.svelte-kit/*'
    ! -name 'CHANGELOG*'
    ! -name 'README.md'
    ! -name '*.test.*'
    ! -name '*.stories.*'
    ! -name '*.spec.*' )
  mkdir -p $_fc
  local d
  for d in js/*/ client/js/; do
    d=${d%/}
    case ${d##*/} in _*|app|storybook|playwright-report|workbench|tooltils|component-test|core|spa) continue ;; esac
    ( cd ${d%/*} && find ${d##*/} "${_find[@]}" -exec cp --parents -t $_fc {} + )
  done
  mv $_fc/js $_fc/client
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    -p 'no:flaky'
    # Need tokens
    --deselect test/test_buttons.py::TestOAuthButtons::test_login_button_warns_when_not_on_spaces
    --deselect test/test_external.py
  )
  cd "$srcdir"/$_name-$_name-$pkgver
  ulimit -n 16384
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH=$PWD/test-env/bin:$PATH test-env/bin/python -P -m pytest "${pytest_options[@]}" test
}

package() {
  cd "$srcdir"/$_name-$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
