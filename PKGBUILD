# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yank-note
_pkgname=yn
pkgver=3.63.2
pkgrel=1
pkgdesc="A highly extensible Markdown editor. Version control, AI completion, mind map, documents encryption, code snippet running, integrated terminal, chart embedding, HTML applets, Reveal.js, plug-in, and macro replacement."
arch=('x86_64')
url="https://yank-note.com/"
_githuburl="https://github.com/purocean/yn"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'bash'
    'electron22'
)
makedepends=(
    'gendesk'
    'npm>=9'
    'yarn'
    'nvm'
    'python>=3.9'
)
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('4fb414eafe1ef703562c20de60989e629692410d02b5d396fcc5e5611a482bff'
            'b9e30b4772f3d27eb7a3b2c0c0815e63cf5062b82b81d1de5575c842480d35f3')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 18
}
prepare() {
    _ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    if [ -d .git ];then
        rmdir .git && mkdir .git
    else
        mkdir .git
    fi
    sed '/deb/d' -i electron-builder.json
    yarn install
    yarn electron-rebuild
    node scripts/download-pandoc.js
    node scripts/download-plantuml.js
    yarn build
    yarn run electron-builder --linux -p never | sed 's/identityName=.*$//'
    find ./out -regex '.*app.asar.unpacked/node_modules/node-pty/build/Release/pty.node$' | grep pty.node
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/out/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${_pkgname}-${pkgver}/out/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/main/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}