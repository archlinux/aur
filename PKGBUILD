# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  jyantis <yantis@yantis.net>

pkgname=python-pymarc-git
pkgver=4.1.3.r2.g953c5c3
pkgrel=1
pkgdesc='Python library for working with bibliographic data encoded in MARC21'
arch=('any')
url='https://gitlab.com/pymarc/pymarc'
license=('BSD')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('python-pymarc')
conflicts=('python-pymarc')
source=("pymarc::git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C pymarc describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd pymarc
  python -m build --wheel --no-isolation
}

check() {
  cd pymarc
  python setup.py test --verbose
}

package() {
  cd pymarc
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "$_site/pymarc-${pkgver%.r*}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
