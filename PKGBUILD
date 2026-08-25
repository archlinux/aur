# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="gurobipy"
pkgname="python-${_pypiname}"
_py=3.14
pkgver=13.0.3
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
sha256sums_aarch64=('f70a0746a5405f7b0b3b69188a569621c228c90f6dffa26219e47b82dc8f4e89')
sha256sums_x86_64=('c2e87d9fb5297fa260a62666a67f29d8be939027905cda353ca1b62047212e88')

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "${source_artifact}"

  install -vd "${pkgdir}/usr/share/licenses"
  ln -vsf "${site_packages}/${_pypiname}-${pkgver}.dist-info/licenses" \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}
