# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Avi Zimmerman <avi.zimmerman@gmail.com>
pkgname=nzyme-bin
pkgver=1.2.2
pkgrel=5
pkgdesc="A free and open next-generation WiFi defense system."
arch=("x86_64")
license=("custom:SSPL")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
url="https://www.nzyme.org/"
_ghurl="https://github.com/lennartkoopmann/nzyme"
depends=(
    'java-runtime'
)
makedepends=(
    'gendesk'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://assets.nzyme.org/releases/${pkgname%-bin}-${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/lennartkoopmann/nzyme/${pkgver}/COPYING"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/nzymedefense/nzyme/${pkgver}/web-interface/public/static/${pkgname%-bin}.png"
)
sha256sums=('fb59a0b60736a5ddb03a8c69c2a1b925b25726b32bf32b6e38b710741e5b122b'
            '34e94c5087ba6e9fb34f35ae71df5e6533c5fc7cbbf6c44186a71e82806b69e1'
            '2827e52f68087fc4475066f803c3624fb6efa907dad1addda41aa9975d100a34')
build() {
    gendesk -q -f -n --categories "System" --name "${pkgname}" --exec "${pkgname}"
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|usr/share|opt|g" -i "${srcdir}/usr/share/${pkgname%-bin}/bin/${pkgname%-bin}"
    sed "s|/share/${pkgname%-bin}||g" -i "${srcdir}/usr/lib/systemd/system/${pkgname%-bin}.service"
}
package() {
    install -Dm644 "${srcdir}/etc/${pkgname%-bin}/log4j2-debian.xml" -t "${pkgdir}/etc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/etc/${pkgname%-bin}/${pkgname%-bin}.conf.example" "${pkgdir}/etc/${pkgname%-bin}/${pkgname%-bin}.conf"
    install -Dm755 "${srcdir}/usr/share/${pkgname%-bin}/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/lib/${pkgname%-bin}-${pkgver}.jar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.jar"
    install -Dm644 "${srcdir}/usr/lib/systemd/system/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}