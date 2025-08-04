# Maintainer: Brian Thompson <brianrobt@pm.me>
# Maintainer: Self Denial <selfdenial at pm dot me>

pkgname=openmohaa
pkgver=0.82.0
pkgrel=2
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
sha256sums=('e616f1ac5668153b0397ece8554b7dd79f2f72f35fa2d64f022bd20a86bf2fba')

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