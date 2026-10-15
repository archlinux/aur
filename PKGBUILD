# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=envoy-server
pkgname=python-$_name
pkgver=1.40.0
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
sha256sums=('292737aba482445181bd316fe02f40f4a421865b31b1f8b4772ddb758e326e3d')
sha256sums_x86_64=('8aa137a7d00994ce43f613556f5a120709229f63bedb86eedde5ccbc402c2b80')
sha256sums_aarch64=('03cacc952561635c0b7d2a829291f341dadbebc32050475efbe7321b1bbe18c2')

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
