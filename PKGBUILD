# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Buce <dmbuce@gmail.com>

pkgname=python-pynbt-git
pkgver=3.1.0.r0.gbd7e545
pkgrel=1
pkgdesc="Tiny, liberally-licensed NBT library"
license=('MIT')
arch=('any')
url="https://github.com/TkTech/PyNBT"
depends=('python-mutf8')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
provides=('python-pynbt')
conflicts=('python-pynbt')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  PYTHONPATH="$PWD" pytest -x
}

package() {
  cd "$pkgname"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "$_site/PyNBT-${pkgver%.r*}.dist-info/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
