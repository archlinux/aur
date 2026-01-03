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
pkgver=0.7.9.1
pkgrel=1
pkgdesc="Private, fast, and honest web browser based on Chromium"
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
source=('0001-update-wrapper-arch.patch'
        '0002-align-desktop-entry.patch')
source_x86_64=("${_pkgname}-${pkgver}-x86_64_linux.tar.xz::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64_linux.tar.xz"
               "${_pkgname}-${pkgver}-x86_64_linux.tar.xz.asc::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64_linux.tar.xz.asc"
               "LICENSE.ungoogled_chromium::https://raw.githubusercontent.com/imputnet/helium-linux/${pkgver}/LICENSE.ungoogled_chromium")
source_aarch64=("${_pkgname}-${pkgver}-arm64_linux.tar.xz::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_pkgname}-${pkgver}-arm64_linux.tar.xz"
                "${_pkgname}-${pkgver}-arm64_linux.tar.xz.asc::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_pkgname}-${pkgver}-arm64_linux.tar.xz.asc"
                "LICENSE.ungoogled_chromium::https://raw.githubusercontent.com/imputnet/helium-linux/${pkgver}/LICENSE.ungoogled_chromium")
validpgpkeys=('BE677C1989D35EAB2C5F26C9351601AD01D6378E') # Helium <helium@imput.net>
sha256sums=('3232eb325d4e6ec929d4050e7c44d2976acc82678b544ae459d2da0717b49538'
            '1e9777e8b03cbdba142c29b30b51004492d77043f1f1ccb12f7c1f302e97a7bf')
sha256sums_x86_64=('fcd70bf1a0c0e52d33bee94a70fc33726a18f911decabefc4d9515aaff550236'
                   'SKIP'
                   '9539b394e4179952698894bd62ef6566b6804ab0ff360dcf3a511cfaf7f78c4d')
sha256sums_aarch64=('cef2f444ca261f31eb4e075b24183e1abac73e5b26a71d0886e2a0615816ccf0'
                    'SKIP'
                    '9539b394e4179952698894bd62ef6566b6804ab0ff360dcf3a511cfaf7f78c4d')

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
