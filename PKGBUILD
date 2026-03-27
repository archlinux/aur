# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="matlab-mpm-input"
pkgver=R2025b+R2017b
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
  "https://www.mathworks.com/content/dam/mathworks/mathworks-dot-com/products/mpm/mpm-input-${_oldest,,}-${_latest,,}.zip"
)
sha256sums=('cd40b0d08ff80efe2d465b6d833387d715a84d25488ac507021a4db0cf20143b')

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

package() {
  cd "${srcdir}"
  for _release in "${_releases[@]}"; do
    install -vDm644 "mpm-input-${_release,,}.txt" \
      "${pkgdir}/usr/share/matlab-mpm/input/${_release}.txt"
  done

  ln -vsf "${_latest}.txt" "${pkgdir}/usr/share/matlab-mpm/input/latest.txt"
}
