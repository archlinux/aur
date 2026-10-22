# Maintainer: logan_reed <liulingzhang.work@icloud.com>

_upstream=ZCode
# pkgver 取 deb 头部 dpkg 权威版本归一化（3.14.0-7681 → 3.14.0_7681，与
# aur-metadata rule-deb 采集一致）；上游版本号经 ${_upstream_ver} 进 URL
pkgname=z-code
pkgver=3.16.2_8769
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
b2sums_x86_64=('5c16f99bddf827f16a0f872e30fcece09c9b4e2a65fc7512695fda7762defc819fb7129c7feb3d489968adb04b71c2040919c35c1f8f0926fc5714a85afb576e')
b2sums_aarch64=('da00aefa4b78be1f324c9c8cdb87d1381b204b0b8060240303fd0c3a9d1a7b73b821df9818655eb2cfd5b1a5b078db4907bf94c2195996b7116c0faec79189e5')

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
