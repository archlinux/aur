# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Daniel Moch <daniel@danielmoch.com>

## GPG: https://github.com/lautat.gpg

pkgname=python-blurhash
_pkg=blurhash-python
pkgver=1.2.2
pkgrel=1
pkgdesc='Python implementation of the blurhash algorithm'
arch=('x86_64' 'aarch64')
url="https://github.com/woltapp/blurhash-python"
license=('MIT')
depends=('python-cffi' 'python-pillow' 'python-six')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('f2dbb8a58c5a299c8fca81112e52471a15cff38020ca9a65dae96a777609b8d4')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkg-$pkgver"
  local python_version="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest -x
}

package() {
  cd "$_pkg-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dv "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv "$_site/${_pkg/-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: set sts=2 sw=2 ft=PKGBUILD et:
