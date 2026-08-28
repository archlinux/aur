# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="array-api-extra"
pkgname="python-${_pypiname}"
pkgver=0.11.2
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
  'python-array-api-compat>=1.15.0'
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
sha256sums=('91c0f98f2118efdf1140a8d8c51bfaf37e1f71ffa4700a125e35c4679a4ddfa6')

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

  install -vd "${pkgdir}/usr/share/licenses"
  ln -vsf "${site_packages}/${_pypiname//-/_}-${pkgver}.dist-info/licenses" \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}
