# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ente
pkgname="${_pkgname}-desktop-bin"
pkgver=1.7.12
_electronversion=35
pkgrel=1
pkgdesc="Desktop app for ente Photos.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/ente-io/photos-desktop"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'ffmpeg'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x64.pacman")
sha256sums_aarch64=('ba78d31b7745ca329f3a1925fdea1d3a540614dc6c2b9d95e455d0ca380b1f71')
sha256sums_x86_64=('c80e3aee3207735120251c659081c6a514d0127f911dbf65c0c757514b5706b4')
prepare() {
    sed -e "
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/Photography/Graphics/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i "s/io.${_pkgname}.photos/${pkgname%-bin}/g" "${srcdir}/opt/${_pkgname}/resources/io.${_pkgname}.photos.appdata.xml"
    _file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome_crashpad_handler chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
        libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak vk_swiftshader_icd.json)
    for _files in "${_file_list[@]}";do
        ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${srcdir}/opt/${_pkgname}/${_files}"
    done
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/ffmpeg-static/ffmpeg"
    rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/onnxruntime-node/bin/napi-v3/"{darwin,win32}
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/onnxruntime-node/bin/napi-v3/linux/x64"
            ;;
        x86_64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/onnxruntime-node/bin/napi-v3/linux/arm64"
            ;;
    esac
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/io.${_pkgname}.photos.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
}