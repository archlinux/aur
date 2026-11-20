# Maintainer: Nathan Chere <aur@nathanchere.com.au>
#
# Tries to stay mostly faithful to the stock Vicinae installer with a
# few privacy-focused amendmends:
# - removes telemetry services, UUID/state collection, settings, notices, and forget command
# - replaces update checking/installing with a no-op service (handled via AUR here anyway)
# - removes periodic currency-rate refresh (but maintains manual refresh)
# - preserves user-initiated networking and favicon providers

pkgname=vicinae-private
_appname=vicinae
pkgver=0.30.1
_numenver=0.8.1
_glazever=7.2.0
pkgrel=1
pkgdesc="Privacy-focused Vicinae build without telemetry or background network requests"
arch=('x86_64' 'aarch64')
url="https://github.com/vicinaehq/vicinae"
license=('GPL-3.0-only')
depends=(
  'nodejs'
  'qt6-base'
  'qt6-svg'
  'layer-shell-qt'
  'libqalculate'
  'qtkeychain-qt6'
  'qt6-declarative'
  'qt6-multimedia'
  'syntax-highlighting'
  'cmark-gfm'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'npm'
  'qt6-shadertools'
  'qt6-tools'
  'wayland-protocols'
)
install="${_appname}.install"
provides=("${_appname}=${pkgver}")
conflicts=("${_appname}")
source=(
  "${_appname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "numen-v${_numenver}.tar.gz::https://github.com/vicinaehq/numen/archive/refs/tags/v${_numenver}.tar.gz"
  "glaze-v${_glazever}.tar.gz::https://github.com/stephenberry/glaze/archive/refs/tags/v${_glazever}.tar.gz"
  'disable-background-networking.patch'
  'vicinae.hook'
)
sha256sums=('cbbf86706e36b038ebfd69fda68fa3e0081d520e44cf8663ba05cc122e51ab8a'
            'fc74be7a04ab5387ae13b5618099e1cbdff51c4cbc6a9ff8e570b55248a217ee'
            '17dba19ae63ae48f94994f00d49d5cb3c8f1306db1046c534c4828662490b7d4'
            'cd0bb0a99f408951cc48abb091391908bee4d1b166db27786110bb681e9d0db6'
            '3cc96aa4cc38cf9bfd365feca8ee523e0c47c83a9d3f6f6fef43bed3ec0de209')

prepare() {
  cd "${_appname}-${pkgver}"
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/disable-background-networking.patch"
}

build() {
  cmake -S "${_appname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFETCHCONTENT_SOURCE_DIR_NUMEN="${srcdir}/numen-${_numenver}" \
    -DFETCHCONTENT_SOURCE_DIR_GLAZE="${srcdir}/glaze-${_glazever}" \
    -DUSE_SYSTEM_GLAZE=OFF \
    -DVICINAE_GIT_TAG="v${pkgver}" \
    -DVICINAE_GIT_COMMIT_HASH=archive \
    -DVICINAE_PROVENANCE=aur-private

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  rm -rf "${pkgdir}/usr/include/numen" \
         "${pkgdir}/usr/lib/cmake/numen" \
         "${pkgdir}/usr/lib/libnumen.a"

  install -Dm644 "vicinae.hook" "${pkgdir}/usr/share/libalpm/hooks/vicinae.hook"
}
