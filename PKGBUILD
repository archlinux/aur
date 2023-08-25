# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yank-note
_pkgname=yn
pkgver=3.59.2
pkgrel=1
pkgdesc="A highly extensible Markdown editor. Version control, AI completion, mind map, documents encryption, code snippet running, integrated terminal, chart embedding, HTML applets, Reveal.js, plug-in, and macro replacement."
arch=('x86_64')
url="https://yank-note.com/"
_githuburl="https://github.com/purocean/yn"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron22' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'java-runtime' 'python')
makedepends=('gendesk' 'asar' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('41010c275c3537abcad967932bcebe048d6f7d9fb8b54f14f2dc0f91b6f1fee8'
            'd482efdb3f67288b645d18d0a75faaaabe01f9ad114753a11cc41770756870dc')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    if [ -d .git ];then
        rmdir .git && mkdir .git
    else
        mkdir .git
    fi
    yarn install
    sed '38d' -i electron-builder.json
    yarn rebuild-pty
    yarn build
    yarn run electron-builder --linux -p never | sed 's/identityName=.*$//'
    mv "out/.icon-set/icon_16x16.png" "out/.icon-set/icon_16.png"
    mv "out/.icon-set/icon_48x48.png" "out/.icon-set/icon_48.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/out/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${_pkgname}-${pkgver}/out/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/opt/${pkgname}"
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16 32 48 64 128 256 512 1024;do
        install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/out/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}