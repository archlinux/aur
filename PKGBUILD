# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="jupyter-matlab-proxy"
pkgver=0.18.0
pkgrel=1
pkgdesc="Run MATLAB® code in Jupyter® environments such as Jupyter notebooks, JupyterLab, and JupyterHub"
arch=(
  'any'
)
url="https://github.com/mathworks/${pkgname}"
license=(
  'custom:MATHWORKS CLOUD REFERENCE ARCHITECTURE LICENSE'
)
depends=(
  'jupyter-notebook'
  'jupyter-server'
  'python>=3.10'
  'python-aiohttp'
  'python-ipykernel>=6.0.3'
  'python-jupyter-client'
  'python-jupyter-server-proxy>=4.1.0'
  'matlab-proxy>=0.30.0'
  'python-psutil'
  'python-requests'
)
# checkdepends=(
#   'python-pytest'
#   'python-jupyter_kernel_test'
# )
makedepends=(
  'jupyterlab>=4.0.0'
  'python-build'
  'python-installer'
  'python-hatch-nodejs-version>=0.3.2'
  'python-hatchling>=1.5.0'
)
provides=(
  "python-${pkgname}=${pkgver}"
)
conflicts=(
  "python-${pkgname}"
)
_pkgsrc="${url##*/}-${pkgname}-v${pkgver}"
source=(
  "${url}/archive/refs/tags/${pkgname}-v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('de06c65ce2f2b616a21157a658773dcc873680d8a54a47e034636aee5fe835e5')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i 's|"jupyterlab>=4.0.0,<5", ||g' pyproject.toml
}

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

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${pkgname//-/_}-${pkgver}.dist-info/licenses/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
