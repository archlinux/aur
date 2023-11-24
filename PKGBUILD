# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yank-note
pkgver=3.64.2
pkgrel=1
pkgdesc="A highly extensible Markdown editor. Version control, AI completion, mind map, documents encryption, code snippet running, integrated terminal, chart embedding, HTML applets, Reveal.js, plug-in, and macro replacement."
arch=('x86_64')
url="https://yank-note.com/"
_ghurl="https://github.com/purocean/yn"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron22'
    'python'
    'java-runtime'
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'npm>=9'
    'yarn'
    'nvm'
    'python>=3.11.5'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'b9e30b4772f3d27eb7a3b2c0c0815e63cf5062b82b81d1de5575c842480d35f3')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 16
    nvm use 16
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '/deb/d' -i electron-builder.json
    yarn install
    yarn electron-rebuild
    node scripts/download-pandoc.js
    node scripts/download-plantuml.js
    yarn build
    yarn run electron-builder --linux -p never | sed 's/identityName=.*$//'
    cd "${srcdir}/${pkgname}-${pkgver}/out/.icon-set"
    cp icon_16x16.png icon_16.png
    cp icon_48x48.png icon_48.png
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16 32 48 64 128 256 512 1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/main/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}