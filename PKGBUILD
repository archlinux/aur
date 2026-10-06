# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=envoy-server
pkgname=python-$_name
pkgver=1.39.1
pkgrel=1
pkgdesc='A Python wheel distribution of the Envoy server.'
arch=('x86_64' 'aarch64')
url='https://github.com/curioswitch/py-envoy-server'
license=('MIT' 'Apache-2.0')
depends=('python'
         'glibc')
makedepends=('python-uv-build'
             'python-build'
             'python-installer'
             'python-wheel'
             'git')
checkdepends=('python-httpx'
              'python-pytest')
provides=('envoyproxy')
conflicts=('envoyproxy' 'envoy')
options=(!strip)
source=("$_name::git+$url.git#tag=v$pkgver")
source_x86_64=("envoy::https://github.com/envoyproxy/envoy/releases/download/v$pkgver/envoy-$pkgver-linux-x86_64")
source_aarch64=("envoy::https://github.com/envoyproxy/envoy/releases/download/v$pkgver/envoy-$pkgver-linux-aarch_64")
sha256sums=('059cadd9672a9d4951adf965f7b1a254e8f24346108e00a42fe544345807f0c2')
sha256sums_x86_64=('002c6e1c69ed0fa0ea381887247cadadfaec9481375fa8d8d2b1731eeabf40b8')
sha256sums_aarch64=('8565ad0af4b1d1d3c986e5165c027add3073579182f398dd7f4d728d25e9ec62')

prepare() {
  cd "$srcdir"/$_name
  # Use the uv_build version shipped by Arch
  sed -i 's/uv_build>=0.12.1,<0.13.0/uv_build/' pyproject.toml
  sed -i 's/.venv/test-env/' tests/test_runs.py
  cp -f "$srcdir"/envoy envoy/_bin/envoy
  chmod +x envoy/_bin/envoy
}

build() {
  cd "$srcdir"/$_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH=$PWD/test-env/bin:$PATH test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
