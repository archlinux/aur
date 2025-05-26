# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rendertune-bin
_pkgname=RenderTune
pkgver=2.0.9
_electronversion=33
pkgrel=1
pkgdesc="A free electron app that uses ffmpeg to combine audio.+image file(s) into video files.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://www.martinbarker.me/RenderTune"
_ghurl="https://github.com/MartinBarker/RenderTune"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'ffmpeg'
)
makedepends=(
    'gendesk'
)
source=(
    "LICENSE::https://raw.githubusercontent.com/MartinBarker/RenderTune/main/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.bz2::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.bz2")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.bz2::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-armv7l.tar.bz2")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.bz2::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-x64.tar.bz2")
sha256sums=('035b9f4f36ade6d10e367762532feeb5f92e9cda22931dd9dc8913c586027b75'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('ae50c2252459711a696bfedb65ab000b13a16fe72ad585b873db7c076156c36d')
sha256sums_armv7h=('b0371d7aec54ac6e5b5e0dd9d08f672b1dc4639cae27fa884a2cf2af36d0ef5e')
sha256sums_x86_64=('86af41e04d56e7fdc977d60492c2146e4bf4043fb9bd0e9320e0bc4d91049f94')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    #find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}-linux-"*/resources/build "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/bin/ffmpeg" "${pkgdir}/usr/lib/${pkgname%-bin}/ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${pkgdir}/usr/lib/${pkgname%-bin}/ffprobe"
    install -Dm644 "${srcdir}/${_pkgname}-linux-"*/resources/build/svg/"${_pkgname}LogoWhite.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
