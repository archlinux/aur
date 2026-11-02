# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=envoy-server
pkgname=python-$_name
pkgver=1.40.2
pkgrel=1
pkgdesc='A Python wheel distribution of the Envoy server.'
arch=('x86_64' 'aarch64')
url='https://github.com/curioswitch/py-envoy-server'
license=('MIT' 'Apache-2.0')
depends=('python'
         'glibc')
makedepends=('python-uv-build'
             'python-build'
             'python-installer')
checkdepends=('python-httpx'
              'python-pytest')
provides=('envoyproxy')
conflicts=('envoyproxy' 'envoy')
options=(!strip)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("envoy::https://github.com/envoyproxy/envoy/releases/download/v$pkgver/envoy-$pkgver-linux-x86_64")
source_aarch64=("envoy::https://github.com/envoyproxy/envoy/releases/download/v$pkgver/envoy-$pkgver-linux-aarch_64")
sha256sums=('397d3022ab4d0572f2330d5517054906287e6f21b561028d5ccf8efe347efaf6')
sha256sums_x86_64=('1d64506e25c1844f146162ddb2ece7010fa4e784faddb40a079021491f1f03cc')
sha256sums_aarch64=('b9d6d1e06dd5838a3506de9f4deebad3de9a2ce6cadb87cd76222ca286213baf')

prepare() {
  cd "py-$_name-$pkgver"
  # Use the uv_build version shipped by Arch
  sed -i 's/uv_build>=0.13.0,<0.14.0/uv_build/' pyproject.toml
  sed -i 's/.venv/test-env/' tests/test_runs.py
  cp -f "$srcdir"/envoy envoy/_bin/envoy
  chmod +x envoy/_bin/envoy
}

build() {
  cd "py-$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "py-$_name-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH=$PWD/test-env/bin:$PATH test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "py-$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
