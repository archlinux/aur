# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="matlab-mpm-input"
pkgname="${_pkgname}-git"
pkgver=R2025b+r140.g202d7af+R2017b
_latest="${pkgver%%+*}"
_oldest="${pkgver##*+}"
_pkgver="${_latest}+${_oldest}"
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
  "${_pkgname}=${_pkgver}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git"
)
sha256sums=('SKIP')

_releases=()
for ((_year="${_oldest:1:4}"; _year<="${_latest:1:4}"; _year++)); do
  for _suffix in a b; do
    local _release="R${_year}${_suffix}"

    # skip versions before oldest
    [[ "${_release}" < "${_oldest}" ]] && continue
    # stop after latest
    [[ "${_release}" > "${_latest}" ]] && break 2

    _releases+=(
      "${_release}"
    )
    provides+=(
      "matlab-${_release,,}-mpm-input=${_pkgver}"
      "matlab-mpm-input-release=${_release}"
    )
  done
done

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  local latest="$(ls mpm-input-files | sort -V | tail -n1)"
  local commmit="$(git rev-list --count HEAD)"
  local hash="$(git rev-parse --short HEAD)"
  local oldest="$(ls mpm-input-files | sort -V | head -n1)"
  printf '%s+r%s.g%s+%s' "${latest}" "${commmit}" "${hash}" "${oldest}"
}

package() {
  cd "${srcdir}/${_pkgsrc}/mpm-input-files"
  for _release in "${_releases[@]}"; do
    install -vDm644 "${_release}/mpm_input_${_release,,}.txt" \
      "${pkgdir}/usr/share/matlab-mpm/input/${_release}.txt"
  done

  ln -vsf "${_latest}.txt" "${pkgdir}/usr/share/matlab-mpm/input/latest.txt"
}
