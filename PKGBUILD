# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=clamav-desktop-bin
_pkgname="ClamAV Desktop"
pkgver=0.3.24
pkgrel=2
pkgdesc="Cross-platform Desktop GUI for ClamAV antivirus."
arch=('x86_64')
url="https://github.com/ivangabriele/clamav-desktop"
license=('AGPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'bash'
    'clamav'
    'electron17'
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.linux.amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('c1bc5128d3c1c678347418ef195a81197e53af05157cb57d247f9f396078d568'
            '82630a8d28e145472d4b87900ef88f00ff08a99b73bb63704e5a5948f3811fe1')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${srcdir}/app.asar.unpacked/packages/main/dist/vendor/"*.exe
    sed -e "s|C:/Program Files/ClamAV/clamd.exe|/usr/bin/clamd|g" -e "s|clamd.exe|clamd|g" \
        -e "s|C:/Program Files/ClamAV/clamscan.exe|/usr/bin/clamscan|g" -e "s|clamscan.exe|clamscan|g" \
        -e "s|C:/Program Files/ClamAV/freshclam.exe|/usr/bin/freshclam|g" -e "s|freshclam.exe|freshclam|g" \
        -e "s|logo-clamav.ico|logo-clamav.png|g" \
        -i "${srcdir}/app.asar.unpacked/packages/main/dist/index.cjs"
    sed "s|logo-clamav.ico|logo-clamav.png|g" -i "${srcdir}/app.asar.unpacked/packages/main/index.ts"
    sed -e "s|C:/Program Files/ClamAV/clamd.exe|/usr/bin/clamd|g" -e "s|clamd.exe|clamd|g" \
        -i "${srcdir}/app.asar.unpacked/packages/main/libs/ClamDaemon.ts"
    sed -e "s|C:/Program Files/ClamAV/clamscan.exe|/usr/bin/clamscan|g" -e "s|clamscan.exe|clamscan|g" \
        -i "${srcdir}/app.asar.unpacked/packages/main/libs/ClamScan.ts"
    sed -e "s|C:/Program Files/ClamAV/freshclam.exe|/usr/bin/freshclam|g" -e "s|freshclam.exe|freshclam|g" \
        -i "${srcdir}/app.asar.unpacked/packages/main/libs/FreshClam.ts"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    touch clamd.log freshclam.dat
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" \
        "${srcdir}/app.asar.unpacked/packages/main/assets/icons/logo-clamav.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm666 "${srcdir}/clamd.log" -t "${pkgdir}/var/log/clamav"
    install -Dm777 -d "${pkgdir}/var/lib/clamav"
    install -Dm666 "${srcdir}/freshclam.dat" -t "${pkgdir}/var/lib/clamav"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"*.so -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}