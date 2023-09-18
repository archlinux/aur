# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mailmaster-bin
pkgver=5.0.2.1009
_nssver=1.1.11
_saslver=2.1.27
pkgrel=1
pkgdesc="专业的全平台邮箱客户端。一封邮件，多端同步。所有平台都能给你出色的体验。"
arch=('x86_64')
url="https://dashi.163.com"
license=('custom')
conflicts=("${pkgname%-bin}")
noextract=("nss-wrapper-${_nssver}.tar.gz" "sasl-${_saslver}.tar.gz")
depends=('qt5-base' 'xcb-util-renderutil' 'libxdamage' 'libx11' 'xcb-util-image' 'alsa-lib' 'freetype2' 'libxcomposite' 'nspr' 'e2fsprogs' \
    'expat' 'at-spi2-core' 'dbus' 'xcb-util-keysyms' 'zlib' 'libxrandr' 'glibc' 'bash' 'libxkbcommon' 'libxkbcommon-x11' 'nss' 'gconf' 'krb5' \
    'fontconfig' 'libdrm' 'xcb-util' 'libxfixes' 'libglvnd' 'xcb-util-wm' 'glib2' 'libxcb' 'mesa' 'libcups' 'libxext' 'pango' 'gcc-libs')
makedepends=('gcc' 'cmake' 'imagemagick')
source=("${pkgname%-bin}-${pkgver}.deb::https://res.126.net/dl/client/linuxmail/dashi/mail.deb"
    "nss-wrapper-${_nssver}.tar.gz::https://ftp.samba.org/pub/cwrap/nss_wrapper-${_nssver}.tar.gz"
    "sasl-${_saslver}.tar.gz::https://github.com/cyrusimap/cyrus-sasl/releases/download/cyrus-sasl-${_saslver}/cyrus-sasl-${_saslver}.tar.gz"
    "LICENSE.html::https://mail.163.com/html/agreement/doc.html"
    "${pkgname%-bin}.sh")
sha256sums=('49b01fd8808cdb61d6acaf5ebffc5af0d5fdffe5da8c632a277695e4408d3e17'
            'fb45332e7fb4d85d3ea829ed18172366196c17cbd32ef690a7e1309f0c37b4e0'
            '26866b1549b00ffd020f188a43c258017fa1c382b3ddadd8201536f72efb05d5'
            '8ec2318da6f512f89dbee747fcbd233f552134da98c204c4ac682400341732fc'
            'e4f4ec3e04284d875a8c1591d1cf6fdb01b634c829949fa8ad4ea1b39be39549')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|/opt/${pkgname%-bin}/launch.sh|${pkgname%-bin}|g;s|/opt/${pkgname%-bin}/logo.ico|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    convert "${srcdir}/opt/${pkgname%-bin}/logo.ico" "${srcdir}/${pkgname%-bin}.png"
}
build() {
    #build nss-wrapper
    bsdtar -xf "${srcdir}/nss-wrapper-${_nssver}.tar.gz"
    cd "${srcdir}/nss_wrapper-${_nssver}"
    mkdir obj
    cd obj
    cmake -DCMAKE_INSTALL_PREFIX="${srcdir}/nss_wrapper-${_nssver}/build" -DLIB_SUFFIX=64 ..
    make
    make install
    cp -r "${srcdir}/nss_wrapper-${_nssver}/build/lib/libnss_wrapper.so"* "${srcdir}/opt/${pkgname%-bin}/lib"

    #build sasl
    cd "${srcdir}"
    bsdtar -xf "${srcdir}/sasl-${_saslver}.tar.gz"
    mkdir -p "${srcdir}/cyrus-sasl-${_saslver}/build"
    cd "${srcdir}/cyrus-sasl-${_saslver}"
    ./configure --prefix="${srcdir}/cyrus-sasl-${_saslver}/build"
    make
    make install
    cp -r "${srcdir}/cyrus-sasl-${_saslver}/build/lib/libsasl2.so"* "${srcdir}/opt/${pkgname%-bin}/lib"
}
package() {
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}