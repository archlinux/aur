# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=azure-core
pkgname=python-$_name
pkgver=1.41.0
pkgrel=2
pkgdesc='Microsoft Azure Core Shared Client Library for Python'
arch=('any')
_repo='https://github.com/Azure/azure-sdk-for-python'
url="$_repo/tree/main/sdk/core/$_name"
license=('MIT')
depends=('python'
         'python-requests'
         'python-typing_extensions')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'python-wheel')
checkdepends=('python-trio'
              'python-aiohttp'
              'python-certifi'
              'python-pytest'
              'python-dotenv'
              'python-urllib3'
              'python-configargparse'
              'python-pytest-asyncio'
              'python-flask'
              'python-isodate'
              'python-geojson'
              'python-pytest-trio'
              'python-cryptography'
              'python-opentelemetry-sdk'
              'python-opentelemetry-instrumentation-requests'
              'python-packaging'
              'python-opentelemetry-api')
optdepends=('python-aiohttp: aio'

            'python-opentelemetry-api: tracing')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/${_name}_$pkgver.tar.gz"
        'event-loop.patch')
sha256sums=('43b5159c2c4111521ef32c6542cc2c3465de086f70d280dcf63d5c2d7846aa9a'
            'f8b76e67519a487c0d5661c68bcf54f78a32ca3feff797a205911cdf6bc1a788')

prepare() {
  cd "azure-sdk-for-python-${_name}_$pkgver/sdk/core/$_name"
  # Use the setuptools version shipped by Arch
  sed -i '/^requires = /s/"\([^"<>=!~]*\)[<>=!~][^"]*"/"\1"/g' pyproject.toml ../../../eng/tools/azure-sdk-tools/pyproject.toml tests/specs_sdk/modeltypes/pyproject.toml
  # Fix test_aiohttp_loop on Python 3.14 (backport of upstream cb1771372, #48389)
  patch -Np1 -i "$srcdir"/event-loop.patch
}

build() {
  cd "azure-sdk-for-python-${_name}_$pkgver/sdk/core/$_name"
  python -m build --wheel --no-isolation
  python -m build --wheel --no-isolation ../../storage/azure-storage-blob
  python -m build --wheel --no-isolation ../../../eng/tools/azure-sdk-tools
  python -m build --wheel --no-isolation tests/testserver_tests/coretestserver
  python -m build --wheel --no-isolation tests/specs_sdk/modeltypes
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "azure-sdk-for-python-${_name}_$pkgver/sdk/core/$_name"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer ../../storage/azure-storage-blob/dist/*.whl
  test-env/bin/python -m installer ../../../eng/tools/azure-sdk-tools/dist/*.whl
  test-env/bin/python -m installer tests/testserver_tests/coretestserver/dist/*.whl
  test-env/bin/python -m installer tests/specs_sdk/modeltypes/dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "azure-sdk-for-python-${_name}_$pkgver/sdk/core/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
