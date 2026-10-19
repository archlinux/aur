# Maintainer: 7White <sevenwhite10@gmail.com>

pkgname=netcatty-bin
_pkgname=netcatty
pkgver=1.1.85
pkgrel=1
pkgdesc='AI-Powered SSH Client, SFTP Browser & Terminal Manager'
arch=('x86_64' 'aarch64')
url='https://github.com/binaricat/Netcatty'
license=('GPL-3.0-or-later')
depends=(
    'alsa-lib'
    'cups'
    'gtk3'
    'libnotify'
    'libsecret'
    'libxkbcommon'
    'libxss'
    'nss'
)
optdepends=(
    'libappindicator: system tray icon support'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')

source_x86_64=("${_pkgname}-${pkgver}-x86_64.pacman::https://github.com/binaricat/Netcatty/releases/download/v${pkgver}/Netcatty-${pkgver}-linux-x64.pacman")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.pacman::https://github.com/binaricat/Netcatty/releases/download/v${pkgver}/Netcatty-${pkgver}-linux-aarch64.pacman")

sha256sums_x86_64=('1ae333ba086717da5ea2148aa00e8a23bc65c2a9d76da52bd73f3711e2c81566')
sha256sums_aarch64=('63620b636a40a1657f4a519b03171791fa7ed172b874e298ea9240b7ad8fc010')

package() {
    bsdtar -xf "${_pkgname}-${pkgver}-"*.pacman -C "${pkgdir}" \
        --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.MTREE'

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf /opt/Netcatty/netcatty "${pkgdir}/usr/bin/${_pkgname}"

    chmod 4755 "${pkgdir}/opt/Netcatty/chrome-sandbox"

    sed -i \
        -e 's|^Categories=.*|Categories=Development;Network;System;TerminalEmulator;|' \
        -e '/^StartupNotify=/d' \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    printf 'StartupNotify=true\nKeywords=SSH;SFTP;Terminal;AI;\n' >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
