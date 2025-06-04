# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pooch
pkgname=pypy3-${_base}
pkgdesc="A friend to fetch your data files"
pkgver=1.8.2
pkgrel=1
arch=(any)
url="https://github.com/fatiando/${_base}"
license=(BSD-3-Clause)
depends=(pypy3-platformdirs pypy3-packaging pypy3-requests)
makedepends=(pypy3-build pypy3-installer pypy3-setuptools-scm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  fixwheel.patch::${url}/commit/96bd5437.patch)
sha512sums=('7110811103c36de75542280b7cd4f0c2148786c0e455a4465fdf8eb96640043ca1c6daa638755c2ad5cf9be0dbe89e646417a75e52321f199ae2b55e8960a4bc'
            '7f1740da65438c3858357096dd866a33a1aafb266e98dc8b33e8b9167d4775ad770661c2b4308c38277b459ad05e1f26803d3ddd002e914e1f136725ff7bd96e')

prepare() {
  cd ${_base}-${pkgver}
  patch -p1 -i ../fixwheel.patch # Exclude doc dir from wheel
}

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
