# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=super-controller
pkgver=1.3.5
pkgrel=3
pkgdesc="Give your MIDI devices super powers: take control of the lights, messages, and communication between controllers."
arch=('any')
url="https://github.com/aolsenjazz/super-controller"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'libxext'
    'libxkbcommon'
    'libcups'
    'libxdamage'
    'alsa-lib'
    'lib32-glibc'
    'libxfixes'
    'hicolor-icon-theme'
    'expat'
    'libxrandr'
    'nss'
    'libdrm'
    'libx11'
    'mesa'
    'nspr'
    'python'
    'gtk3'
    'libxcomposite'
    'lib32-alsa-lib'
    'libxcb'
    'lib32-gcc-libs'
    'at-spi2-core'
    'cairo'
    'pango'
)
makedepends=(
    'gendesk'
    'npm>=7'
    'nodejs>=14'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
)
sha256sums=('SKIP'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/npm_cache"
    npm run post-clone
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}