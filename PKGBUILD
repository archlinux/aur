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
pkgver=0.27.0
_numenver=0.4.1
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
  'syntax-highlighting'
)
makedepends=(
  'cmake'
  'ninja'
  'npm'
  'glaze'
  'qt6-shadertools'
  'qt6-tools'
  'wayland-protocols'
  'cmark-gfm'
)
install="${_appname}.install"
provides=("${_appname}=${pkgver}")
conflicts=("${_appname}")
source=(
  "${_appname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "numen-v${_numenver}.tar.gz::https://github.com/vicinaehq/numen/archive/refs/tags/v${_numenver}.tar.gz"
  'disable-background-networking.patch'
  'vicinae.hook'
)
sha256sums=('9332752a6f2306d4a178ba5fd6ce149d21f64e90d0e0f853c6b3c335db9d3299'
            '0f758ba7a3306c214a5c1e7c5e35b3624f3a3d7361fdbfe36665d1088a9457f7'
            'a40171400f424e0f4b53cadc533abae02c5fabee3948b4380b34ea7700fd263e'
            '3cc96aa4cc38cf9bfd365feca8ee523e0c47c83a9d3f6f6fef43bed3ec0de209')

prepare() {
  cd "${_appname}-${pkgver}"
  patch -Np1 -i "${srcdir}/disable-background-networking.patch"
}

build() {
  cmake -S "${_appname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFETCHCONTENT_SOURCE_DIR_NUMEN="${srcdir}/numen-${_numenver}" \
    -DUSE_SYSTEM_GLAZE=ON \
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
