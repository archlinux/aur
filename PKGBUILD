# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=siyuan-git
_pkgver=2.10.14
pkgver=2.10.14.r0.g25c656a88
pkgrel=1
pkgdesc="A privacy-first, self-hosted, fully open source personal knowledge management software, written in typescript and golang."
arch=('any')
url="https://b3log.org/siyuan"
_ghurl="https://github.com/siyuan-note/siyuan"
license=('AGPL3')
conflicts=(
    "${pkgname%-git}"
    "${pkgname%-git}-note"
)
provides=(
    "${pkgname%-git}"
)
depends=(
    'bash'
    'electron25'
)
makedepends=(
    'gendesk'
    'git'
    'nodejs>=18.18.2'
    'npm>=9.8.1'
    'go>=1.21.3'
    'pnpm'
)
source=(
    "${pkgname//-/.}"::"git+${_ghurl}.git#tag=v${_pkgver}"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'cc2ebfbab7be3507a090131219cf76eb05a10b7131a1e9b24552b22fed20098f')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    gendesk -q -f -n --categories "Utility" --name="${pkgname%-git}" --exec="${pkgname%-git}"
    sed "2i Name[zh_CN]=思源笔记" -i "${srcdir}/${pkgname%-git}.desktop"
    cd "${srcdir}/${pkgname//-/.}/app"
    sed '/- target: "tar.gz"/d' -i electron-builder-linux.yml
    pnpm install --no-frozen-lockfile
    pnpm run build
    cd "${srcdir}/${pkgname//-/.}/kernel"
    export CGO_ENABLED=1
    #For Chinese Only
    #export GOPROXY=https://goproxy.cn,direct
    go build --tags fts5 -o "../app/kernel-linux/SiYuan-Kernel" -v -ldflags "-s -w -X github.com/siyuan-note/siyuan/kernel/util.Mode=prod"
    cd "${srcdir}/${pkgname//-/.}/app"
    pnpm run dist-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/app/build/linux-unpacked/resources/pandoc.zip" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/app/build/linux-unpacked/resources/"{app,appearance,guide,kernel,stage} "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/app/appearance/boot/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}