# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

## GPG key from https://github.com/thombashi.gpg

pkgname=python-appconfigpy
pkgver=1.0.2
pkgrel=4
pkgdesc='Python library to create/load an application configuration file'
arch=('any')
url='https://github.com/thombashi/appconfigpy'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=(
  "$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/appconfigpy/appconfigpy-$pkgver.tar.gz"
  "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/a/appconfigpy/appconfigpy-$pkgver.tar.gz.asc"
  'remove-examples.patch')
sha256sums=('114336a9e01d04c4818fd4512f470f611aabf2ea5925b7ba5a6ca25c70f173d8'
            'SKIP'
            'cf3930e36be488e21655e84ee246676b3ff293bc98253113545fdd5d275f154a')
validpgpkeys=('ACEC3954F31619D7288C17B07BAC46763C91BB7A') ## Tsuyoshi Hombashi

prepare() {
  patch -p1 -d "appconfigpy-$pkgver" < remove-examples.patch
}

build() {
  cd "appconfigpy-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "appconfigpy-$pkgver"
  PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
  export PYTHONHASHSEED=0
  cd "appconfigpy-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/appconfigpy-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
