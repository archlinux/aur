# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xpipe-bin
_pkgname=XPipe
pkgver=14.2
pkgrel=1
pkgdesc="Your entire server infrastructure at your fingertips.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://xpipe.io/"
_ghurl="https://github.com/xpipe-io/xpipe"
license=('Apache-2.0')
conflicts=("${pkgname%-bin}")
prodives=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'libx11'
    'alsa-lib'
    'ffmpeg4.4'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-installer-linux-arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-installer-linux-x86_64.rpm")
sha256sums=('ff044ade9f5cee04f728cd401269483fb40ff4fe2fc35edc41489d6fd15125c6')
sha256sums_aarch64=('d98d0c6b9a3dd9ead72be502ba67b538a6a01426c70f8c43f6ae78f448128c19')
sha256sums_x86_64=('627de391db619e21515bdbe35b8f2e900ba90d80240db29e57246427f02049a6')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}d/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/xpipe/\/usr\/lib/g" -i "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/cli/${pkgname%-bin}_completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/cli/docs/"* -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/cli/man/"* -t "${pkgdir}/usr/share/man/man1"
}