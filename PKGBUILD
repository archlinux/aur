# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="array-api-extra"
pkgname="python-${_pypiname}"
pkgver=0.10.1
pkgrel=1
pkgdesc="Extra array functions built on top of the array API standard"
arch=(
  'any'
)
url="https://data-apis.org/array-api-extra"
_url="https://github.com/data-apis/${_pypiname}"
license=(
  'MIT'
)
depends=(
  'python>=3.11'
  'python-array-api-compat>=1.13.0'
)
# checkdepends=(
#   'python-pytest'
#   'python-hypothesis>=6.151.2'
#   'python-array-api-strict>=2.4.1'
#   'python-numpy>=1.22.0'
#   'python-scipy>=1.15.2'
# )
makedepends=(
  'meson-python'
  'python-build'
  'python-installer'
  'python-wheel'
)
optdepends=(
  'python-dask'
  'python-jax'
  'python-pytorch'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "python-${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('b8cca701d504a9d51e8667c6a2c122940a0be2e622311b29d56820000035ff8a')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation -Cbuild-dir=build
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   pytest
# }

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pypiname//-/_}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "${pkgdir}${site_packages}/${_pypiname//-/_}" -type f,d -name '*test*' -exec \
    rm -vrf "{}" +
}
