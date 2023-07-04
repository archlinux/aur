# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="electron-egg-bin"
_appname="ee"
pkgver=3.5.1
pkgrel=1
pkgdesc="A simple, cross platform, enterprise desktop software development framework"
arch=('x86_64')
url="https://www.kaka996.com/"
_githuburl="https://github.com/dromara/electron-egg"
license=('Apache')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('gcc-libs' 'hicolor-icon-theme' 'cairo' 'libxcomposite' 'libxext' 'gtk3' 'nss' 'libx11' 'libxdamage' 'glib2' 'alsa-lib' \
    'libxrandr' 'dbus' 'nspr' 'wayland' 'libxfixes' 'mesa' 'expat' 'at-spi2-core' 'glibc' 'libcups' 'libdrm' 'libxkbcommon' 'pango' 'libxcb')
makedepends=('pnpm')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7c304f14d033f1ae535cf9ad1f8d645d612b7a402d25e99d28b119b5f7a3fb75')
build() {
    cd "${srcdir}/${pkgname%-bin}-${pkgver}"
    #For Chinese only
    #npm config set node-linker hoisted
    #npm config set registry=https://registry.npmmirror.com
    #npm config set disturl=https://registry.npmmirror.com/-/binary/node
    #npm config set electron_mirror=https://registry.npmmirror.com/-/binary/electron/
   pnpm install && pnpm run build-lp-64
}
package() {
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}/out/${_appname}-linux-${pkgver}-x64.pacman" -C "${srcdir}"
    cp --parents -a {opt,usr} "${pkgdir}"
    sed "s|Name=${_appname}|Name=${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgdir}"
}