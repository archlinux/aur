# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>

# shellcheck disable=SC2034
_name="pep517"
_pkgname="python-${_name}"
pkgname="python2-${_name}"
pkgver=0.11.0
pkgrel=2
pkgdesc="Wrappers to build Python packages using PEP 517 hooks"
arch=('any')
license=('MIT')
url="https://github.com/pypa/${_name}"
depends=(
  'python2-toml'
  'python2-importlib-metadata'
  'python2-zipp')
makedepends=('python2-setuptools')
_source_url="https://pypi.io/packages/source"
source=("${_source_url}/p/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=(
  '4981aacef2b7bf86205a93753699c1af557a1af6e33214d8ecc99922ba48988a0cedd0e3194839f790c37b751d6caf3c85fd7538f0e33d15a7c97cf20174e4fd')

prepare() {
  cd "${_name}-${pkgver}" || exit
  # Copied from openSUSE: 
  # Remove what appears to be overly cautious flag
  # that causes tests to require internet, both here
  # and the test suites of any dependencies. Tracking at:
  # https://github.com/pypa/pep517/issues/101
  sed -i "s/ '--ignore-installed',//" pep517/envbuild.py
  sed -i '/--flake8/d' pytest.ini
  cd .. || exit
  cp -a "${_name}-${pkgver}"{,-py2}
}

# shellcheck disable=SC2154
build() {
  cd "${srcdir}/${_name}-${pkgver}-py2" || exit
  python2 setup.py build
}

# shellcheck disable=SC2154
package() {
  cd "${_name}-${pkgver}-py2" || exit
  python2 setup.py install --root="${pkgdir}" \
                           --optimize=1 \
                           --skip-build
  install -Dm644 LICENSE \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
