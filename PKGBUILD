# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Batuhan Baserdem

_pypiname="matlab_kernel"
pkgname="jupyter-${_pypiname}"
pkgver=0.17.1
pkgrel=2
pkgdesc="A Jupyter kernel for Matlab"
arch=(
  'any'
)
url="https://github.com/Calysto/${_pypiname}"
license=(
  'BSD-3-Clause'
)
depends=(
  'ipython>=4.0.0'
  'jupyter-metakernel>=0.23.0'
  'python'
  'python-jupyter-client>=4.4.0'
  'python-matlabengine'
)
makedepends=(
  'python-wurlitzer>=1.0.2'
)
# checkdepends=(
#   'python-pytest'
# )
provides=(
  "python-${_pypiname}=${pkgver}"
)
conflicts=(
  "python-${_pypiname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "python-${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('e40cfe65eb5e09cb6393a309400107c10ede3ae76fff02db737d52631a2938db')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -P -m pytest
# }

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
