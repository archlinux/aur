# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Giacomo Vercesi <mrjackv at hotmail dot it>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-mbstrdecoder
_pkg="${pkgname#python-}"
pkgver=1.1.5
pkgrel=1
pkgdesc='Multi-byte character string decoder'
arch=('any')
url='https://github.com/thombashi/mbstrdecoder'
license=('MIT')
depends=('python-chardet')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-faker')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d8e70e4242dfdba102ea63bfb6633a93a86d2cff9fe1ecebf4e951597b2046a2')

build() {
  cd "$_pkg-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check() {
  cd "mbstrdecoder-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest -x -o addopts=""
}

package() {
  cd "$_pkg-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"

  local _site=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "$_site/$_pkg-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
