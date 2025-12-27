# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=proton-cachyos-slr
_srctag=10.0-20251222
pkgver=${_srctag//-/.}
pkgrel=1
epoch=1

_package_name="proton-cachyos-${_srctag}-slr-x86_64"
sha256sums=('5bb702e298bc5840f8ace1176155c88a8d6d89436f02bceab1397ac4ac32fe66'
            '6983622dc08784891929b843e8c5bf566c160eb2c23b7fc89c0f4dbabcd5db69')
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

package() {

    local _compatdir="${pkgdir}/usr/share/steam/compatibilitytools.d"
    mkdir -p "${_compatdir}"
    sed -r \
      -e "s|##INSTALL_PATH##|/opt/${pkgname}|" \
      -e "s|##DISPLAY_NAME##|proton-cachyos-${_srctag} (steam linux runtime)|" \
      -e "s|##INTERNAL_TOOL_NAME##|${pkgname}|" \
      "${srcdir}/compatibilitytool.vdf.template" > "${_compatdir}/${pkgname}.vdf"

    local _installdir="${pkgdir}/opt/"
    mkdir -p "${_installdir}/${pkgname}"
    rsync --delete -arx "${_package_name}"/* "${_installdir}/${pkgname}"

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${_installdir}/${pkgname}"/{PATENTS.AV1,LICENSE{,.OFL}} \
        "${pkgdir}/usr/share/licenses/${pkgname}"
}

