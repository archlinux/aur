# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yank-note
_pkgname=yn
pkgver=3_next_04
pkgrel=1
pkgdesc="A highly extensible Markdown editor. Version control, AI completion, mind map, documents encryption, code snippet running, integrated terminal, chart embedding, HTML applets, Reveal.js, plug-in, and macro replacement."
arch=('x86_64')
url="https://yank-note.com/"
_githuburl="https://github.com/purocean/yn"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron22' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'python>=3')
makedepends=('gendesk' 'npm>=9' 'asar' 'yarn' 'nodejs>=18')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "${pkgname}.sh")
sha256sums=('4b47dae5ce67cebd4b9d389a08ef2a30cf05f6445e8da201fba45446727bd5fb'
            'a0fc1527304dab64c82784578290cb14d1e1a8d50ea0a4cda31db23c5c84f61d')
prepare() {
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
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
    asar e "${srcdir}/${_pkgname}-${pkgver//_/-}/out/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${_pkgname}-${pkgver//_/-}/out/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname}.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.asar" -t "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16 32 48 64 128 256 512 1024;do
        install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/out/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}