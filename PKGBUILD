# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="peersky-browser-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc='A minimal p2p web browser.'
arch=(x86_64)
url="https://peersky.p2plabs.xyz/"
_githuburl="https://github.com/p2plabsxyz/peersky-browser"
license=('MIT')
depends=('lib32-glibc' 'gcc-libs' 'expat' 'pango' 'mesa' 'libxkbcommon' 'nss' 'dbus' 'at-spi2-core' 'gtk3' 'libxcomposite' 'libxrandr' 'libxext' \
    'java-runtime' 'libxcb' 'libcups' 'libxfixes' 'glib2' 'libx11' 'nspr' 'nodejs' 'lib32-gcc-libs' 'libxdamage' 'alsa-lib' 'glibc' 'libdrm' 'wayland' 'bash' 'cairo')
makedepends=('pnpm' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}-prerelease.tar.gz")
sha256sums=('19365d7daf195ca82ced4c542ff62d26a337bc9df6152be4abc4e0cd35763954')
build() {
    cd "${srcdir}/${pkgname%-bin}-${pkgver}-prerelease"
    pnpm install && pnpm run build
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}-prerelease/build/linux-unpacked/"*  "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-prerelease/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f --icon "${pkgname%-bin}" --categories "Network" --name "Peersky Browser" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}