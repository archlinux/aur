# Maintainer: Kino <cybao292261@163.com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-viztracer
_pkgname=viztracer
pkgver=1.0.2
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
sha512sums=('fea3a35d9e740b10b92d54ab4d65de49f3338a005bc35cd9942d11c1600b8d8d462105a65f52a95b46436183441a3f17633fd69d26f1ef0d7c6f54742e52e9ed')
b2sums=('f5e219f4282772cc7c1f2725df9d3546ea03a62f6f9ca0c0eb2742c7f1df4d5d8cdfb4e7b303a1c364640730d780ef0e3940fe3fab0952fe446b50024a0fd44c')

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
