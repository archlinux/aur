# Maintainer: giver <ryan01234keroro56789@gmail.com>

_pyname=angr
pkgname=python-${_pyname}
pkgver=9.2.49
pkgrel=1
pkgdesc='A powerful and user-friendly binary analysis platform'
url='https://github.com/angr/angr'
license=('BSD')
arch=('any')
depends=(
  'python'
  'python-ailment'
  'python-archinfo'
  'python-cachetools'
  'python-capstone'
  'python-cffi'
  'python-claripy'
  'python-cle'
  'python-dpkt'
  'python-itanium_demangler'
  'python-mulpyplexer'
  'python-nampa'
  'python-networkx'
  'python-progressbar'
  'python-protobuf'
  'python-psutil'
  'python-pycparser'
  'python-pyvex'
  'python-rpyc'
  'python-sortedcontainers'
  'python-sympy'
  'python-unicorn'
)
makedepends=(
  'gcc'
  'make'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('bbe2f1f4995b7236a923a65e00229db62893b802ecfb6083b6603e912dcd999735dfc88645e45a4c15221d0cd1b91857fe8207080941b1c33c7cd972f745d52d')
b2sums=('0e931ae70a30019e8376c8ff2ffb0b47b6398c68bb8505d68875587d3454c74011e18528001f936ca651f30536892bf7fcba849554d0876d79e1d041c165b31d')

prepare() {
  # we don't support version pinning
  sed -e 's/==/>=/' -i $_pyname-$pkgver/setup.cfg
  sed -e 's/==/>=/g' -i $_pyname-$pkgver/pyproject.toml
  # we don't support post-release and developmental-release
  sed -e 's/\.\(post\|dev\)[0-9]*//' -i $_pyname-$pkgver/setup.cfg
  sed -e 's/\.\(post\|dev\)[0-9]*//' -i $_pyname-$pkgver/pyproject.toml
}

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
