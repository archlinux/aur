# Maintainer: Luis Martinez <luis at martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=jello-git
_pkg="${pkgname%-git}"
pkgver=1.5.5.r0.ge8055fb
pkgrel=1
pkgdesc='Filter JSON and JSON Lines data with Python syntax'
arch=('any')
url='https://github.com/kellyjonbrazil/jello'
license=('MIT')
depends=('python-pygments')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("$_pkg")
conflicts=("$_pkg")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$pkgname"
  sed -i '/include_package_data/s/True/False/' setup.py
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  python -m unittest
}

package() {
  cd "$pkgname"
  python -m installer --destdir "$pkgdir" dist/*.whl
  install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dvm644 man/jello.1 -t "$pkgdir/usr/share/man/man1/"
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dv "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv "$_site/$_pkg-${pkgver%.r*}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
