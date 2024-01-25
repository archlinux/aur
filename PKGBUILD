# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mailmaster-bin
pkgver=5.0.2.1011
_nssver=1.1.2
_saslver=2.1.28
pkgrel=2
pkgdesc="专业的全平台邮箱客户端。一封邮件，多端同步。所有平台都能给你出色的体验。"
arch=('x86_64')
url="https://dashi.163.com"
_sparkurl="https://mirrors.sdu.edu.cn/spark-store-repository"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'alsa-lib'
    'libxrandr'
    'nss'
    'at-spi2-core'
    'pango'
    'gconf'
    'libxcomposite'
)
makedepends=(
    #'gcc'
    #'cmake'
    'imagemagick'
)
noextract=(
    "libnss-wrapper-${_nssver}.deb"
    "libsasl2-${_saslver}.deb"
)
options=('!strip')
source=(
    #"${pkgname%-bin}-${pkgver}.deb::https://res.126.net/dl/client/linuxmail/dashi/mail.deb"
    "${pkgname%-bin}-${pkgver}.deb::${_sparkurl}/store//network/mailmaster/${pkgname%-bin}_${pkgver}_amd64.deb"
    #"nss-wrapper.tar.gz::https://github.com/deepin-community/nss-wrapper/archive/refs/heads/master.zip"
    "libnss-wrapper-${_nssver}.deb::https://mirrors.huaweicloud.com/ubuntu/pool/main/n/nss-wrapper/libnss-wrapper_${_nssver}-1_amd64.deb"
    #"cyrus-sasl2.tar.gz::https://github.com/deepin-community/cyrus-sasl2/archive/refs/heads/master.zip"
    "libsasl2-${_saslver}.deb::https://mirrors.huaweicloud.com/ubuntu/pool/main/c/cyrus-sasl2/libsasl2-2_${_saslver}+dfsg-10_amd64.deb"
    "LICENSE.html::https://mail.163.com/html/agreement/doc.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('d7c272d50798b4f0dc5279efba383e8f12decef19e434b144e07c3c26c25c58a'
            'c1c9649b1bbd095a03c648d89b7bfeedcc7c15ae819e2a1a778427908eebb284'
            'd190a3abbbcb36dfb1526eb20ee957629317c8175867113ccbfe0b6bf2cb2b89'
            '8ec2318da6f512f89dbee747fcbd233f552134da98c204c4ac682400341732fc'
            '8f48865b0c5dfb5d7e8cc599d9dc9610d3b0e16cec8d4f036a2be3dde7eba99f')
prepare() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
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
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}