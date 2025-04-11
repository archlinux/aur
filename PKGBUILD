# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=envkey
pkgname="${_appname}-desktop-bin"
_pkgname=EnvKey
pkgver=2.4.18
_electronversion=13
pkgrel=4
pkgdesc="Secure, human-friendly, cross-platform secrets and config.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://www.envkey.com/"
_ghurl="https://github.com/envkey/envkey"
_dlurl="https://envkey-releases.s3.amazonaws.com/desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'libsecret'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_dlurl}/release_artifacts/${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/envkey/envkey/desktop-v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('ad009fa2339c4ecde7fd7371a0dafa3a9ae0f85aa08df9d6b832298f0cb5aa72'
            'd3e78cbc2e92dfabac2dc9c8a5cd22e702cba2a65455c265e5bed3a1d447a704'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${_appname}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
    find "${srcdir}/squashfs-root/resources/app" -type f -exec sed "s/process.resourcesPath/\"\/usr\/lib\/${pkgname%-bin}\"/g" {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}