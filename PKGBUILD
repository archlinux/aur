# Maintainer: ZorinArch < zorinarch at protonmail dot com >

pkgname=aide-bin
_pkgname=aide
pkgver=1.94.2.24317
pkgrel=1
pkgdesc="The open-source AI-native IDE"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://aide.dev/"
license=('AGPL-3.0')
provides=('aide')
conflicts=('aide')
install=$pkgname.install
# lsof: needed for terminal splitting, see https://github.com/Microsoft/vsaide/issues/62991
# xdg-utils: needed for opening web links with xdg-open
depends=(fontconfig libxtst gtk3 python cairo alsa-lib nss gcc-libs libnotify libxss glibc libxkbfile gnupg libsecret lsof shared-mime-info xdg-utils)
optdepends=('glib2: Needed for move to trash functionality'
            'libdbusmenu-glib: Needed for KDE global menu'
            'org.freedesktop.secrets: Needed for settings sync'
             # See https://github.com/MicrosoftDocs/live-share/issues/4650
            'icu69: Needed for live share' )
source=(aide.desktop
        aide-wayland.desktop
        aide-url-handler.desktop
        aide-workspace.xml
        ${_pkgname}-bin.sh)


sha256sums=('a27c3bde1179b792f5df160b5678342f7273b3784223403065265fa5308ad605'
            'f17ea7d221c79c9eaceaec69c0ca0db12f1b54699869b859a169db8ba5364fc5'
            '0d9408b36d84bd3f76c8f563b39fc4da7264bdc0e06b45f42ac1c9d57a7e24b3'
            '909088d192ceefd04076b17947ec9f3c0ce47f189124c2605c2cc5cfbaca2ee8'
            'be509863d44ae3d19cc37b5e3e53822d4b9950543c705d82cdf0b9815c112149')
source_x86_64=(aide_x64_${pkgver}.tar.gz::https://github.com/codestoryai/binaries/releases/download/${pkgver}/Aide-linux-x64-${pkgver}.tar.gz)
source_aarch64=(aide_arm64_${pkgver}.tar.gz::https://github.com/codestoryai/binaries/releases/download/${pkgver}/Aide-linux-arm64-${pkgver}.tar.gz)
source_armv7h=(aide_armhf_${pkgver}.tar.gz::https://github.com/codestoryai/binaries/releases/download/${pkgver}/Aide-linux-armhf-${pkgver}.tar.gz)
sha256sums_x86_64=("bb38ed9453c8128c76cef502b624a21a2e042ef0e14e07c8d9ec17ce011fcc91")
sha256sums_aarch64=("53cb63a4d37a6f11e6f3d798df7473fbf1ec885218a92c2a64e5a77002710526")
sha256sums_armv7h=("9f245116d5b8c041f9847b506968d90557de4db0d4d8b2374c88778283d121ea")

_pkg() {
  if [ "${CARCH}" = "aarch64" ]; then
    echo 'Aide-linux-arm64'
  elif [ "${CARCH}" = "armv7h" ]; then
    echo 'Aide-linux-armhf'
  elif [ "${CARCH}" = "i686" ]; then
    echo 'Aide-linux-ia32'
  else
    echo 'Aide-linux-x64'
  fi
}


package() {
  _pkg=Aide-linux-x64
  if [ "${CARCH}" = "aarch64" ]; then
    _pkg=Aide-linux-arm64
  fi
  if [ "${CARCH}" = "armv7h" ]; then
    _pkg=Aide-linux-armhf
  fi
  if [ "${CARCH}" = "i686" ]; then
    _pkg=Aide-linux-ia32
  fi

  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"
  install -d "${pkgdir}/usr/share/mime/packages"

  install -m644 "${srcdir}/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -m644 "${srcdir}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -m644 "${srcdir}/aide.desktop" "${pkgdir}/usr/share/applications/aide.desktop"
  install -m644 "${srcdir}/aide-wayland.desktop" "${pkgdir}/usr/share/applications/aide-wayland.desktop"
  install -m644 "${srcdir}/aide-url-handler.desktop" "${pkgdir}/usr/share/applications/aide-url-handler.desktop"
  install -m644 "${srcdir}/aide-workspace.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}-workspace.xml"
  install -Dm 644 "${srcdir}/resources/completions/bash/aide" "${pkgdir}/usr/share/bash-completion/completions/aide"
  install -Dm 644 "${srcdir}/resources/completions/zsh/_aide" "${pkgdir}/usr/share/zsh/site-functions/_aide"

  cp -r "${srcdir}/"* "${pkgdir}/opt/${_pkgname}"

  # Launcher
  install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/aide"

  # Clean Symlinks
  find "${pkgdir}/opt/${_pkgname}/" -type l -delete
}

