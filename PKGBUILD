# Maintainer: Sam Sinclair <sam at playleft dot com>
# Contributor: Pujan Modha <pujan.pm@hotmail.com>
# Contributor: init_harsh
# /*
#  * SPDX-FileCopyrightText: 2025 Arch Linux Contributors
#  *
#  * SPDX-License-Identifier: 0BSD
#  */
_pkgname="helium"
pkgname="${_pkgname}-browser-bin"
_binaryname="helium-browser"
pkgver=0.8.2.1
pkgrel=1
pkgdesc="Private, fast, and honest web browser based on Chromium (Latest/Stable)"
arch=('x86_64' 'aarch64')
url="https://github.com/imputnet/helium-linux"
license=('GPL-3.0-only AND BSD-3-Clause')
options=('!strip')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma'
            'upower: Battery Status API support')
conflicts=('helium-browser-beta-bin')
provides=("helium-browser-beta-bin=${pkgver}")
source=('0001-update-wrapper-arch.patch'
        '0002-align-desktop-entry.patch'
        "LICENSE.ungoogled_chromium::https://raw.githubusercontent.com/imputnet/helium-linux/${pkgver}/LICENSE.ungoogled_chromium")
source_x86_64=("${_pkgname}-${pkgver}-x86_64_linux.tar.xz::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64_linux.tar.xz"
               "${_pkgname}-${pkgver}-x86_64_linux.tar.xz.asc::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64_linux.tar.xz.asc")
source_aarch64=("${_pkgname}-${pkgver}-arm64_linux.tar.xz::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_pkgname}-${pkgver}-arm64_linux.tar.xz"
                "${_pkgname}-${pkgver}-arm64_linux.tar.xz.asc::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_pkgname}-${pkgver}-arm64_linux.tar.xz.asc")
validpgpkeys=('BE677C1989D35EAB2C5F26C9351601AD01D6378E') # Helium <helium@imput.net>
sha256sums=('2ac1e9206c715318a69adcc99c5b79d876f8a4800590c8e79de97170f8a15fc0'
            '1e9777e8b03cbdba142c29b30b51004492d77043f1f1ccb12f7c1f302e97a7bf'
            '9539b394e4179952698894bd62ef6566b6804ab0ff360dcf3a511cfaf7f78c4d')
sha256sums_x86_64=('8658cbeca95a7c3d5360f980f94f0745d5ca39476c6fa2e79385e20187e63c8f'
                   'SKIP')
sha256sums_aarch64=('ca61109d508064df525c87152c4b7a90d92467b512634a8123d3351ec064aeb5'
                    'SKIP')
prepare() {
  # Get architecture specific directory
  _archdir="${_pkgname}-${pkgver}-$([[ $CARCH == "aarch64" ]] && echo "arm64" || echo "x86_64")_linux"
  # Patch bundled wrapper for Arch Linux
  patch -d "${srcdir}/${_archdir}" -p1 -i "${srcdir}/0001-update-wrapper-arch.patch"
  # Patch bundled .desktop file to use "helium-browser"
  patch -d "${srcdir}/${_archdir}" -p1 -i "${srcdir}/0002-align-desktop-entry.patch"
}
package() {
  # Get architecture specific directory
  _archdir="${_pkgname}-${pkgver}-$([[ $CARCH == "aarch64" ]] && echo "arm64" || echo "x86_64")_linux"
  # Install Helium
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/${_archdir}/"* "${pkgdir}/opt/${pkgname}/"
  # Install .desktop file
  install -Dm644 "${srcdir}/${_archdir}/helium.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  # Install icon for desktop file
  install -Dm644 "${pkgdir}/opt/${pkgname}/product_logo_256.png" \
    "${pkgdir}/usr/share/pixmaps/${_binaryname}.png"
  install -Dm644 "${pkgdir}/opt/${pkgname}/product_logo_256.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_binaryname}.png"
  # Install Ungoogled Chromium license
  install -Dm644 "${srcdir}/LICENSE.ungoogled_chromium" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.ungoogled_chromium"
  # Symlink the wrapper
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/helium-wrapper" "${pkgdir}/usr/bin/${_binaryname}"
}
