# Maintainer: Kino <cybao292261@163.com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-viztracer
_pkgname=viztracer
pkgver=1.1.0
pkgrel=1
pkgdesc='VizTracer is a low-overhead logging/debugging/profiling tool that can trace and visualize your python code execution.'
arch=('x86_64')
url="https://github.com/gaogaotiantian/viztracer"
license=('Apache-2.0')
depends=('python' 'python-objprint')
makedepends=(
  'python-wheel'
  'python-build'
  'python-installer'
)
optdepends=(
  'python-rich: Full function support'
  'python-orjson: Full function support'
  'chromium: browser to open html results'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/gaogaotiantian/viztracer/archive/$pkgver.tar.gz")
sha512sums=('58629633254dc791bebdcc7be5b424c6f424526276c49f45557d0ebd16ba80386cd6566cce9e260ee8de407dfdb85f55ef63ee51d8f63a03ef9d12389fe6dc1f')
b2sums=('f0cf48113d3c8d7b2a945af6b470561ac7bad6f02d0776fe70d885e8f329e58b3a7c27b61a9ba1d69c88a222125dd147a1b48ebd9b2b0a0e39d6fea65c1a45c3')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver" || exit

  # Disable it because the external processor is something that the script should download from google.
  sed -i "s|use_external_processor=True|use_external_processor=False|g" tests/test_viewer.py

  # Attach is not working, this is some black magic and is OS-dependent.
  rm tests/test_remote.py
}

build() {
  cd "$srcdir/$_pkgname-$pkgver" || exit

  CFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[2-3]\s//g" <(echo $CFLAGS))
  CXXFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[2-3]\s//g" <(echo $CXXFLAGS))

  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_pkgname-$pkgver" || exit
  # From upstream, virtual environment is highly recommended.
  python -m venv venv --system-site-packages
  source venv/bin/activate
  $PWD/venv/bin/python -m pip install loky
  $PWD/venv/bin/python -m installer dist/*.whl
  $PWD/venv/bin/python -m unittest
  deactivate # existing in virtual environment
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
