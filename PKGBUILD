# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-s3-file-manager
pkgver=0.2.0
_electronversion=20
pkgrel=3
pkgdesc="A GUI AWS S3 file manager. It supports keyword search, download, upload and preview video."
arch=('any')
url="https://github.com/kelp404/electron-s3-file-manager"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'make'
    'python'
    'alsa-lib'
    'libdrm'
    'pango'
    'nss'
    'gtk3'
    'libxfixes'
    'libxdamage'
    'cairo'
    'nspr'
    'libxcomposite'
    'libcups'
    'libx11'
    'at-spi2-core'
    'libxrandr'
    'libxkbcommon'
    'expat'
    'mesa'
    'libxext'
    'libxcb'
    'wayland'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
)
sha256sums=('SKIP')
build() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    sed -e '/dmg/d' -e "s|win|linux|g" -e "s|portable|AppImage|g" -i tools.js
    npm install
    npm run build
}                                                                                                                                                                                 
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}