# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yank-note
_pkgname=yn
pkgver=3_next_15
pkgrel=1
pkgdesc="A highly extensible Markdown editor. Version control, AI completion, mind map, documents encryption, code snippet running, integrated terminal, chart embedding, HTML applets, Reveal.js, plug-in, and macro replacement."
arch=('x86_64')
url="https://yank-note.com/"
_githuburl="https://github.com/purocean/yn"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron22')
makedepends=('gendesk' 'npm>=9' 'asar' 'yarn' 'nodejs>=18' 'python>=3.11')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "${pkgname}.sh")
sha256sums=('7009caae9999993050effd9fcbb59e2c75230b9cb34c24c8deb6e89bd6888fff'
            'a9c3d8f93463b29f4a07461ec08ef46c6b3709b9cbfd1a48ddeb98f26a370ae4')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    if [ -d .git ];then
        rmdir .git && mkdir .git
    else
        mkdir .git
    fi
    yarn install
    sed '/deb/d' -i electron-builder.json
    yarn electron-rebuild
    node scripts/download-pandoc.js
    node scripts/download-plantuml.js
    yarn build
    yarn run electron-builder --linux -p never | sed 's/identityName=.*$//'
    asar e "${srcdir}/${_pkgname}-${pkgver//_/-}/out/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${_pkgname}-${pkgver//_/-}/out/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/src/main/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}