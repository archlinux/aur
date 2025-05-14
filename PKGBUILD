# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qtscrcpy-bin
_pkgname=QtScrcpy
pkgver=3.2.0
pkgrel=1
pkgdesc="Android real-time display control software.(Prebuilt version)"
arch=('x86_64')
url="https://blog.csdn.net/rankun1/article/details/87970523"
_ghurl="https://github.com/barry-ran/QtScrcpy"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    'staticlibs'
)
depends=(
    'qt5-multimedia'
    'qt5-x11extras'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-ubuntu-22.04-gcc_64.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/barry-ran/QtScrcpy/v${pkgver}/backup/logo.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('46eed04a4fc002f8444ba4fe379e50c721daa734c3338a6f66ef5084b5977f8b'
            'a96a81cee07375eaed07d927e67dbeb1f2d3c9e0c3791d5d14156bd03bf73371'
            'db1db4c15024a45337e7e7190046e6414184603321be058797422a54ed5fc85d')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/output/x64/Release/"{adb,"${_pkgname}",scrcpy-server,sndcpy.sh} -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/output/x64/Release/sndcpy.apk" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}