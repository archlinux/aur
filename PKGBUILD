# Maintainer:  Trần Nam Tuấn <tuantran1632001@gmail.com>
# Contributor: Jona Miller <miller dot jona at yandex dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='headsetcontrol'
_pkgname='HeadsetControl'
pkgver=3.0.0
pkgrel=5
pkgdesc='Sidetone and Battery status for Logitech G930, G533, G633, G933 SteelSeries Arctis 7/PRO 2019 and Corsair VOID (Pro) in Linux and MacOSX '
arch=('x86_64')
url='https://github.com/Sapd/HeadsetControl'
provides=("${pkgname}")
license=('GPL-3.0-only')
depends=('hidapi')
makedepends=('cmake')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz.sig::${url}/releases/download/${pkgver}/${pkgver}.tar.gz.asc"
)
sha256sums=(
  '63bfd147c82277bfcf2314ad2b01ca4e4bf06e1d5516e01ee39232661f4d5144'
  'SKIP'
)
validpgpkeys=(
  '77BEB7E232CF1E5154777D4DD5866C58940197BF' # Denis Arnst <git@sapd.eu>
)

build() {
  # Stop the compiler from treating warnings as error
  sed -i 's/set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Werror")//g' "${_pkgname}-${pkgver}/CMakeLists.txt"

  cmake -B 'build' -S "${_pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev

  # Upstream extract version string from git.
  sed "s/@GIT_VERSION@/${pkgver}/g" "${_pkgname}-${pkgver}/src/version.h.in" > "${_pkgname}-${pkgver}/src/version.h"

  cmake --build 'build'
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dvm644 "${_pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
