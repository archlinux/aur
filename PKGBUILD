# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>

: "${MAKEPKG_MATLAB_PREFIX:=/opt}"
: "${MAKEPKG_MATLAB_ROOT:=${MAKEPKG_MATLAB_PREFIX}/MATLAB}"

_name="matlabengine"
pkgname="python-${_name}"
pkgver=26.1.3a1
pkgrel=1
declare -Ag _releases=(
  ["${pkgver%%.*}.1"]="R20${pkgver%%.*}a"
  ["${pkgver%%.*}.2"]="R20${pkgver%%.*}b"
)
_release="${_releases["${pkgver%.*}"]}"
pkgdesc="A high-level language for numerical computation and visualization (Python bindings)"
arch=(
  'any'
)
url="https://www.mathworks.com/help/matlab/matlab-engine-for-python.html"
_url="https://github.com/mathworks/matlab-engine-for-python"
license=(
  'MIT'
)
depends=(
  "matlab-release>=${_release}"
  'python>=3.9'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools>=42'
  'python-wheel'
)
provides=(
  "${pkgname}-release=${_release}"
  "${pkgname}-${_release,,}=${pkgver}"
)
conflicts=(
  "${pkgname}-${_release,,}"
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
  "${pkgname}_python3.12_syntax_warning.patch::${_url}/pull/55.patch?full_index=1"
)
b2sums=('6df13dad063d481f36f466bf7ee0aba1a6a8a57c9162a01ade426bc35b344ea4270e4d54f8775e16b68af9a463572d6406e10015f68f8c5215c70394c56ec054'
        'cd5b04e6b6216728ff91151d41444b294bbe5ca22feadd2bf0ed3acd32fb2428416d3685ccf50b9cb875230740479358b0347da16eb6a0c3a0e64f4b109ea670')

prepare() {
  local python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"

  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_python3.12_syntax_warning.patch"

  sed -e "s|3.13|${python_version}|g" \
      -e "s|/usr/local/MATLAB|${MAKEPKG_MATLAB_ROOT}|g" \
      -i 'setup.py'
}

build() {
  # export LD_LIBRARY_PATH="${MAKEPKG_MATLAB_ROOT}/${_release}/bin/glnxa64:${LD_LIBRARY_PATH}"

  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_name}-${pkgver%a*}.dist-info/licenses/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
