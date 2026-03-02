# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="gurobipy"
_py=3.14
pkgname="python-${_name}"
pkgver=13.0.1
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
  "https://files.pythonhosted.org/packages/cp${_py//./}/${_name::1}/${_name}/${_name//-/_}-${pkgver}-cp${_py//./}-cp${_py//./}-manylinux_2_26_aarch64.whl"
)
source_x86_64=(
  "https://files.pythonhosted.org/packages/cp${_py//./}/${_name::1}/${_name}/${_name//-/_}-${pkgver}-cp${_py//./}-cp${_py//./}-manylinux2014_x86_64.manylinux_2_17_x86_64.whl"
)
noextract=(
  "${source_aarch64[@]##*/}"
  "${source_x86_64[@]##*/}"
)
sha256sums_aarch64=('a8700e549c2667aa235034a6149af16a2138ba7c1f9ecd15b55754704ab6ceaf')
sha256sums_x86_64=('5944820a3278b964f0c48b1ab083a2cc4999f47b99068595574177c0f8973826')

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
  local source_carch="source_${CARCH}[0]"
  local source_arch="${!source_carch}"
  local source_artifact="${source_arch##*/}"

  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "${source_artifact}"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_name}-${pkgver}.dist-info/licenses/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
