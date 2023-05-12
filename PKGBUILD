# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Daniel Moch <daniel@danielmoch.com>

## GPG: https://github.com/lautat.gpg

pkgname=python-blurhash
_pkg=blurhash-python
pkgver=1.2.0
pkgrel=1
epoch=1
pkgdesc='Python implementation of the blurhash algorithm'
arch=('x86_64')
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
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/$_pkg/$_pkg-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://pypi.debian.net/$_pkg/$_pkg-$pkgver.tar.gz.asc")
sha256sums=('4caf57039c386ef53fb17598cd90a5c3eca1c76f529c35b4d67166070b9d2de2'
            'SKIP')
validpgpkeys=('C56C6BB7FF00720C6A24B28B6F166EDA7383AD7B') ## Atte Lautanala

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
