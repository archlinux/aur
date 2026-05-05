# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="gurobipy"
pkgname="python-${_pypiname}"
_py=3.14
pkgver=13.0.2
pkgrel=1
pkgdesc="State-of-the-art solver for mathematical programming (Python bindings)"
arch=(
  'aarch64'
  'x86_64'
)
url="https://www.gurobi.com/products/gurobi-optimizer"
license=(
  'custom:Gurobi EULA'
)
depends=(
  'glibc'
  "gurobi>=${pkgver}"
  "python>=${_py}"
)
makedepends=(
  'python-installer'
)
optdepends=(
  'python-numpy: create a new optimization model'
)
source_aarch64=(
  "https://files.pythonhosted.org/packages/cp${_py//./}/${_pypiname::1}/${_pypiname}/${_pypiname//-/_}-${pkgver}-cp${_py//./}-cp${_py//./}-manylinux_2_26_aarch64.whl"
)
source_x86_64=(
  "https://files.pythonhosted.org/packages/cp${_py//./}/${_pypiname::1}/${_pypiname}/${_pypiname//-/_}-${pkgver}-cp${_py//./}-cp${_py//./}-manylinux2014_x86_64.manylinux_2_17_x86_64.whl"
)
noextract=(
  "${source_aarch64[@]##*/}"
  "${source_x86_64[@]##*/}"
)
sha256sums_aarch64=('f7714d69d778af882d756e222340920e8dbfc004a509998604cb9b4cb1d43242')
sha256sums_x86_64=('f82340708955c24ab20f5d41b4d7fbd0e94cf4e7740841360e2024c9d222961f')

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "${source_artifact}"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pypiname}-${pkgver}.dist-info/licenses/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
