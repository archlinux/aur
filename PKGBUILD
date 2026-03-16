# Maintainer: Kino <cybao292261@163.com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-viztracer
_pkgname=viztracer
pkgver=1.1.1
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
sha512sums=('6ddaab573172f53f940bf2b66f8d384d63378baf4a0b2439e6a816e6aeae69ab44c423dcb1bac3ddd14092667ccfb5323abbc4562e239acbc7c50124726d6476')
b2sums=('a0fc3aca12a93443f1449000c39348f4dae7be80cfeaf6a4829875cc48df515c25dccd102df96f9cfc82c9faf184dedf7d46fa7c76f4eb94a44edcac507dc420')

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
