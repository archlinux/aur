# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=cytoolz
pkgname=python38-cytoolz
pkgver=0.12.0
pkgrel=1
pkgdesc="Cython implementation of Toolz: High performance functional utilities"
arch=(x86_64)
url="https://github.com/pytoolz/cytoolz/"
license=(BSD)
depends=(cython python38-toolz)
makedepends=(python38-build python38-installer python38-setuptools python38-wheel)
checkdepends=(python38-pytest)
options=(debug)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('efc42ed63676389279e0733944d8d41ce0f0139337103e44e9cc04ebb0f346e2e034b6dbb9160e5486bcd9af5b1fde49ef61e18a48922c3d0bab6fc4f6526338')
b2sums=('ff6ada5f16acf016e57078f049c375fcea1031220b904157bbc5286645c08e2606debc5d016c0edbfd5d0ee32ca9b4754ba09672f067eebb5f630b9b05639c05')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  local _pyver=$(python3.8 -m 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  export PYTHONPATH="build/lib.linux-${CARCH}-${_pyver}/:${PYTHONPATH}"
  pytest -v
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
