# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-envinfopy
pkgver=0.0.7
pkgrel=2
pkgdesc='Python Library to get execution environment information'
arch=('any')
url='https://github.com/thombashi/envinfopy'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-discord' 'python-pytest-md-report' 'python-subprocrunner')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/e/envinfopy/envinfopy-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/e/envinfopy/envinfopy-$pkgver.tar.gz.asc")
sha256sums=('83f1f3e9d735fbcbf8b76bcec1f972109aec8450df5688109b88a1952e66512e'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "envinfopy-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "envinfopy-$pkgver"
  PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
  export PYTHONHASHSEED=0
  cd "envinfopy-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 'README.rst' -t "$pkgdir/usr/share/doc/$pkgname"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/envinfopy-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
