# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="smolrtsp"
pkgver=0.1.3
pkgrel=1
pkgdesc="A lightweight real-time streaming library for IP cameras"
arch=(
  'x86_64'
)
url="https://openipc.github.io/smolrtsp/"
_url="https://github.com/openipc/${pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
)
makedepends=(
  'cmake>=3.16'
  'datatype99'
  'interface99'
  'slice99'
)
optdepends=(
  'datatype99'
  'interface99'
  'slice99'
)
# provides=(
#   "lib${pkgname}.so"
# )
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('cc4376569b687e03385664584b57697076e6772a1c52de2d24389014e016ad1e')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -E -e '/FetchContent_Declare\(/{:a;N;/\)/!ba;d;}' \
         -e '/FetchContent/d' \
         -e '/target_link_libraries/d' \
         -i 'CMakeLists.txt'
}

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D SMOLRTSP_SHARED:BOOL=ON
  )
 
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

check() {
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  cd "${srcdir}/${_pkgsrc}"
  ./scripts/test.sh
}

package() {
  cd "${srcdir}"
  # DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"
  
  cd "${_pkgsrc}"
  install -vd "${pkgdir}/usr"
  cp -va --no-preserve=ownership "include" -t "${pkgdir}/usr"

  install -vDm644 "CHANGELOG.md" "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "build"
  # install -vDm644 "lib${pkgname}.so" "${pkgdir}/usr/lib/lib${pkgname}.so.${pkgver%%+*}"
  install -vDm644 "lib${pkgname}.so" "${pkgdir}/usr/lib/lib${pkgname}.so"

  # cd "${pkgdir}/usr/lib"
  # for lib in lib*.so.*; do
  #   ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*.[0-9]*}"
  #   ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*}"
  # done
}
