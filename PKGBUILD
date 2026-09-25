# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=dapr
pkgname=python-$_name
pkgver=1.18.3
pkgrel=1
pkgdesc='The official release of Dapr Python SDK.'
arch=('any')
url='https://github.com/dapr/python-sdk'
license=('Apache-2.0')
depends=('python'
         'python-protobuf'
         'python-grpcio'
         'python-grpcio-status'
         'python-aiohttp'
         'python-dateutil'
         'python-typing_extensions')
makedepends=('python-hatchling'
             'python-build'
             'python-installer'
             'python-wheel'
             'git')
checkdepends=('python-opentelemetry-sdk'
              'python-httpx'
              'python-cryptography'
              'python-flask'
              'python-pytest'
              'python-pytest-asyncio'
              'python-pydantic'
              'python-fastapi')
source=("$_name::git+$url.git#tag=v$pkgver"
        "fix-certs-pyopenssl.patch")
sha256sums=('00a20294b62fb7b628b06fb454dfedf41801f7979b62da11821d99cb93af11e7'
            '9953c6bc1f9c3162144840a1f450044a5d1b6ffd4db26ccfe4aa48302ef02ec5')

prepare() {
  cd "$srcdir"/$_name
  # pyOpenSSL >= 26.2 removed X509.add_extensions used by tests/clients/certs.py;
  # backport upstream's switch to cryptography (6cce46c, #1111)
  patch -Np1 -i "$srcdir"/fix-certs-pyopenssl.patch
}

build() {
  cd "$srcdir"/$_name
  python -m build --wheel --no-isolation
  python -m build --wheel --no-isolation ext/$_name-ext-fastapi
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --import-mode=importlib
    --ignore=tests/integration
    --ignore=tests/examples
  )
  cd "$srcdir"/$_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer ext/$_name-ext-fastapi/dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
