# Maintainer: Brian Thompson <brianrobt@pm.me>
# Maintainer: Self Denial <selfdenial at pm dot me>

pkgname=openmohaa
pkgver=0.82.1
pkgrel=1
pkgdesc="Open re-implementation of Medal of Honor: Allied Assault "
arch=('i686' 'x86_64')
url="https://github.com/openmoh/openmohaa"
license=('GPL-2.0-only')
depends=(
  'openal'
  'sdl2'
  'openjpeg2'
  'libmad'
  'hicolor-icon-theme'
)
makedepends=(
  'cmake'
  'ninja'
)
_relstage="beta"
options=(!debug !lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openmoh/openmohaa/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('66b47769afe6d65d5fee46b2e73f8d016806cd48b412adc22cdfdb63200a0c33')

build() {
  local cmake_options=(
    -G Ninja
    -B "${srcdir}/${pkgname}-${pkgver}/build"
    -S "${srcdir}/${pkgname}-${pkgver}"
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/"
    -DTARGET_LOCAL_SYSTEM=1
    -DUSE_SYSTEM_LIBS=0
    -DPRODUCT_VERSION_STAGE="${_relstage}"
    -DCMAKE_BUILD_TYPE='None'
    # TODO: Remove this temporary option once a new release
    # is available; it's required by CMake 4.
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -Wno-dev
  )

  cmake "${cmake_options[@]}"
}

package() {
  ninja -C "${srcdir}/${pkgname}-${pkgver}/build" install
}
