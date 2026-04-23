# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="matlab-mpm-input"
pkgver=R2026a+R2017b
_latest="${pkgver%%+*}"
_oldest="${pkgver#*+}"
pkgrel=1
pkgdesc="MATLAB Package Manager (input files)"
arch=(
  'any'
)
url="https://www.mathworks.com/products/mpm.html"
license=(
  'custom:MATHWORKS CLOUD REFERENCE ARCHITECTURE LICENSE'
)
depends=(
  'matlab-mpm'
)
source=(
  "https://www.mathworks.com/content/dam/mathworks/mathworks-dot-com/products/mpm/mpm-input-files.zip"
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
      "matlab-${_release,,}-mpm-input=${pkgver}"
      "matlab-mpm-input-release=${_release}"
    )
  done
done

pkgver() {
  cd "${srcdir}"
  local releases
  releases=($(bsdtar -tf "${source[0]##*/}" | grep -oP 'r[0-9]{4}[ab]' | sort -u))

  printf '%s+%s' "${releases[-1]/r/R}" "${releases[0]/r/R}"
}

package() {
  cd "${srcdir}"
  for _release in "${_releases[@]}"; do
    install -vDm644 "mpm-input-${_release,,}.txt" \
      "${pkgdir}/usr/share/matlab-mpm/input/${_release}.txt"
  done

  ln -vsf "${_latest}.txt" "${pkgdir}/usr/share/matlab-mpm/input/latest.txt"
}
