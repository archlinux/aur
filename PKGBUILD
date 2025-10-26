# Maintainer: Ryan Steed <ryan.steed.usa@pm.me>
# Contributor: Brian Thompson <brianrobt@pm.me>
# Contributor: Self Denial <selfdenial at pm dot me>

pkgname=openmohaa
pkgver=0.82.1
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
sha256sums=('66b47769afe6d65d5fee46b2e73f8d016806cd48b412adc22cdfdb63200a0c33')

build() {
  local cmake_options=(
    -G Ninja
    -B "${srcdir}/${pkgname}-${pkgver}/build"
    -S "${srcdir}/${pkgname}-${pkgver}"
    -D CMAKE_INSTALL_PREFIX="${pkgdir}/usr/"
    -D TARGET_LOCAL_SYSTEM=1
    -D USE_SYSTEM_LIBS=0
    -D PRODUCT_VERSION_STAGE="${_relstage}"
    -D CMAKE_BUILD_TYPE=None
    -W no-dev
  )

  cmake "${cmake_options[@]}"
}

package() {
  ninja -C "${srcdir}/${pkgname}-${pkgver}/build" install
  # Workaround for inclusion of recastnavigation headers
  # TODO: submit request to fix upstream
  rm -rf "${pkgdir}/usr/include" 
}
