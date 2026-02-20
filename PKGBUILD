# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="matlab-mpm-input"
pkgname="${_pkgname}-git"
pkgver=R2025b+r138.gb89b33e
_release="${pkgver%%+*}"
_version="${pkgver#*+}"
pkgrel=1
pkgdesc="MATLAB Package Manager (input files)"
arch=(
  'any'
)
url="https://www.mathworks.com/products/mpm.html"
_url="https://github.com/mathworks-ref-arch/matlab-dockerfile"
license=(
  'custom:MATHWORKS CLOUD REFERENCE ARCHITECTURE LICENSE'
)
depends=(
  'matlab-mpm'
)
makedepends=(
  'git'
)
provides=(
  "${_pkgname}"
  "${_pkgname}-release=${_release}"
  "${_pkgname}-version=${_version}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  local release="$(ls mpm-input-files | sort -V | tail -n1)"
  local commmit="$(git rev-list --count HEAD)"
  local hash="$(git rev-parse --short HEAD)"
  printf '%s+r%s.g%s' "${release}" "${commmit}" "${hash}"
}

package() {
  cd "${srcdir}/${_pkgsrc}/mpm-input-files"
  for rel in *; do
    install -vDm644 "${rel}/mpm_input_${rel,,}.txt" \
      "${pkgdir}/usr/share/matlab-mpm/input/${rel}.txt"
  done

  ln -vsf "${_release}.txt" "${pkgdir}/usr/share/matlab-mpm/input/latest.txt"
}
