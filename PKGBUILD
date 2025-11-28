# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=proton-cachyos-slr
_srctag=10.0-20251126
pkgver=${_srctag//-/.}
pkgrel=1
epoch=1

_package_name="proton-cachyos-${_srctag}-slr-x86_64"
sha256sums=('570ee8a2d0cc5e6ebc481d851f88261421a336e9820b8e47d46b35ebabf685ca'
            'a233ef8e1d68c0475dc7699143cc9a6cc1d95fa80c70e8ae924075a207841964')
source=(
  https://github.com/CachyOS/proton-cachyos/releases/download/cachyos-${_srctag}-slr/${_package_name}.tar.xz
  compatibilitytool.vdf.template
)

pkgdesc="A compatibility tool for Steam Play based on Wine and additional components, experimental branch with extra CachyOS flavour (Steam Linux Runtime build)"
url="https://github.com/CachyOS/proton-cachyos"
arch=(x86_64 x86_64_v3)
options=(!strip emptydirs)
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
depends=(
  bash
  coreutils
  curl
  dbus
  desktop-file-utils
  diffutils
  freetype2
  gcc-libs
  gdk-pixbuf2
  glibc
  hicolor-icon-theme
  libxcrypt
  libxcrypt-compat
  libxkbcommon-x11
  lsb-release
  lsof
  nss
  python
  ttf-font
  usbutils
  vulkan-driver
  vulkan-icd-loader
  xdg-user-dirs
  xorg-xrandr
  xz
  zenity
)
depends_x86_64=(
  lib32-alsa-plugins
  lib32-fontconfig
  lib32-gcc-libs
  lib32-glibc
  lib32-libgl
  lib32-libgpg-error
  lib32-libnm
  lib32-libva
  lib32-libx11
  lib32-libxcrypt
  lib32-libxcrypt-compat
  lib32-libxinerama
  lib32-libxss
  lib32-nss
  lib32-pipewire
  lib32-systemd
  lib32-vulkan-driver
  lib32-vulkan-icd-loader
)
makedepends=(rsync)
optdepends=(
  steam
  umu-launcher
)
optdepends+=(
  ntsync-common
  NTSYNC-MODULE
)
provides=('proton')
install=${pkgname}.install

build() {
    cd "${_package_name}"
    sed -r \
      -e "s|##BUILD_NAME##|proton-cachyos-${_srctag} (steam linux runtime)|" \
      -e "s|##INTERNAL_TOOL_NAME##|${pkgname}|" \
      "${srcdir}/compatibilitytool.vdf.template" > compatibilitytool.vdf
}

package() {
    local _compatdir="${pkgdir}/usr/share/steam/compatibilitytools.d"
    mkdir -p "${_compatdir}/${pkgname}"
    rsync --delete -arx "${_package_name}"/* "${_compatdir}/${pkgname}"

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${_compatdir}/${pkgname}"/{PATENTS.AV1,LICENSE{,.OFL}} \
        "${pkgdir}/usr/share/licenses/${pkgname}"
}

