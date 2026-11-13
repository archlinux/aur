# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio
pkgname=python-$_name
pkgver=6.32.0
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
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$_name@$pkgver.tar.gz"
        'httpx2.patch'
        'mcp-v2.patch')
sha256sums=('5ba9320d4fe7ea9f8b0cfefe0b0ea67304bb14daf87e36c1f112b0e87d10df37'
            'af9e93365e5837c24738ce795c8bebef11281b29360e1cddc2563ab1bd28a770'
            'd280a15c450272f41a2224aafeec46ade2aaf278905686d787bbd2664dd56544')

prepare(){
  cd "$_name-$_name-$pkgver"
  # Use the hatchling and hatch plugin versions shipped by Arch
  sed -i '/^requires = \[/,/\]/s/"\([^"<>=!~]*\)[<>=!~][^"]*"/"\1"/' pyproject.toml
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
  # @gradio/model3d lives in js/model3D: find the package folder case-insensitively (WorkflowCanvas template)
  sed -i 's|Path(local_js_dir / name.split("/")\[1\] / "package.json")|Path(next(d for d in local_js_dir.iterdir() if d.name.lower() == name.split("/")[1]) / "package.json")|' gradio/cli/commands/components/_create_utils.py
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
    --deselect test/test_buttons.py::TestOAuthButtons::test_login_button_warns_when_not_on_spaces
    --deselect test/test_external.py::TestLoadInterface::test_multiple_spaces_one_private
    --deselect test/test_external.py::TestLoadInterface::test_private_space_v4_sse_v1
    --deselect test/test_history.py::test_oauth_is_available_only_on_a_space_with_a_login_button
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
