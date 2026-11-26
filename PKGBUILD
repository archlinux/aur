# Maintainer: lzsnyy <710080675@qq.com>

pkgname=trae-ide
pkgver=2.3.106769
pkgrel=1
pkgdesc="AI-powered IDE by ByteDance"
arch=('x86_64' 'aarch64')
url="https://www.trae.cn/"
license=('LicenseRef-Trae')
conflicts=('trae' 'trae-bin')
depends=('nss' 'alsa-lib' 'gtk3' 'at-spi2-core' 'libsecret' 'libxkbfile' 'zeromq')
makedepends=('imagemagick' 'ttf-dejavu')
optdepends=('libappindicator-gtk3: System tray support'
            'xdg-utils: Open URLs and files with default applications'
            'python: Python extension support'
            'nodejs: Node.js extension scripts')
options=('!strip' '!debug')
install=${pkgname}.install
source=("trae.sh" "trae.desktop")
source_x86_64=("Trae-linux-x64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/${pkgver}/linux/TRAE-linux-x64.tar.gz")
source_aarch64=("Trae-linux-arm64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/${pkgver}/linux/TRAE-linux-arm64.tar.gz")
b2sums=('893d21c29fb84a2b349084750b5499a2722c95ce64aba2ef7157c6a8364e5b6dcb6dca7249583c0d6a3fbde8492ac5fff2b937e77e3d53ba48e533e7d2e34ec9'
            '4f361b9a0735b952bc9800777b62e58cdd74c2bfb39c13d875ba5ec7ccd1045878423d822c58c01f23d60384b81a7575e32c71a11b98362e7a8cd96f855ca7cf')
b2sums_x86_64=('8ed4c565822656339381bb7d8e18b1f2d62195ed1cfa5ae0cd4b47e9c0e58602c5676c2458e2721b0769bac249bafe0400c688def0fd9cb058049f8c611caf0d')
b2sums_aarch64=('e0c538bce088ef6d59a8e649846db5075aa4faa1d5c83b73949b59c88cbd5d567b5053f39f4612c9ff655523efba2620634f3b993ec1af4e3ecd75177c6c7b38')

# 国际版与国内版共用上游 code.png，右下角合成 INTL 角标以与国内版区分。
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

package() {
    install -d "${pkgdir}/opt/trae"

    for f in "${srcdir}"/*; do
        case "${f##*/}" in
            trae.sh|trae.desktop|*.tar.*) continue ;;
        esac
        cp -a "$f" "${pkgdir}/opt/trae/"
    done

    # SUID sandbox
    chmod 4755 "${pkgdir}/opt/trae/chrome-sandbox"

    # Launcher
    install -Dm755 "${srcdir}/trae.sh" "${pkgdir}/usr/bin/trae"

    # Desktop entry
    install -Dm644 "${srcdir}/trae.desktop" "${pkgdir}/usr/share/applications/trae.desktop"

    # Icon
    for _size in 16 24 32 48 64 128 256 512; do
        _badge_icon "${pkgdir}/opt/trae/resources/app/resources/linux/code.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/trae.png" \
            "${_size}" INTL '#2C549E'
    done

    # License
    install -Dm644 "${pkgdir}/opt/trae/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/opt/trae/resources/app/ThirdPartyNotices.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices"
    install -Dm644 "${pkgdir}/opt/trae/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

    # Shell completions
    install -Dm644 "${pkgdir}/opt/trae/resources/completions/bash/trae" "${pkgdir}/usr/share/bash-completion/completions/trae"
    install -Dm644 "${pkgdir}/opt/trae/resources/completions/zsh/_trae" "${pkgdir}/usr/share/zsh/site-functions/_trae"

    # Remove unnecessary files
    rm -rf "${pkgdir}/opt/trae/node_modules"
    find "${pkgdir}/opt/trae" -name "*.asc" -delete
    find "${pkgdir}/opt/trae" -name "*.bat" -delete
    find "${pkgdir}/opt/trae" -type d -name "rush-logs" -exec rm -rf {} +

    # Remove bundled GCC runtime libraries (conflict with system gcc-libs, breaks ckg indexing)
    rm -fv "${pkgdir}/opt/trae/resources/app/modules/ckg/binary/libstdc++.so.6"
    rm -fv "${pkgdir}/opt/trae/resources/app/modules/ckg/binary/libgcc_s.so.1"
}
