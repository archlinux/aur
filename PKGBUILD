# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lexicanter-bin
_pkgname=Lexicanter
pkgver=2.2.1
_electronversion=36
pkgrel=2
pkgdesc="A lexicon management tool for constructed languages.It was developed and will occasionally be updated by Ethan Ray (known online as Cthethan or Saturnine).(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Saturnine-Softworks/Lexicanter"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'python'
)
makedepends=(
    'asar'
    'fuse2'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.AppImage")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('09b6ea1910f3d7205eb20f5c6e7ea66929cd59fa98fee47004c3051730a7e383')
sha256sums_x86_64=('3bd4ff04842568601cffd97faf837f0d9704fee5565677f0c3b8623c4f284dce')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Video;/Video;AudioVideo;/g
    " "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/src" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    rm -rf \
        "${srcdir}/squashfs-root/resources/"{aarch64-apple-darwin,i686-pc-windows-gnu,x86_64-apple-darwin,x86_64-pc-windows-gnu} \
        "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/@parcel" \
        "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{darwin*,freebsd*,linux_armhf,linux_ia32,linux_riscv64,musl_x64,openbsd*,win32*}
    case "${CARCH}" in
        aarch64)
            rm -rf \
                "${srcdir}/squashfs-root/resources/x86_64-unknown-linux-gnu" \
                "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/koffi/build/koffi/linux_x64"
            ;;
        x86_64)
            rm -rf \
                "${srcdir}/squashfs-root/resources/aarch64-unknown-linux-gnu" \
                "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/koffi/build/koffi/linux_arm64"
            ;;
    esac
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,*-linux-*} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
