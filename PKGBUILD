# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mailmaster-bin
pkgver=5.0.2.1009
_nssver=1.1.2
_saslver=2.1.28
pkgrel=3
pkgdesc="专业的全平台邮箱客户端。一封邮件，多端同步。所有平台都能给你出色的体验。"
arch=('x86_64')
url="https://dashi.163.com"
license=('custom')
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'xcb-util-renderutil'
    'libxdamage'
    'libx11'
    'xcb-util-image'
    'alsa-lib'
    'freetype2'
    'libxcomposite'
    'nspr'
    'e2fsprogs'
    'expat'
    'at-spi2-core'
    'xcb-util-keysyms'
    'libxrandr'
    'libxkbcommon'
    'libxkbcommon-x11'
    'nss'
    'gconf'
    'krb5'
    'fontconfig'
    'libdrm'
    'xcb-util'
    'libxfixes'
    'libglvnd'
    'xcb-util-wm'
    'libxcb'
    'mesa'
    'libcups'
    'libxext'
    'pango'
)
makedepends=(
    'gcc'
    'cmake'
    'imagemagick'
)
noextract=("libnss-wrapper-${_nssver}.deb" "libsasl2-${_saslver}.deb")
source=("${pkgname%-bin}-${pkgver}.deb::https://res.126.net/dl/client/linuxmail/dashi/mail.deb"
    #"nss-wrapper.tar.gz::https://github.com/deepin-community/nss-wrapper/archive/refs/heads/master.zip"
    "libnss-wrapper-${_nssver}.deb::https://mirrors.huaweicloud.com/ubuntu/pool/main/n/nss-wrapper/libnss-wrapper_${_nssver}-1_amd64.deb"
    #"cyrus-sasl2.tar.gz::https://github.com/deepin-community/cyrus-sasl2/archive/refs/heads/master.zip"
    "libsasl2-${_saslver}.deb::https://mirrors.huaweicloud.com/ubuntu/pool/main/c/cyrus-sasl2/libsasl2-2_${_saslver}+dfsg-10_amd64.deb"
    "LICENSE.html::https://mail.163.com/html/agreement/doc.html"
    "${pkgname%-bin}.sh")
sha256sums=('49b01fd8808cdb61d6acaf5ebffc5af0d5fdffe5da8c632a277695e4408d3e17'
            'c1c9649b1bbd095a03c648d89b7bfeedcc7c15ae819e2a1a778427908eebb284'
            'd190a3abbbcb36dfb1526eb20ee957629317c8175867113ccbfe0b6bf2cb2b89'
            '8ec2318da6f512f89dbee747fcbd233f552134da98c204c4ac682400341732fc'
            '6d68799aaa5a8231743e1d49b69a91bfe629b04fea2a76f79564817dd3a0a0d5')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed -e "s|/opt/${pkgname%-bin}/launch.sh|${pkgname%-bin}|g" \
        -e "s|/opt/${pkgname%-bin}/logo.ico|${pkgname%-bin}|g" \
        -e "5i\Categories=Network;" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    convert "${srcdir}/opt/${pkgname%-bin}/logo.ico" "${srcdir}/${pkgname%-bin}.png"
}
build() {
    #build nss-wrapper
    mkdir -p "${srcdir}/libnss-wrapper"
    bsdtar -xf "libnss-wrapper-${_nssver}.deb" -C "${srcdir}/libnss-wrapper"
    cd "${srcdir}/libnss-wrapper"
    bsdtar -xf "${srcdir}/libnss-wrapper/data.tar.xz"
    cp "${srcdir}/libnss-wrapper/usr/lib/libnss_wrapper.so" "${srcdir}/opt/${pkgname%-bin}/lib"

    #build sasl
    mkdir -p "${srcdir}/libsasl2"
    bsdtar -xf "${srcdir}/libsasl2-${_saslver}.deb" -C "${srcdir}/libsasl2"
    cd "${srcdir}/libsasl2"
    bsdtar -xf "${srcdir}/libsasl2/data.tar.zst"
    cp "${srcdir}/libsasl2/usr/lib/${CARCH}-linux-gnu/libsasl2.so"* "${srcdir}/opt/${pkgname%-bin}/lib"
}
package() {
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}