# Maintainer: lzsnyy <710080675@qq.com>

pkgname=trae-cn-ide
pkgver=2.3.106768
pkgrel=1
pkgdesc="AI-powered IDE by ByteDance (Chinese Domestic Version)"
arch=('x86_64' 'aarch64')
url="https://www.trae.cn/"
license=('LicenseRef-Trae')
conflicts=('trae-cn' 'trae-cn-bin')
depends=('nss' 'alsa-lib' 'gtk3' 'at-spi2-core' 'libsecret' 'libxkbfile' 'zeromq')
makedepends=('imagemagick' 'ttf-dejavu')
optdepends=('libappindicator-gtk3: System tray support'
            'xdg-utils: Open URLs and files with default applications'
            'python: Python extension support'
            'nodejs: Node.js extension scripts')
options=('!strip' '!debug')
install=${pkgname}.install
source=("trae-cn.sh" "trae-cn.desktop")
source_x86_64=("Trae_CN-linux-x64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/${pkgver}/linux/TRAE_CN-linux-x64.tar.gz")
source_aarch64=("Trae_CN-linux-arm64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/${pkgver}/linux/TRAE_CN-linux-arm64.tar.gz")
b2sums=('b16bf7b4e9a60d3f2d04fda6b7c6f2ca224009daffeae4e2b82a2b0f2f95d8821ebb45a6a2c394357b6a55b25c801181a3200f25a373202adb0c2637b7b9d5b0'
            '9e0d6934891325eeea1e83c4d79db3f80cc91a2507302601c10763f08cfd55dfbcb456d3b64540e44229b821786d445cfc2d7a5424446c2a233a742c69e55450')
b2sums_x86_64=('e4a17381c0a37da8afac06be76d4ba4f5b3c20b6966f52bb252867fbc412d6352774f25977373a413f73872fa7434d352f4d5148c52d1af29d9444a5eed2d4ac')
b2sums_aarch64=('b8aac8b1808064ab67f00f17091e9ef8ceed7129580bf0f92da57b6930f48fb258d93bd0f1a9c65e0325b0d8d4f08d2ad2ca7e0840e0ba75d7ae2f29e21f66a1')

# 国内版图标与国际版同为上游 code.png，右下角合成 CN 角标以在启动器/任务栏区分。
_badge_icon() {
    local src="$1" dst="$2" size="$3" label="${4:-CN}" bg="${5:-#C8102E}"
    local bw pad ring pointsize tmp
    bw=$(( size * 30 / 100 )); [ "$bw" -lt 7 ] && bw=7
    pad=$(( size * 5 / 100 )); [ "$pad" -lt 1 ] && pad=1
    ring=$(( bw / 12 )); [ "$ring" -lt 1 ] && ring=1
    pointsize=$(( bw * 45 / 100 )); [ "${#label}" -ge 4 ] && pointsize=$(( bw * 27 / 100 ))
    [ "$pointsize" -lt 4 ] && pointsize=4
    tmp="$(mktemp --suffix=.png)"
    install -dm755 "$(dirname "${dst}")"
    magick -size "${bw}x${bw}" xc:none \
        -fill white -draw "circle $(( bw / 2 )),$(( bw / 2 )) $(( bw / 2 )),0" \
        -fill "${bg}" -draw "circle $(( bw / 2 )),$(( bw / 2 )) $(( bw / 2 )),${ring}" \
        -gravity center -font DejaVu-Sans-Bold -pointsize "${pointsize}" \
        -fill white -annotate +0+0 "${label}" "${tmp}" || return 1
    magick "${src}" -resize "${size}x${size}" \
        "${tmp}" -gravity southeast -geometry "+${pad}+${pad}" -composite "${dst}"
    rm -f "${tmp}"
}

prepare() {
    local _size
    rm -rf "${srcdir}/icons"
    install -dm755 "${srcdir}/icons"
    for _size in 16 24 32 48 64 128 256 512; do
        _badge_icon "${srcdir}/resources/app/resources/linux/code.png" \
            "${srcdir}/icons/trae-cn-${_size}.png" "${_size}"
    done
}

package() {
    install -d "${pkgdir}/opt/trae-cn"

    for f in "${srcdir}"/*; do
        case "${f##*/}" in
            trae-cn.sh|trae-cn.desktop|*.tar.*) continue ;;
        esac
        cp -a "$f" "${pkgdir}/opt/trae-cn/"
    done

    # SUID sandbox
    chmod 4755 "${pkgdir}/opt/trae-cn/chrome-sandbox"

    # Launcher
    install -Dm755 "${srcdir}/trae-cn.sh" "${pkgdir}/usr/bin/trae-cn"

    # Desktop entry
    install -Dm644 "${srcdir}/trae-cn.desktop" "${pkgdir}/usr/share/applications/trae-cn.desktop"

    # Icon（国内版带 CN 角标，安装全部尺寸）
    local _size
    for _size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "${srcdir}/icons/trae-cn-${_size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/trae-cn.png"
    done

    # License
    install -Dm644 "${pkgdir}/opt/trae-cn/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/opt/trae-cn/resources/app/ThirdPartyNotices.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices"
    install -Dm644 "${pkgdir}/opt/trae-cn/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

    # Shell completions
    install -Dm644 "${pkgdir}/opt/trae-cn/resources/completions/bash/trae-cn" "${pkgdir}/usr/share/bash-completion/completions/trae-cn"
    install -Dm644 "${pkgdir}/opt/trae-cn/resources/completions/zsh/_trae-cn" "${pkgdir}/usr/share/zsh/site-functions/_trae-cn"

    # Remove unnecessary files
    rm -rf "${pkgdir}/opt/trae-cn/node_modules"
    find "${pkgdir}/opt/trae-cn" -name "*.asc" -delete
    find "${pkgdir}/opt/trae-cn" -name "*.bat" -delete
    find "${pkgdir}/opt/trae-cn" -type d -name "rush-logs" -exec rm -rf {} +

    # Remove bundled GCC runtime libraries (conflict with system gcc-libs, breaks ckg indexing)
    rm -fv "${pkgdir}/opt/trae-cn/resources/app/modules/ckg/binary/libstdc++.so.6"
    rm -fv "${pkgdir}/opt/trae-cn/resources/app/modules/ckg/binary/libgcc_s.so.1"
}
