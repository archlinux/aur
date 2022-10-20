# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Frederik "Freso" S. Olesen <freso.dk@gmail.com>

pkgname=python-uritools-git
_pkg=uritools
pkgver=4.0.0.r0.g0f20688
pkgrel=2
pkgdesc='RFC 3986 compliant, Unicode-aware, scheme-agnostic replacement for urlparse'
arch=('any')
url="https://github.com/tkem/uritools"
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-wheel')
checkdepends=('python-pytest')
provides=('python-uritools')
conflicts=('python-uritools')
source=("$_pkg::git+$url")
md5sums=('SKIP')

pkgver() {
  git -C "$_pkg" describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkg"
  python -m build --wheel --no-isolation
  PYTHONPATH="$PWD/src" make -C docs man
}

check() {
  cd "$srcdir/$_pkg"
  PYTHONPATH="$PWD/src" pytest -x --disable-warnings
}

package() {
  cd "$_pkg"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 docs/_build/man/uritools.1 -t "$pkgdir/usr/share/man/man1/"
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "$_site/$_pkg-${pkgver%.r*}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
