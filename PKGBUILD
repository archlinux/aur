# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="gurobipy"
_py=3.13
pkgname="python-${_name}"
pkgver=12.0.2
pkgrel=1
pkgdesc="State-of-the-art solver for mathematical programming (Python bindings)"
arch=('aarch64' 'x86_64')
url="https://www.gurobi.com/products/gurobi-optimizer"
license=('custom:Gurobi EULA')
depends=('glibc' "gurobi>=${pkgver}" "python>=${_py}") # 'python-numpy' 'python-scipy'
makedepends=('python-installer' 'python-wheel')
source_aarch64=("https://files.pythonhosted.org/packages/cp${_py//./}/${_name::1}/${_name}/${_name//-/_}-${pkgver}-cp${_py//./}-cp${_py//./}-manylinux2014_aarch64.manylinux_2_17_aarch64.whl")
source_x86_64=("https://files.pythonhosted.org/packages/cp${_py//./}/${_name::1}/${_name}/${_name//-/_}-${pkgver}-cp${_py//./}-cp${_py//./}-manylinux2014_x86_64.manylinux_2_17_x86_64.whl")
noextract=("${source_aarch64[@]##*/}"
           "${source_x86_64[@]##*/}")
sha256sums_aarch64=('b3caebef6a7c6ba23559872ab73dcd8040c7156ef80cde0b59118bbdfd24e779')
sha256sums_x86_64=('240aab60fcfbfe586f456d6ecbcc8eca3b5aa5ffe717e6a08c41c82964026137')

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
