# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yank-note
_pkgname=yn
pkgver=3.61.3
pkgrel=1
pkgdesc="A highly extensible Markdown editor. Version control, AI completion, mind map, documents encryption, code snippet running, integrated terminal, chart embedding, HTML applets, Reveal.js, plug-in, and macro replacement."
arch=('x86_64')
url="https://yank-note.com/"
_githuburl="https://github.com/purocean/yn"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron22')
makedepends=('gendesk' 'npm>=9' 'asar' 'yarn' 'nodejs>=18' 'python>=3.11')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('5866f6d26553f935800f998436460610e06639fc3061cc576242bb8e26723022'
            'a9c3d8f93463b29f4a07461ec08ef46c6b3709b9cbfd1a48ddeb98f26a370ae4')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    if [ -d .git ];then
        rmdir .git && mkdir .git
    else
        mkdir .git
    fi
    yarn install
    yarn electron-rebuild
    node scripts/download-pandoc.js
    node scripts/download-plantuml.js
    sed '/deb/d' -i electron-builder.json
    yarn build
    yarn run electron-builder --linux -p never | sed 's/identityName=.*$//'
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/out/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    cp -r "${srcdir}/${_pkgname}-${pkgver}/out/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/main/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}