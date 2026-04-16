# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

: "${MAKEPKG_MATLAB_PREFIX:=/opt}"
: "${MAKEPKG_MATLAB_ROOT:=${MAKEPKG_MATLAB_PREFIX}/MATLAB}"

pkgbase="matlab-jre-meta"
pkgname=(
  "matlab-jre-common"
)
pkgver=R2026a
pkgrel=1
pkgdesc="A high-level language for numerical computation and visualization"
arch=(
  'any'
)
url="https://www.mathworks.com/support/requirements/openjdk.html"
license=(
  '0BSD'
)
# source=(
#   "matlab-jre-pre.hook"
#   "matlab-jre-post.hook"
#   "matlab-jre-pre.script"
#   "matlab-jre-post.script"
# )
# sha256sums=('13ba69c3da448f58a6d435a711225b98f44525da1219f9695a3ca2eae93f19b4'
#             'b6e9eb3bb93816c681ca20d37faeccf1deb1975d529e7a539422ff5253fe39b7'
#             'c1fbc001d4a94259a76ca826c7c71c8c7977536c51b1d8a85cfe941f0fe4225a'
#             'c52ec7c86b2f13a26de0b9da86516ba665242f6f17f7755bc05773533b6da3e9')

# do not trust the $url too much when you update this array
# the lower limits are inaccurate, the docs do not seem to retire any older JREs
# the upper limits are accurate, except when a specific OpenJDK version is specified
# in any case, check each JRE with each release manually
declare -Ag _jres=(
  # - R2023a: listed in docs, doesn't work in reality
  # - R2023b: listed in docs, doesn't work in reality
  # - R2024a: listed in docs, doesn't work in reality
  # - R2024b: listed in docs, doesn't work in reality
  # - R2025a: listed in docs, doesn't work in reality
  # - R2025b: listed in docs, doesn't work in reality
   [8]='R2020a R2020b R2021a R2021b R2022a R2022b R2026a'

  # - R2024a: listed in docs, doesn't work in reality
  # - R2024b: listed in docs, doesn't work in reality
  # - R2025a: listed in docs, doesn't work in reality
  # - R2025b: listed in docs, doesn't work in reality
  # - R2026a: listed in docs, doesn't work in reality
  [11]='R2023a R2023b'

  [17]='R2024a R2024b R2025a R2025b R2026a'

  # + R2024b: "On Linux, only OpenJDK Java 21.0.2+13-LTS and earlier are supported." (but it works)
  [21]='R2024b R2025a R2025b R2026a'
)

# prepare() {
#   cd "${srcdir}"
#   sed -e "s|@@MAKEPKG_MATLAB_ROOT@@|${MAKEPKG_MATLAB_ROOT}|g" \
#       -e "s|@@MAKEPKG_MATLAB_ROOT_FORWARD@@|${MAKEPKG_MATLAB_ROOT#/}|g" \
#       -i "${source[@]}"
# }

# https://www.mathworks.com/matlabcentral/answers/130360
# https://www.mathworks.com/help/matlab/ref/matlab_jenv.html
package_matlab-jre-common() {
  pkgdesc+=" (JRE, common)"
  depends=(
    'bash'
  )
  # install="${pkgname}.install"

  # cd "${srcdir}"
  # install -vDm644 "matlab-jre-pre.hook"    "${pkgdir}/usr/share/libalpm/hooks/matlab-jre-pre.hook"
  # install -vDm644 "matlab-jre-post.hook"   "${pkgdir}/usr/share/libalpm/hooks/matlab-jre-post.hook"
  # install -vDm755 "matlab-jre-pre.script"  "${pkgdir}/usr/share/libalpm/scripts/matlab-jre-pre"
  # install -vDm755 "matlab-jre-post.script" "${pkgdir}/usr/share/libalpm/scripts/matlab-jre-post"

  # install -vd "${pkgdir}/var/lib/matlab-jre"
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
    'matlab-jre-common>=${pkgver}-${pkgrel}'
    'java-environment=${_jre}'
  )
  provides=(
    ${_provides[@]}
  )
}"
done
