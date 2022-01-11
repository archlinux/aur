# Contributor:: Ocelot <1112345@airmail.cc>
_base=censys
pkgname=python-${_base}
pkgdesc="An easy-to-use and lightweight API wrapper for Censys APIs"
pkgver=2.1.1
pkgrel=1
url="https://github.com/${_base}/${_base}-python"
license=(Apache)
arch=("any")
depends=(python-requests python-backoff python-rich)
makedepends=(python-build python-install python-poetry)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('87bc66dc58906ca6032994b453e0a7ffa48e37fb198cf7bc3c424ef9debb938ac8c6d8fe38ddb418322fe4d6b4373be8f1ad11ca1c35a9c0cb2fef8a6659f0ed')

build() {
  cd "${_base}-python-${pkgver}"
  # Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
  # from incorrectly using a parent git checkout info.
  # https://github.com/pypa/build/issues/384#issuecomment-947675975
  GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${_base}-python-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
