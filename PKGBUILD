# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=e2b
pkgname=python-$_name
pkgver=2.52.0
pkgrel=1
pkgdesc='E2B SDK that give agents cloud environments.'
arch=('any')
url='https://github.com/e2b-dev/E2B'
license=('MIT')
depends=('python'
         'python-dateutil'
         'python-wcmatch'
         'python-protobuf-py'
         'python-httpx'
         'python-h2'
         'python-attrs'
         'python-packaging'
         'python-typing_extensions'
         'python-dockerfile-parse'
         'python-rich'
         'python-connectrpc'
         'python-pyqwest')
makedepends=('python-uv-build'
             'python-build'
             'python-installer'
             'python-wheel'
             'git')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-pytest-timeout')
source=("$_name::git+$url.git#tag=@$_name/python-sdk@$pkgver")
sha256sums=('52c5bf5e96e3cebfb3586f10a8824b3308dec6f2d0d6960ecc397cdc9b5cdc69')

prepare() {
  cd "$srcdir"/$_name/packages/python-sdk
  # Use the uv_build version shipped by Arch
  sed -i 's/uv_build>=0.10.0,<0.11.0/uv_build/' pyproject.toml
}

build() {
  cd "$srcdir"/$_name/packages/python-sdk
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    -k "not (api_sync or api_async or ((sandbox_sync or sandbox_async) and not (test_config_propagation or test_connect_in_ or test_connect_normalizes or test_instance_connect or test_wait_for_status or test_sync_client_lifecycle)) or ((template_sync or template_async) and (test_make_symlink or test_run_cmd or test_background_build or test_build.py or test_exists or TestTagsIntegration or (test_traces_on and not (credentials or absolute_path or add_mcp_server)))))"
  )
  cd "$srcdir"/$_name/packages/python-sdk
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name/packages/python-sdk
  python -m installer --destdir="$pkgdir" dist/*.whl
}
