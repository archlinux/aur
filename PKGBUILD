# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="gurobipy"
_py=3.13
pkgname="python-${_name}"
pkgver=12.0.3
pkgrel=1
pkgdesc="State-of-the-art solver for mathematical programming (Python bindings)"
arch=('aarch64' 'x86_64')
url="https://www.gurobi.com/products/gurobi-optimizer"
license=('custom:Gurobi EULA')
depends=(
  'glibc'
  "gurobi>=${pkgver}"
  "python>=${_py}"
)
makedepends=(
  'python-installer'
)
source_aarch64=("https://files.pythonhosted.org/packages/cp${_py//./}/${_name::1}/${_name}/${_name//-/_}-${pkgver}-cp${_py//./}-cp${_py//./}-manylinux2014_aarch64.manylinux_2_17_aarch64.whl")
source_x86_64=("https://files.pythonhosted.org/packages/cp${_py//./}/${_name::1}/${_name}/${_name//-/_}-${pkgver}-cp${_py//./}-cp${_py//./}-manylinux2014_x86_64.manylinux_2_17_x86_64.whl")
noextract=("${source_aarch64[@]##*/}"
           "${source_x86_64[@]##*/}")
sha256sums_aarch64=('be05c074141c8a126c8aaeccc41795ab091a666eabb39ca1ff98a74bde81e663')
sha256sums_x86_64=('79a333766e27fef7902ceeefbcf0279a1ca393a27a72ea62f8e301b21aa17d59')

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
  local source_url_var="source_${CARCH}[@]"
  local source_url="${!source_url_var}"
  local wheel_file="${source_url##*/}"

  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "${wheel_file}"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_name}-${pkgver}.dist-info/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
