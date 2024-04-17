# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=anythingllm
pkgname="${_appname}-desktop-bin"
_pkgname=Anything-LLM-Desktop
pkgver=1.4.4
_electronversion=26
pkgrel=1
pkgdesc="The all-in-one AI application, tool suite, and API for RAG & Agents for Docker & Desktop."
arch=('x86_64')
url="https://useanything.com/"
_ghurl="https://github.com/Mintplex-Labs/anything-llm"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
)
depends=(
    "electron${_electronversion}"
    'nodejs'
    'python'
    'python-setuptools'
)
makedepends=(
    'fuse2'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::https://s3.us-west-1.amazonaws.com/public.useanything.com/latest/${_pkgname//-/}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Mintplex-Labs/anything-llm/master/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('e4b0cedf156928a8c2aa706fbac0a06ee890b5b5d80b62262455e308c5151730'
            '782d2dc18a1ed9028ca992520f42b2e0b6187807da0d14455b8ae608e2e5692e'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/backend" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}