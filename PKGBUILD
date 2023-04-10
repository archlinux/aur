# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=monty
pkgname=python-${_base}
pkgdesc="Monty is the missing complement to Python"
pkgver=2023.4.10
pkgrel=1
arch=(x86_64)
url="https://github.com/materialsvirtuallab/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-bson python-pandas python-pydantic python-ruamel-yaml python-tqdm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('530eaf9b73cd92f93e0ac7d04bfd52dae9755badb0eda7bef4021751c89ad1d44b8019fa3e4d076c2cfc7175e9a926df72204082d19f7eeeba5e62db80623a80')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest tests -k 'not reverse_readfile_gz and not Path_objects and not zopen and not zpath'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
