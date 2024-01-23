# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: zhullyb <zhullyb [at] outlook dot com>
pkgname=wolai-bin
pkgver=1.2.9
pkgrel=3
pkgdesc="wolai是一种新形态的文档/笔记/信息系统,它与你过去使用的所有传统文档、在线文档都有很多不同,学会使用wolai就等于拥有了一个强大的个人与团队生产力工具。"
arch=(
    "aarch64"
    "x86_64"
)
url="https://www.wolai.com"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'alsa-lib'
    'java-runtime'
    'gtk3'
    'at-spi2-core'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://cdn.wostatic.cn/dist/installers/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://cdn.wostatic.cn/dist/installers/${pkgname%-bin}_${pkgver}_amd64.deb")
source=(
    "LICENSE.html"
)
sha256sums=('04b7a1e4cecbadd2e1bc903b3ad518834f93b9b76542bf53fcb18f24faac099c')
sha256sums_aarch64=('c9b4f563908b7ad370d5def0e7ad4880925810f1af4c940d65d88168d91c2e63')
sha256sums_x86_64=('7bcfd89d5667b0986d633f0c333c42fb9770317ce9fb4691390832f77869aef7')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin} --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}