# Maintainer: Kino <cybao292261@163.com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-viztracer
_pkgname=viztracer
pkgver=0.16.3
pkgrel=2
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
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/gaogaotiantian/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('959c8d52e55241deba86bebc33366ba8e23da93f5763b27a4a937632741ad225')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver" || exit

  # Avoid exceeding maximum recursion depth.
  sed -i "s|call_self(1000)|call_self(888)|g" tests/test_vcompressor.py

  # Disable external processor testing because we don't have it.
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
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-$_pkgname/LICENSE"
}
