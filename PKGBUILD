# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="matlab-jre-meta"
pkgver=R2025b
pkgrel=2
pkgdesc="A high-level language for numerical computation and visualization"
arch=(
  'any'
)
url="https://www.mathworks.com/support/requirements/openjdk.html"
license=(
  '0BSD'
)

declare -Ag _jres=(
   [8]='R2020a R2020b R2021a R2021b R2022a R2022b R2023a R2023b R2024a R2024b R2025a R2025b'
  [11]='R2023a R2023b R2024a R2024b R2025a R2025b'
  [17]='R2024a R2024b R2025a R2025b'
  [21]='R2025a R2025b' # R2024b excluded: On Linux, only OpenJDK Java 21.0.2+13-LTS and earlier are supported.
)

for _jre in "${!_jres[@]}"; do
  pkgname+=(
    "${pkgbase/jre/"jre${_jre}"}"
  )

  local _provides=()
  for _release in ${_jres[${_jre}]}; do
    _provides+=(
      "matlab-${_release,,}-jre-meta=${pkgver}"
      "matlab-${_release,,}-jre=${pkgver}"
    )

    if [[ "${_release}" == "${pkgver}" ]]; then
      _provides+=(
        "matlab-jre-meta=${pkgver}"
        "matlab-jre=${pkgver}"
      )
    fi
  done

  eval "
package_${pkgbase/jre/"jre${_jre}"}() {
  pkgdesc+=' (JRE${_jre}, meta)'
  depends=(
    'java-environment=${_jre}'
  )
  provides=(
    ${_provides[@]}
  )
}"
done
