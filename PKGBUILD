# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name1=httpcore2
_name0=httpx2
pkgbase=python-$_name0
pkgname=(python-$_name1 python-$_name0)
pkgver=2.2.0
pkgrel=1
arch=('any')
url='https://github.com/pydantic/httpx2'
license=('BSD-3-Clause')
depends=('python' 'python-certifi')
makedepends=('python-hatchling' 'python-hatch-fancy-pypi-readme' 'python-uv-dynamic-versioning' 'python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=('python-brotli' 'python-brotlicffi' 'python-click' 'python-pygments' 'python-rich' 'python-h2' 'python-socksio' 'python-zstandard' 'python-anyio' 'python-trio' 'python-chardet' 'python-cryptography' 'python-pytest' 'python-pytest-httpbin' 'python-pytest-trio' 'python-trustme' 'uvicorn' 'python-werkzeug')
source=("$_name0::git+$url.git#tag=v$pkgver")
sha256sums=('489857b6883a0a14d74e679fa82ea49d0aecf61f5c01de8a4290fdb9099ac5b5')

prepare() {
  cd "$srcdir"/$_name0
  # Fixes until uvicorn updated by Arch maintainers
  sed -i 's/loop="asyncio"/loop="asyncio", ws="none"/' tests/httpx2/conftest.py
  sed -i 's/Transfer-Encoding/transfer-encoding/' tests/httpx2/test_main.py
  sed -i 's/ISO-8859-1/WINDOWS-1252/' tests/httpx2/client/test_client.py
}

build() {
  cd "$srcdir"/$_name0
  python -m build --wheel --no-isolation src/$_name1
  python -m build --wheel --no-isolation src/$_name0
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name0
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer src/$_name1/dist/*.whl
  test-env/bin/python -m installer src/$_name0/dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests/$_name
}

package_python-httpcore2() {
  pkgdesc='A minimal low-level HTTP client.'
  url='https://github.com/pydantic/pydantic-ai/'
  depends+=('python-h11')
  optdepends=('python-h2: http2'
              'python-socksio: socks'
              'python-trio: trio'
              'python-anyio: asyncio')
  cd "$srcdir"/$_name0
  python -m installer --destdir="$pkgdir" src/$_name1/dist/*.whl
}

package_python-httpx2() {
  pkgdesc='The next generation HTTP client.'
  url='https://github.com/pydantic/pydantic-ai/'
  depends+=('python-httpcore2' 'python-anyio' 'python-idna')
  optdepends=('python-brotli: brotli' 'python-brotlicffi: brotli'
              'python-click: cli' 'python-pygments: cli' 'python-rich: cli'
              'python-h2: http2'
              'python-socksio: socks'
              'python-zstandard: zstd')
  cd "$srcdir"/$_name0
  python -m installer --destdir="$pkgdir" src/$_name0/dist/*.whl
}
