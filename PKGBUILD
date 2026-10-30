# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio
pkgname=python-$_name
pkgver=6.31.0
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=('any')
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
depends=('python'
         'python-anyio'
         'python-audioop-lts'
         'python-brotli'
         'python-fastapi'
         'python-groovy'
         'python-gradio-client'
         'python-hf-gradio'
         'python-httpx2'
         'python-huggingface-hub'
         'python-jinja'
         'python-markupsafe'
         'python-numpy'
         'python-orjson'
         'python-packaging'
         'python-pandas'
         'python-pillow'
         'python-pydantic'
         'python-python-multipart'
         'python-pydub'
         'python-pyyaml'
         'python-safehttpx'
         'python-semantic-version'
         'python-starlette'
         'python-tomlkit'
         'python-typer'
         'python-typing_extensions'
         'uvicorn'
         'python-pytz')
makedepends=('python-hatchling'
             'python-hatch-requirements-txt'
             'python-hatch-fancy-pypi-readme'
             'python-build'
             'python-installer'
             'python-wheel'
             'pnpm'
             'npm')
checkdepends=('ipython'
              'python-altair'
              'python-boto3'
              'python-matplotlib'
              'python-hypothesis'
              'jupyter-nbformat'
              'python-openai'
              'python-polars'
              'python-email-validator'
              'python-pytest'
              'python-pytest-asyncio'
              'python-pytest-rerunfailures'
              'python-requests'
              'python-scikit-image'
              'python-pytorch'
              'python-tqdm'
              'python-transformers'
              'python-vega_datasets'
              'python-diffusers'
              'python-authlib'
              'python-itsdangerous'
              'python-mcp'
              'mime-types'
              'ffmpeg')
optdepends=('python-authlib: oauth'
            'python-itsdangerous: oauth'

            'python-mcp: mcp'
            'python-pydantic: mcp'

            'ruff: needed for custom component docs generation'

            'ffmpeg: audio/video processing')
source=("$url/archive/refs/tags/$_name@$pkgver.tar.gz"
        'httpx2.patch'
        'mcp-v2.patch')
sha256sums=('6fc3c6d3dd67549c2970a78c6543c0fe1cc2dd2de90875fd0c387585ab82ace3'
            '77fa9298a3c52f78bf9da6ad244c3a1c73416b65a7bec1d3230c7bff774f2721'
            '97f0e6a75156bf0cbf0c39d87537d0ff4e321f84f3eb117defe2f45dd5212c98')

prepare(){
  cd "$_name-$_name-$pkgver"
  # Move from httpx to httpx2, needed by safehttpx 0.2.0 (backport of upstream eb54503, #13920)
  patch -Np1 -i ../httpx2.patch
  # Port the MCP integration and its tests to mcp 2 (backport of upstream ee4d8a8, #13921)
  patch -Np1 -i ../mcp-v2.patch
  # Remove tests that need docker
  rm -rf test/test_docker
  # Fix tests
  sed -i "s/f\"{url}\//f\"{url.rstrip('\/')}\//g" test/test_routes.py
  sed -i "s/f\"{local_url}\//f\"{local_url.rstrip('\/')}\//g" test/test_routes.py
  sed -i 's/"-map", "0:a:0", "-f", "md5", "-"/"-map", "0:a:0", "-c", "copy", "-f", "md5", "-"/' test/test_processing_utils.py
  # starlette 1.10 percent-encodes a "?" in scope["path"]: pass the query string separately
  sed -i 's/"path": request_url,/"path": request_url.split("?")[0], "query_string": request_url.partition("?")[2].encode(),/' test/test_routes.py
  sed -i 's/"server": server, "path": path}/"server": server, "path": path.split("?")[0], "query_string": path.partition("?")[2].encode()}/' test/test_routes.py
  # Python 3.14 reads files with a bigger buffer, so the file must be larger than it for the truncation to be seen
  sed -i 's/RangedFileResponse.chunk_size \* 4)/RangedFileResponse.chunk_size * 64)/' test/test_ranged_response.py
}

build() {
  cd "$_name-$_name-$pkgver"
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
  cd "$_name-$_name-$pkgver"
  ulimit -n 16384
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH=$PWD/test-env/bin:$PATH test-env/bin/python -P -m pytest "${pytest_options[@]}" test
}

package() {
  cd "$_name-$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
