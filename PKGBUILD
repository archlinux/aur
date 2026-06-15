# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: László Várady <laszlo.varady93@gmail.com>

pkgname="paho-mqtt-c"
pkgver=1.3.16
pkgrel=1
pkgdesc="Eclipse Paho C Client Library for the MQTT Protocol"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://eclipse.dev/paho/"
_url="https://github.com/eclipse/paho.mqtt.c"
license=(
  'EPL-2.0'
)
depends=(
  'glibc'
  'openssl'
  'util-linux-libs'
)
makedepends=(
  'cmake>=3.12'
  'git'
)
provides=(
  'libpaho-mqtt3a.so'
  'libpaho-mqtt3as.so'
  'libpaho-mqtt3c.so'
  'libpaho-mqtt3cs.so'
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#tag=v${pkgver}?signed"
)
sha256sums=('4274c5ed75e3891973723232173d9f8d96aad551623a1b6dbaa8a9ccfc518252')
validpgpkeys=(
  '0C3CFB4764727BB13196B0ABA7AE1A8F2CCAB186' # Ian Craggs (Github signing) <icraggs@gmail.com>
)

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_C_STANDARD=11
    -D PAHO_WITH_SSL:BOOL=ON
    -D PAHO_WITH_LIBUUID:BOOL=ON
    -D PAHO_BUILD_SAMPLES:BOOL=ON
    -D PAHO_ENABLE_TESTING:BOOL=OFF
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

# check() {
#   local ctest_exclude_regex=""
#   local ctest_options=(
#     --test-dir "${_pkgsrc}/build"
#     --output-on-failure
#     --parallel "$(nproc)"
#     --exclude-regex "${ctest_exclude_regex}"
#   )

#   cd "${srcdir}"
#   ctest "${ctest_options[@]}"
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  # install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgbase}"
}
