# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-subprocrunner
pkgver=2.0.0
pkgrel=2
pkgdesc='Python wrapper library for subprocess module'
arch=('any')
url='https://github.com/thombashi/subprocrunner'
license=('MIT')
depends=('python-mbstrdecoder')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=('python-pytest-runner' 'python-pytest-mock' 'python-typepy')
source=(
  "$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/subprocrunner/subprocrunner-$pkgver.tar.gz"
  "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/s/subprocrunner/subprocrunner-$pkgver.tar.gz.asc")
sha256sums=('fd22aad8befd610461536463955e205122fed80303b814cc926c3a4a8d9aaf3c'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367') ## Tsuyoshi Hombashi

build() {
  cd "subprocrunner-$pkgver"
  python -m build --wheel --no-isolation
}

## tests fail due to nonexistent 'hostname' command
# check() {
#   cd "$_name-$pkgver"
#   python setup.py pytest
# }

package() {
  export PYTHONHASHSEED=0
  cd "subprocrunner-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/subprocrunner-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
