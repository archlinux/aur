# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=peersky-browser
_appname="Peersky Browser"
pkgver=1.0.0
pkgrel=3
pkgdesc="A minimal p2p web browser."
arch=("x86_64")
url="https://peersky.p2plabs.xyz/"
_githuburl="https://github.com/p2plabsxyz/peersky-browser"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron20')
makedepends=('npm' 'gendesk' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${pkgver}-prerelease.tar.gz"
    "${pkgname}.sh")
sha256sums=('19365d7daf195ca82ced4c542ff62d26a337bc9df6152be4abc4e0cd35763954'
            '3771f7bae9ec328b774e18bbb6a43507d32571596ca08d1d2c644325ed181e5a')
prepare() {
    gendesk -f -n -q --categories "Network" --name "${_appname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname%}-${pkgver}-prerelease"
    sed -e 's|"AppImage",|"AppImage"|g' -e '/deb/d' -e 's|"asar": false,|"asar": true,|g' -i package.json
    echo "process.env['ELECTRON_DISABLE_SECURITY_WARNINGS'] = 'true';" >> src/main.js
    npm install --force
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-prerelease/build/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-prerelease/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-prerelease/src/pages/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}