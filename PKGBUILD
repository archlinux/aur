# Maintainer: onurmercury <onurmercury at proton dot me>
# Contributor: Christian Heusel <christian@heusel.eu>
# Contributor: Knut Ahlers <knut at ahlers dot me>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: t3ddy, Lex Rivera aka x-demon, ruario

# Releases and details about builds can be found at:
# https://github.com/RobRich999/Chromium_Clang
#
# Check the latest release:
# curl -sf https://api.github.com/repos/RobRich999/Chromium_Clang/releases | grep -om1 '"tag_name": *"[^"]*-linux64-deb-avx"' | awk -F'"' '{print $4}'
#
# Based on aur/google-chrome-dev

_pkgname=chromium-unstable
_debname=chromium-browser-unstable
_pkgver=v122.0.6215.0-r1241500-linux64-deb-avx

pkgname="${_pkgname}-bin"
pkgver=122.0.6215.0
pkgrel=1
pkgdesc="The Chromium web browser for Linux built with the open source Clang compiler and LLD linker."
arch=('x86_64')
url="https://www.chromium.org/Home"
license=('BSD' 'custom:Widevine')
depends=('alsa-lib'
         'at-spi2-core'
         'ca-certificates'
         'cairo'
         'curl'
         'dbus'
         'expat'
         'glibc'
         'gtk3'
         'libcups'
         'libdrm'
         'libx11'
         'libxcb'
         'libxcomposite'
         'libxdamage'
         'libxext'
         'libxfixes'
         'libxkbcommon'
         'libxrandr'
         'mesa'
         'nspr'
         'nss'
         'pango'
         'ttf-liberation'
         'vulkan-icd-loader'
         'wget'
         'xdg-utils')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'org.freedesktop.secrets: password storage backend on GNOME / Plasma / Xfce')
conflicts=("${_debname}")
provides=("${_debname}")
options=('!emptydirs' '!strip')
install=${_pkgname}.install
source=("${_pkgname}_${_pkgver}.deb::https://github.com/RobRich999/Chromium_Clang/releases/download/${_pkgver}/${_debname}_${pkgver}-1_amd64.deb"
        "allow-user-flags.patch")
sha1sums=('09985aac8ad7b69fbead890f2b3e378f31c8f027'
          'dd5c9032644b703aba5cf7c9e6766decb66989f7')

package() {
  # Extract the archive
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  # Modify the startup script to allow user flags
  patch -Np1 -d "${pkgdir}" -i "${srcdir}/allow-user-flags.patch"

  # Install icons
  for i in 16 24 32 48 64 128 256; do
    install -Dm644 "${pkgdir}/opt/chromium.org/${_pkgname}/product_logo_${i}.png" \
    "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_debname}.png"
  done

  # Remove the Cron job, duplicate product logos and menu directory
  rm -r \
    "${pkgdir}/etc/cron.daily/" \
    "${pkgdir}/opt/chromium.org/${_pkgname}/cron/" \
    "${pkgdir}/opt/chromium.org/${_pkgname}/"product_logo_*.{png,xpm} \
    "${pkgdir}/usr/share/menu/"
}
