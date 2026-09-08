# Maintainer: 7White <sevenwhite10@gmail.com>

pkgname=netcatty-bin
_pkgname=netcatty
pkgver=1.1.83
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

sha256sums_x86_64=('a23977929d56808777eea8f4ea768445ae3bfb292ca53d4a345a66df14e9495c')
sha256sums_aarch64=('b8217ba0d0053bfb22e501c358402a012c2f881f59b3c645a7daaa2aeed5c90c')

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
