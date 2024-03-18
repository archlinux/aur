# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mailmaster-bin
pkgver=5.0.2.1011
pkgrel=4
pkgdesc="专业的全平台邮箱客户端。一封邮件，多端同步。所有平台都能给你出色的体验。"
arch=('x86_64')
url="https://dashi.163.com"
_sparkurl="https://mirrors.sdu.edu.cn/spark-store-repository"
_ablrun_url="https://portrait.gitee.com/spark-store-project/additional-base-lib"
_ubuntu_debdl_url="https://mirrors.sdu.edu.cn/ubuntu"
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
    'bubblewrap'
)
makedepends=(
    'imagemagick'
)
noextract=(
    "libnss-wrapper-1.1.2.deb"
    "libsasl2-2.1.28.deb"
    "ablrun-2.36-9.deb"
    "ubuntu-libc6-2.35.deb"
    "ubuntu-libc-2.35.deb"
    "ubuntu-libstdc++6-12.3.0.deb"
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_sparkurl}/store//network/mailmaster/${pkgname%-bin}_${pkgver}_amd64.deb"
    "libnss-wrapper-1.1.2.deb::${_ubuntu_debdl_url}/pool/main/n/nss-wrapper/libnss-wrapper_1.1.2-1_amd64.deb"
    "libsasl2-2.1.28.deb::${_ubuntu_debdl_url}/pool/main/c/cyrus-sasl2/libsasl2-2_2.1.28+dfsg-10_amd64.deb"
    "ablrun-2.36-9.deb::${_ablrun_url}/releases/download/abl-9-release1/additional-base-lib_2.36-9%20deb12u3-9_amd64.deb"
    "ubuntu-libc6-2.35.deb::${_ubuntu_debdl_url}/pool/main/g/glibc/libc6_2.35-0ubuntu3.6_amd64.deb"
    "ubuntu-libc-2.35.deb::${_ubuntu_debdl_url}/pool/main/g/glibc/libc-bin_2.35-0ubuntu3_amd64.deb"
    "ubuntu-libstdc++6-12.3.0.deb::${_ubuntu_debdl_url}/pool/main/g/gcc-12/libstdc++6_12.3.0-1ubuntu1~22.04_amd64.deb"
    "LICENSE.html::https://mail.163.com/html/agreement/doc.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('d7c272d50798b4f0dc5279efba383e8f12decef19e434b144e07c3c26c25c58a'
            'c1c9649b1bbd095a03c648d89b7bfeedcc7c15ae819e2a1a778427908eebb284'
            'd190a3abbbcb36dfb1526eb20ee957629317c8175867113ccbfe0b6bf2cb2b89'
            'f3ec9b194c63a2e300e9343d3e670a42dacc06ede6035e7057b491df69042652'
            '6e20662b2c1347d069819261c6fd4c158e95fa13e91e31bb72b575f96da6a906'
            '0fbbb920bb9b3b24c357cca9035671fcfee5f9ed49175f6145db979406dbc532'
            '83873058e692936a09649ede2f8e70b87dde1f3f5488db53da8081b81c79a5d9'
            '8ec2318da6f512f89dbee747fcbd233f552134da98c204c4ac682400341732fc'
            '385c1bc9405900eea8644760ebc1671451e351d6ebc148e0f50877d252c9575b')
build() {
    #extract mailmaster
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|/opt/${pkgname%-bin}/launch.sh|${pkgname%-bin}|g" \
        -e "s|/opt/${pkgname%-bin}/logo.ico|${pkgname%-bin}|g" \
        -e "5i\Categories=Network;" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    convert "${srcdir}/opt/${pkgname%-bin}/logo.ico" "${srcdir}/${pkgname%-bin}.png"

    #extract nss-wrapper
    install -Dm755 -d "${srcdir}/libnss-wrapper"
    bsdtar -xf "libnss-wrapper-1.1.2.deb" -C "${srcdir}/libnss-wrapper"
    bsdtar -xf "${srcdir}/libnss-wrapper/data."* -C "${srcdir}/libnss-wrapper"
    install -Dm644 "${srcdir}/libnss-wrapper/usr/lib/libnss_wrapper.so" -t "${srcdir}/opt/${pkgname%-bin}/lib"

    #extract sasl
    install -Dm755 -d "${srcdir}/libsasl2"
    bsdtar -xf "${srcdir}/libsasl2-2.1.28.deb" -C "${srcdir}/libsasl2"
    bsdtar -xf "${srcdir}/libsasl2/data."* -C "${srcdir}/libsasl2"
    install -Dm644 "${srcdir}/libsasl2/usr/lib/${CARCH}-linux-gnu/libsasl2.so"* -t "${srcdir}/opt/${pkgname%-bin}/lib"

    #extract ablrun
    install -Dm755 -d "${srcdir}/ablrun"
    bsdtar -xf "${srcdir}/ablrun-2.36-9.deb" -C "${srcdir}/ablrun"
    bsdtar -xf "${srcdir}/ablrun/data."* -C "${srcdir}/ablrun"
    mv "${srcdir}/ablrun/usr/lib/${CARCH}-linux-gnu/additional-base-lib" "${srcdir}/ablrun/usr/lib"
    rm -rf "${srcdir}/ablrun/usr/lib/${CARCH}-linux-gnu"
    sed "s|\/${CARCH}-linux-gnu||g" -i "${srcdir}/ablrun/usr/bin/ablrun"

    #extract ubuntu-libc6
    install -Dm755 -d "${srcdir}/libc6"
    bsdtar -xf "${srcdir}/ubuntu-libc6-2.35.deb" -C "${srcdir}/libc6"
    bsdtar -xf "${srcdir}/libc6/data."* -C "${srcdir}/libc6"
    install -Dm644 "${srcdir}/libc6/lib/${CARCH}-linux-gnu/"*.so* -t "${srcdir}/ablrun/usr/lib/additional-base-lib"
    install -Dm644 "${srcdir}/libc6/lib/${CARCH}-linux-gnu/ld-linux-x86-64.so.2" -t "${srcdir}/ablrun/usr/lib/additional-base-lib/lib64"

    #extract ubuntu-libc
    install -Dm755 -d "${srcdir}/libc"
    bsdtar -xf "${srcdir}/ubuntu-libc-2.35.deb" -C "${srcdir}/libc"
    bsdtar -xf "${srcdir}/libc/data."* -C "${srcdir}/libc"
    install -Dm755 "${srcdir}/libc/usr/bin/ldd" -t "${srcdir}/ablrun/usr/lib/additional-base-lib"

    #extract ubuntu-libstdc++6
    install -Dm755 -d "${srcdir}/libstdc++6"
    bsdtar -xf "${srcdir}/ubuntu-libstdc++6-12.3.0.deb" -C "${srcdir}/libstdc++6"
    bsdtar -xf "${srcdir}/libstdc++6/data."* -C "${srcdir}/libstdc++6"
    install -Dm644 "${srcdir}/libstdc++6/usr/lib/${CARCH}-linux-gnu/libstdc++.so.6.0.30" \
        "${srcdir}/ablrun/usr/lib/additional-base-lib/libstdc++.so.6"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/ablrun/usr/bin/ablrun" -t "${pkgdir}/usr/bin"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    cp -r "${srcdir}/ablrun/usr/lib" "${pkgdir}/usr"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}