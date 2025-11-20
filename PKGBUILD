# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xpipe-bin
_pkgname=XPipe
pkgver=19.1
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
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'libx11'
    'alsa-lib'
    'ffmpeg4.4'
    'ffmpeg'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-installer-linux-arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-installer-linux-x86_64.rpm")
sha256sums=('235061e14a5ba0983364e506bdf824ea11f6c987d9b116af7ce6ce8967ef5603')
sha256sums_aarch64=('471809e880a61b5b6f34c78db8af24dadb34a35cf1825d8b93c526c985e4a638')
sha256sums_x86_64=('7442e4a155b22a35d60cd945b28f21f38555565f31b50ad91d717be46a830154')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/TryExec=\/opt\/${pkgname%-bin}\/bin\/${pkgname%-bin}d/TryExec=\/usr\/lib\/${pkgname%-bin}\/bin\/${pkgname%-bin}d/g
        s/Exec=\/opt\/${pkgname%-bin}\/bin\/${pkgname%-bin}/Exec=${pkgname%-bin}/g
        s/Path=\/opt\/${pkgname%-bin}/Path=\/usr\/lib\/${pkgname%-bin}/g
    " "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}.desktop"
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
    #install -Dm644 "${srcdir}/etc/bash_completion.d/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
    #install -Dm644 "${srcdir}/usr/share/man/man1/"* -t "${pkgdir}/usr/share/man/man1"
}
