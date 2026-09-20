# Maintainer: nanomatters
# Maintainer (AUR): voron00

pkgname=proton-wineland
_srctag=11.0-20260917
pkgver=${_srctag//-/.}
pkgrel=1
epoch=1

_package_name="proton-wineland-${_srctag}-x86_64"
source=(
  https://github.com/nanomatters/proton-cachyos/releases/download/wineland-${_srctag}/${_package_name}.tar.xz
  compatibilitytool.vdf.template
)

pkgdesc="An unofficial fork of proton-cachyos with further improvements and wayland enhancements"
url="https://github.com/nanomatters/proton-cachyos"
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
  gdk-pixbuf2
  glibc
  hicolor-icon-theme
  libgcc
  libxcrypt
  libxcrypt-compat
  libxkbcommon-x11
  lsb-release
  lsof
  ntsync-autoload
  nss
  python
  ttf-font
  usbutils
  vulkan-driver
  vulkan-icd-loader
  xdg-user-dirs
  xorg-xrandr
  xz
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
makedepends=(
  rsync
)
optdepends=(
  steam
  umu-launcher
)
provides=('proton-wineland' 'proton')
replaces=('proton-wineland')
backup=(
  "usr/share/steam/compatibilitytools.d/${pkgname}/user_settings.py"
)
install=${pkgname}.install

build() {
    cd "${_package_name}"
    sed -r \
      -e "s|##INSTALL_PATH##|.|" \
      -e "s|##DISPLAY_NAME##|proton-wineland-${_srctag}|" \
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

sha256sums=('033ecd4ce3e4ab841cb6f3c4a496ea959628533c2da7efe78b0a6dbaa3220c5f'
            '6983622dc08784891929b843e8c5bf566c160eb2c23b7fc89c0f4dbabcd5db69')
