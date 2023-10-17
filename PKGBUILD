# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Butui Hu <hot123tea123@gmail.com>
pkgname=motrix-git
_pkgname=Motrix
pkgver=1.8.19.r30.g7012040
pkgrel=1
pkgdesc="A full-featured download manager that supports downloading HTTP, FTP, BitTorrent, Magnet, etc."
arch=('any')
url="https://motrix.app/"
_githuburl="https://github.com/agalwood/Motrix"
license=('MIT')
depends=('libxcb' 'gcc-libs' 'dbus' 'libxdamage' 'alsa-lib' 'mesa' 'gtk3' 'libxkbcommon' 'libxext' 'libxcomposite' \
    'nspr' 'pango' 'nss' 'libdrm' 'at-spi2-core' 'cairo' 'libcups' 'libxrandr' 'glib2' 'libx11' 'libxfixes' 'expat' 'glibc')
makedepends=('gendesk' 'git' 'yarn' 'npm>=9.8.1' 'nodejs>=18.18.0')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("${pkgname//-/.}::git+https://github.com/agalwood/Motrix.git")
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    gendesk -q -f -n --categories "Network" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname//-/.}"
    sed '157,178d' -i electron-builder.json
    yarn
    yarn lint:fix
    yarn build
    yarn pack
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-git}",usr/bin}
    case "${CARCH}" in
        x86_64)
            _architecture="linux-unpacked"
        ;;
        aarch64)
            _architecture="linux-arm64-unpacked"
        ;;
        armv7h)
            _architecture="linux-armv7l-unpacked"
        ;;
    esac
    cp -r "${srcdir}/${pkgname//-/.}/release/${_architecture}/"* "${pkgdir}/opt/${pkgname%-git}"
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/build/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}