# Maintainer: laggykiller <chaudominic2 at gmail dot com>
pkgname=sticker-convert
pkgver=2.11.1
pkgrel=1
pkgdesc='Convert (animated) stickers to/from WhatsApp, Telegram, Signal, Line, Kakao, Viber, Discord, iMessage. Written in Python.'
arch=('x86_64' 'aarch64')
url="https://github.com/laggykiller/sticker-convert"
license=('GPLv2')
depends=('zlib' 'fuse2')
options=(!strip)
source_x86_64=(
    "https://github.com/laggykiller/sticker-convert/releases/download/v${pkgver}/${pkgname}-linux-x86_64.zip"
    "https://raw.githubusercontent.com/laggykiller/${pkgname}/v${pkgver}/LICENSE")
source_aarch64=(
    "https://github.com/laggykiller/sticker-convert/releases/download/v${pkgver}/${pkgname}-linux-aarch64.zip"
    "https://raw.githubusercontent.com/laggykiller/${pkgname}/v${pkgver}/LICENSE")
sha256sums_x86_64=('b78f0e47c1c833d599ecf75cace5029adb4187768c9f189a926f381837ae9678'
                   '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
sha256sums_aarch64=('b7f9b36909af508d3eac7dfc0b97fca1c555978668d42cf8498702ee1d887a84'
                    '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')

prepare() {
    echo "Name=sticker-convert" > sticker-convert.desktop
    echo "Exec=/opt/sticker-convert/sticker-convert.bin" >> sticker-convert.desktop
    echo "Icon=sticker-convert" >> sticker-convert.desktop
    echo "Type=Application" >> sticker-convert.desktop
    echo "Terminal=false" >> sticker-convert.desktop
    echo "Categories=Utility;" >> sticker-convert.desktop
    echo "Comment=Convert (animated) stickers between WhatsApp, Telegram, Signal, Line, Kakao, Viber, Discord, iMessage" >> sticker-convert.desktop
}

package() {
    # Program
    mkdir -p "${pkgdir}/opt"
    cp -r ${srcdir}/${pkgname}-linux-${CARCH} "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/sticker-convert.desktop"\
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    cp -a "${pkgdir}/opt/${pkgname}/resources/appicon.png" "${pkgdir}/usr/share/pixmaps/sticker-convert.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.bin" "${pkgdir}/usr/bin/${pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}