# Maintainer: Kino <cybao292261@163.com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-viztracer
_pkgname=viztracer
pkgver=1.0.1
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
sha512sums=('52b882cc46a84e65f01bc97c204908396a721f1b69e2fb65fa4ac91b77d59bfdaadc1fe4d37ac9e728f738f2c98f720c4959ba54590af0316ac21a151567b834')
b2sums=('d16529b93cb5f231d14a3a46dc9fddda29185b244452562a33b1a9c1252a8471ba14456fa5c55e86816ee533ab960a290fb4c46f3db714a2b8d7a88e18a2da18')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver" || exit

  # Avoid exceeding maximum recursion depth.
  sed -i "s|call_self(1000)|call_self(987)|g" tests/test_vcompressor.py

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
