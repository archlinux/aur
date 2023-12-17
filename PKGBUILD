# Maintainer: Ryan Delaney <ryan.patrick.delaney at proton dot me>
# Contributor: Luis Martinez <luis at martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=jello
pkgver=1.6.0
pkgrel=1
pkgdesc='Filter JSON and JSON Lines data with Python syntax'
arch=('any')
url='https://github.com/kellyjonbrazil/jello'
license=('MIT')
depends=('python-pygments')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e27d8a7843ffbdb3a5f7cde92b3629029b29d75f7b726b4ef5759b0ee43d4ec9')

prepare() {
  cd "$pkgname-$pkgver"
  ## setup.py installs man page to site-package directory; we don't want that
  sed -i '/include_package_data/s/True/False/' setup.py
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  python -m unittest
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dvm644 README.md ADVANCED_USAGE.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dvm644 man/jello.1 -t "$pkgdir/usr/share/man/man1/"
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dv "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv "$_site/$pkgname-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
