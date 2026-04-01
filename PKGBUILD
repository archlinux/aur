# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="matlab-jre-meta"
# pkgname=(
#   "matlab-jre-common"
# )
pkgver=R2025b
pkgrel=3
pkgdesc="A high-level language for numerical computation and visualization"
arch=(
  'any'
)
url="https://www.mathworks.com/support/requirements/openjdk.html"
license=(
  '0BSD'
)
# source=(
#   "matlab-jre.hook"
#   "matlab-jre.script"
# )
# sha256sums=('5e5ad2f0ebacfbc080ad612e437025d27df89f8513ab7f2968529689b8a8fb0a'
#             '404c338694d64b193e23dc5ab2dd866312d0bed5637855e8daf9ad6bdc6dce7b')

# do not trust the $url too much when you update this array
# the lower limits are inaccurate, the docs do not seem to retire any older JREs
# the upper limits are accurate, except when a specific OpenJDK version is specified
# in any case, check each JRE manually
declare -Ag _jres=(
  # - R2023a: listed in docs, doesn't work in reality
  # - R2023b: listed in docs, doesn't work in reality
  # - R2024a: listed in docs, doesn't work in reality
  # - R2024b: listed in docs, doesn't work in reality
  # - R2025a: listed in docs, doesn't work in reality
  # - R2025b: listed in docs, doesn't work in reality
   [8]='R2020a R2020b R2021a R2021b R2022a R2022b'

  # - R2024a: listed in docs, doesn't work in reality
  # - R2024b: listed in docs, doesn't work in reality
  # - R2025a: listed in docs, doesn't work in reality
  # - R2025b: listed in docs, doesn't work in reality
  [11]='R2023a R2023b'

  [17]='R2024a R2024b R2025a R2025b'

  # + R2024b: "On Linux, only OpenJDK Java 21.0.2+13-LTS and earlier are supported." (but it works)
  [21]='R2024b R2025a R2025b'
)

package_matlab-jre-common() {
  pkgdesc+=" (JRE, common)"
  depends=(
    'sh'
  )

  cd "${srcdir}"
  install -vDm644 "matlab-jre.hook"   "${pkgdir}/usr/share/libalpm/hooks/matlab-jre"
  install -vDm755 "matlab-jre.script" "${pkgdir}/usr/share/libalpm/scripts/matlab-jre"
}

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
    # 'matlab-jre-common>=${pkgver}-${pkgrel}'
    'java-environment=${_jre}'
  )
  provides=(
    ${_provides[@]}
  )
}"
done
