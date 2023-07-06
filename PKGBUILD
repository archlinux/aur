# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_py="python2"
_pkg="prompt_toolkit"
_pkgname="${_pkg}1"
pkgname="${_py}-${_pkgname}"
pkgver=1.0.15
pkgrel=2
pkgdesc="Library for building powerful interactive command lines in Python"
arch=('any')
depends=(
  "${_py}-pygments"
  "${_py}-six"
  "${_py}-wcwidth"
)
makedepends=(
  "${_py}-setuptools"
  "${_py}-pygments"
  "${_py}-six"
  "${_py}-wcwidth"
)
_ns="jonathanslenders"
url="https://github.com/${_ns}/python-prompt-toolkit"
license=('BSD')
options=(!emptydirs)
_pypi_url="https://files.pythonhosted.org/packages/source"
source=(
  "${_pypi_url}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
)
md5sums=(
  '8fe70295006dbc8afedd43e5eba99032'
)
sha256sums=(
  '858588f1983ca497f1cf4ffde01d978a3ea02b01c8a26a8bbc5cd2e66d816917'
)

prepare() {
  cd "${srcdir}"
  cp -r "${_pkg}-${pkgver}" "${pkgname}-${pkgver}"
  # rearrange a bunch of stuff to avoid version conflicts
  cd "${srcdir}/${pkgname}-${pkgver}"
  mv -f "${_pkg}" "${_pkgname}"
  find ./ -type f -exec sed -i -e "s/${_pkg}/${_pkgname}/g" {} \;
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  "${_py}" setup.py build
}

package() {
  depends=(
    "${_py}-pygments"
    "${_py}-six"
    "${_py}-wcwidth"
  )
  cd "${srcdir}/${pkgname}-${pkgver}"
  "${_py}" setup.py install --root="$pkgdir" \
                            --optimize=1
  install -Dm644 LICENSE \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
