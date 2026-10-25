# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=hypercorn
pkgname=python-$_name
pkgver=0.18.0
pkgrel=1
pkgdesc='A ASGI Server based on Hyper libraries and inspired by Gunicorn.'
arch=('any')
url='https://github.com/pgjones/hypercorn'
license=('MIT')
depends=('python'
         'python-h11'
         'python-h2'
         'python-priority'
         'python-wsproto')
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
checkdepends=('python-httpx'
              'python-hypothesis'
              'python-pytest'
              'python-pytest-asyncio'
              'python-pytest-trio'
              'python-trio')
optdepends=('python-aioquic: h3'
            'python-uvloop: uvloop')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('094c4b85d69aeb9a79e28e8f8c5f3d87dbd8c1e6668c085ff08104f02fde0497')

prepare() {
  cd "$_name-$pkgver"
  # Add :protocol to the CONNECT requests, as h2 4.4 rejects websocket CONNECT without it
  sed -i 's/^\( *\)(":method", "CONNECT"),/&\n\1(":protocol", "websocket"),/' tests/asyncio/test_sanity.py tests/trio/test_sanity.py
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --override-ini="addopts="
    --showlocals
    --strict-markers
  )
  cd "$_name-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}"
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
