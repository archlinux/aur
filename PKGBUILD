# Maintainer (since 5.1.8): Vladimir Yakovlev <desktop-app@protonmail.ch>
# Maintainer (before 5.1.8): Oirio Joshi <joshirio@protonmail.com>
# Author: Vladimir Yakovlev <desktop-app@protonmail.ch>

_electron_version=42
_root_relative_src_launcher_file_path=opt/ElectronMail/electron-mail-launcher
_launcher_target_file_name=electron-mail

pkgname=electronmail-bin
pkgver=5.3.8
pkgrel=1
pkgdesc="Unofficial ProtonMail Desktop App"
arch=('x86_64')
url="https://github.com/vladimiry/ElectronMail"
license=('GPL3')
# add libappindicator-sharp to the depends array if you are fine with mono deps
depends=("electron${_electron_version}" 'c-ares' 'ffmpeg' 'gtk3' 'llhttp' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
optdepends=('org.freedesktop.secrets: password storage backend required for auto-login feature'
            'gnome-keyring: for storing passwords in GNOME Keyring')
conflicts=('electronmail')
provides=('electronmail')
install="${pkgname}.install"
source=("https://github.com/vladimiry/ElectronMail/releases/download/v${pkgver}/electron-mail-${pkgver}-linux-x64.pacman"
        "${pkgname}.install"
        "LICENSE")
sha256sums=('eb48bb2f04ed0d3835a4a859edf257b2db78db4196174fe30a900d717007f6e6'
            'a008441fe5eb1095cd657f5eca4ae517c48493a7389e3183131d5f299458843b'
            '1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68')
options=(!debug)

_patch_file() {
    local FILE="$1"
    local SEARCH_PATTERN="$2"
    local REPLACE_PATTERN="$3"
    msg2 "Patching ${FILE} ..."
    if ! grep --quiet --fixed-strings "$SEARCH_PATTERN" "$FILE"; then
        error "Pattern not found in ${FILE} file"
        return 1
    fi
    sed --in-place "s#${SEARCH_PATTERN}#${REPLACE_PATTERN}#" "$FILE"
}

prepare() {
    _patch_file \
        "${srcdir}/${_root_relative_src_launcher_file_path}" \
        "exec '/opt/ElectronMail/electron-mail'" \
        "exec electron${_electron_version} /opt/ElectronMail/resources/app.asar" || return 1
    _patch_file \
        "${srcdir}/usr/share/applications/electron-mail.desktop" \
        "Exec=/${_root_relative_src_launcher_file_path} " \
        "Exec=${_launcher_target_file_name} " || return 1
}

package() {
  cd "${srcdir}"
  
  install -Dm644 opt/ElectronMail/resources/app.asar "${pkgdir}/opt/ElectronMail/resources/app.asar"
  cp --recursive opt/ElectronMail/resources/app.asar.unpacked "${pkgdir}/opt/ElectronMail/resources/"

  # legacy launcher path for backward compatibility
  install -Dm755 "${_root_relative_src_launcher_file_path}" "${pkgdir}/opt/ElectronMail/${_launcher_target_file_name}"
  # new correct launcher path in $PATH
  install -Dm755 "${_root_relative_src_launcher_file_path}" "${pkgdir}/usr/bin/${_launcher_target_file_name}" 

  install -Dm644 usr/share/applications/electron-mail.desktop "${pkgdir}/usr/share/applications/electron-mail.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for icon in usr/share/icons/hicolor/*/apps/*.png; do
    install -Dm644 "${icon}" "${pkgdir}/${icon}"
  done 
}
