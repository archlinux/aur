pkgbase=eim-bin
pkgname=('eim-cli' 'eim-gui')
pkgver=0.16.0
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/espressif/idf-im-ui"
license=('Apache-2.0')
depends=('bison' 'ccache' 'cmake' 'dfu-util' 'flex' 'git' 'gperf' 'libffi' 'libusb' 'openssl' 'python' 'python-pip' 'wget')
makedepends=('unzip')
options=('!strip')

_icon_url="https://raw.githubusercontent.com/espressif/idf-im-ui/master/src-tauri/icons/icon.png"

source=("eim-gui.desktop")
sha256sums=('eb574ade90f636523bb00078df0b92dfd8e289c31f136af257953e689ac84d69')
sha256sums_x86_64=('8e0e71399a13ccf62039fd21e02087b5150a0d58a363c791d1f4fad573b8611e'
                   '05a19e3782494a88f0b0f6a8e016e906c4a6cf1800edbc912164ce0a6625efab'
                   '780e992f87e6622361a1cb54681d4d215d8b2c0232e96f55aaa682b0ee51bc41')
sha256sums_aarch64=('42092a6aad2d383f142e5c6d76faad5abfb945b7b05e8b9daf89f762c8471969'
                    '89984fe3c10d57abc7033ba11b4eb9a40155186d40b8a72f38ea6da97051e3c6'
                    '780e992f87e6622361a1cb54681d4d215d8b2c0232e96f55aaa682b0ee51bc41')
sha256sums_armv7h=('5c37a3c4e53833c23b1f9ae16700262fd70d19a8bc19af54a045c0ae62326cb4')

source_x86_64+=("cli-${pkgver}-x64.zip::${url}/releases/download/v${pkgver}/eim-cli-linux-x64.zip"
                "gui-${pkgver}-x64.zip::${url}/releases/download/v${pkgver}/eim-gui-linux-x64.zip"
                "icon.png::${_icon_url}")
source_aarch64+=("cli-${pkgver}-arm64.zip::${url}/releases/download/v${pkgver}/eim-cli-linux-aarch64.zip"
                 "gui-${pkgver}-arm64.zip::${url}/releases/download/v${pkgver}/eim-gui-linux-aarch64.zip"
                 "icon.png::${_icon_url}")
source_armv7h+=("cli-${pkgver}-armv7.zip::${url}/releases/download/v${pkgver}/eim-cli-linux-armv7.zip")

noextract=("cli-${pkgver}-x64.zip" "gui-${pkgver}-x64.zip" "cli-${pkgver}-arm64.zip" "gui-${pkgver}-arm64.zip" "cli-${pkgver}-armv7.zip")


_install_completions() {
    local _cmd="$1"

    "${pkgdir}/usr/bin/${_cmd}" completions bash > "${_cmd}.bash"
    "${pkgdir}/usr/bin/${_cmd}" completions zsh > "${_cmd}.zsh"
    "${pkgdir}/usr/bin/${_cmd}" completions fish > "${_cmd}.fish"
    "${pkgdir}/usr/bin/${_cmd}" completions elvish > "${_cmd}.elvish"
    "${pkgdir}/usr/bin/${_cmd}" completions powershell > "${_cmd}.ps1"

    install -Dm644 "${_cmd}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}"
    install -Dm644 "${_cmd}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_cmd}"
    install -Dm644 "${_cmd}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_cmd}.fish"
    install -Dm644 "${_cmd}.elvish" "${pkgdir}/usr/share/elvish/lib/${_cmd}.elv"
    install -Dm644 "${_cmd}.ps1" "${pkgdir}/usr/share/powershell/Completions/${_cmd}.ps1"
}

package_eim-cli() {
    pkgdesc="ESP-IDF installation manager (CLI)"
    provides=('eim')
    conflicts=('eim')

    unzip -p cli-*.zip eim > eim-cli
    install -Dm755 eim-cli "${pkgdir}/usr/bin/eim"
    _install_completions eim
}

package_eim-gui() {
    pkgdesc="ESP-IDF installation manager (GUI)"
    provides=('eim-gui')
    conflicts=('eim-gui')
    depends+=('webkit2gtk-4.1')
    arch=('x86_64' 'aarch64')

    unzip -p gui-*.zip eim > eim-gui
    install -Dm755 eim-gui "${pkgdir}/usr/bin/eim-gui"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/eim-gui.png"
    install -Dm644 "${srcdir}/eim-gui.desktop" "${pkgdir}/usr/share/applications/eim-gui.desktop"
}
