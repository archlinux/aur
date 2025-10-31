# Maintainer: Nick Syntychakis <nsyntych@punkops.dev>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

_pkgname=helium
pkgname="${_pkgname}-bin"
_binaryname=helium
pkgver=0.5.8.1
pkgrel=2
pkgdesc='Private, fast, and honest web browser based on ungoogled-chromium'
arch=(x86_64 aarch64)
url='https://github.com/imputnet/helium-linux'
license=('GPL-3.0-only' 'BSD-3-Clause')
options=('strip')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma'
            'upower: Battery Status API support')
conflicts=('helium-browser-bin' 'helium-browser-appimage')

source=("helium.desktop::https://raw.githubusercontent.com/imputnet/helium-linux/${pkgver}/package/helium.desktop")
source_x86_64=(
    "${_pkgname}.tar.xz::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64_linux.tar.xz"
)
source_aarch64=(
    "${_pkgname}.tar.xz::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_pkgname}-${pkgver}-arm64_linux.tar.xz"
)

sha256sums=('cce8668c18d33077a585cb5d96522e5a02ae017a2baf800f8d7214ce6d05d3d2')
sha256sums_x86_64=('b0e464446600ebf42eeafe8c03e516ae8fb377f6d7883dc0a16e0f80350f5923')
sha256sums_aarch64=('1a3913ac0da3614bec8ce5959fc0fe8be6c5d50484d701fdae6423ef3cd81460')

prepare() {
  # Uniform name regardless of architecture
  mv ${srcdir}/${_pkgname}-${pkgver}-*_linux ${srcdir}/${_pkgname}-${pkgver}

  # Fix .desktop exec
  sed -i \
  -e 's/Exec=chromium/Exec=helium/' \
  "${srcdir}/helium.desktop"

  # Disable user-local desktop generation in chrome-wrapper
  sed -i 's/exists_desktop_file || generate_desktop_file/true/' \
    "${srcdir}/${_pkgname}-${pkgver}/chrome-wrapper"
}

package() {
  # Copy contents to /opt
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a ${srcdir}/${_pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}/
  
  # Copy .desktop file
  install -Dm644 "${srcdir}/helium.desktop" \
    "${pkgdir}/usr/share/applications/${_binaryname}.desktop"
  
  # Copy icons
  install -Dm644 "${pkgdir}/opt/${pkgname}/product_logo_256.png" \
    "${pkgdir}/usr/share/pixmaps/${_binaryname}.png"
  install -Dm644 "${pkgdir}/opt/${pkgname}/product_logo_256.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_binaryname}.png"
  
  # Link to /usr/bin
  chmod 755 "${pkgdir}/opt/${pkgname}/chrome-wrapper"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf /opt/${pkgname}/chrome-wrapper ${pkgdir}/usr/bin/${_binaryname}
}
