# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=megacubo-bin
_pkgname=Megacubo
pkgver=17.5.7
_electronversion=9
pkgrel=1
pkgdesc="📺 A intuitive, multi-language and cross-platform IPTV player.(Prebuild version.Use system-wide electron)"
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url="https://megacubo.tv/"
_ghurl="https://github.com/EdenwareApps/Megacubo"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'perl'
    'ffmpeg'
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
    '!emptydirs'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_ia32.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x64.tar.gz")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('a79f131d2995dc1b9432dda1d7335c14c1b90d5777714af7714397980b583955')
sha256sums_i686=('a3dd9b5b57355237094366cc9d2f696a62906f22e29081830add4af770c0cd0e')
sha256sums_x86_64=('192d20e54fbc5dce1d048e287f94a013b3652797aa79a577efc4030331d6f7cf')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    find "${srcdir}/resources/app" -type f -name "*.js" -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/bin/ffmpeg" "${pkgdir}/usr/lib/${pkgname%-bin}/ffmpeg"
    install -Dm644 "${srcdir}/resources/app/default_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}