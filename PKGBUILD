# Maintainer: logan_reed <liulingzhang.work@icloud.com>

_upstream=ZCode
# pkgver 取 deb 头部 dpkg 权威版本归一化（3.14.0-7681 → 3.14.0_7681，与
# aur-metadata rule-deb 采集一致）；上游版本号经 ${_upstream_ver} 进 URL
pkgname=z-code
pkgver=3.14.0_7681
_upstream_ver="${pkgver%_*}"
pkgrel=1
pkgdesc="AI coding agent desktop app by Z.ai"
arch=('x86_64' 'aarch64')
url="https://zcode.z.ai/"
license=('LicenseRef-ZCode')
conflicts=('zcode' 'zcode-bin' 'z-code-bin')
provides=("zcode=${pkgver}")
depends=('nss' 'alsa-lib' 'gtk3' 'at-spi2-core' 'libsecret' 'libnotify' 'libxss'
         'libxtst' 'xdg-utils' 'util-linux-libs')
optdepends=('libappindicator-gtk3: System tray support')
options=('!strip' '!debug')
source=("z-code.sh" "z-code.desktop")
source_x86_64=("https://cdn-zcode.z.ai/zcode/electron/releases/${_upstream_ver}/linux-x64/${_upstream}-${_upstream_ver}-linux-x64.deb")
source_aarch64=("https://cdn-zcode.z.ai/zcode/electron/releases/${_upstream_ver}/linux-arm64/${_upstream}-${_upstream_ver}-linux-arm64.deb")
b2sums=('eac2332eb52f8a6b079120c6d7b30124409f96eafc12d192074e9c8b26ddcb0b3e09876236ccf48894c1bf057c9c6376e090eae8bbdfa9ac361ddc42e3f17aee'
        '0b3a5b925482fc438cdca38ec75e5dcdbbfdf034383a867cfbb0583c2cb5e2d6f535906c5d51fa71c7c2f0440f4fc781b89ae8bc8acfa747faa131cd98cceb7b')
b2sums_x86_64=('bbaec96fe7f0a26f30018e31f8ea8fef1d55e7a2f75ff6ce6972bfab2fa37b39a6d0c5c265b6e7e168797790c74e46758ad5822de9354ab4656263d571a0d840')
b2sums_aarch64=('1caa435d8681b7c4d6e11613c9bd853affc71e51e9750862f70b75ebdb72091b935c2d53406ec231172657d45f0139390d0a417ea09162a3538bdf92548baae0')

# NOTE: z-code.sh hardcodes /opt/ZCode/zcode
# If _installdir changes, the launcher script must also be updated.
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    # Launcher
    install -Dm755 "z-code.sh" "${pkgdir}/usr/bin/${pkgname}"

    # Desktop entry: replace upstream zcode.desktop (Exec 指向 /opt/ZCode/zcode)
    rm -f "${pkgdir}/usr/share/applications/zcode.desktop"
    install -Dm644 "z-code.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Debian 打包残留
    rm -rf "${pkgdir}/usr/share/doc"

    # License
    install -Dm644 "${pkgdir}/opt/${_upstream}/LICENSE.electron.txt" \
        -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${pkgdir}/opt/${_upstream}/LICENSES.chromium.html" \
        -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    # SUID sandbox
    chmod 4755 "${pkgdir}/opt/${_upstream}/chrome-sandbox"
}
