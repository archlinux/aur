# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-peakdetect
pkgver=1.2
pkgrel=2
pkgdesc='Simple peak detection'
url='https://github.com/avhn/peakdetect'
arch=('any')
license=('LicenseRef-SeeLICENSEfile')
depends=('python-numpy' 'python-scipy')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(
  "git+$url#tag=v$pkgver"
  'scipy-imports.patch'
  'LICENSE'
)
sha256sums=(
  'SKIP'
  '577137e308d537560481a0ea67daf4d0100e21229c8cf66c06c7f47741393a06'
  '4961c1398d7e4f836b97c9db17e2f0c0bfe51a0fe5784e14c63713eb2c536a6b'
)

prepare() {
  cd 'peakdetect'
  patch -p0 -i "$srcdir/scipy-imports.patch"
}

build() {
  cd 'peakdetect'
  python -m build --wheel --no-isolation
}

check() {
  cd 'peakdetect'
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/"peakdetect-$pkgver"*.whl
  test-env/bin/python -c 'from peakdetect import peakdetect'
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  cd 'peakdetect'
  python -m installer --destdir="$pkgdir" dist/"peakdetect-$pkgver"*.whl
}
