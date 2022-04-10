# Maintainer: tercean <cg@zknt.org>
pkgname=deltachat-desktop
pkgver=1.28.2
pkgrel=2
pkgdesc="A privacy oriented chat application built on e-mail"
arch=("any")
url="https://github.com/deltachat/deltachat-desktop"
license=("GPL")
depends=('electron14')
makedepends=('npm' 'nodejs' 'rustup' 'python' 'unzip')
conflicts=("deltachat-desktop-git")
source=(
    "deltachat-desktop-${pkgver}.tar.gz::https://github.com/deltachat/deltachat-desktop/archive/v${pkgver}.tar.gz"
    "deltachat-desktop.desktop"
    "deltachat-desktop.sh"
    "static_build_info.patch"
)
sha256sums=('bcfe4384c7600a5c888bf864dffbb0d4160f7a7371af015724d62e2eabcd7810'
            '39bae164c234b3c89e7ae2bde89753c90065df7f37fece084f7f5acccbb9f1f1'
            'c7d2c3675faa09bb568b7f7c10779971783b1a4f11a225db8b2846fc1a6b4e14'
            'f14687c0ac24b472f241d4758b07c846fecd5c84f57eaac5840b3191726bf6ce')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/static_build_info.patch"
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"

    npm install --verbose
    npm run build

    # Delete development dependencies, we don't need them anymore
    npm prune --production
}


package() {
    cd "$srcdir/${pkgname}-${pkgver}"

    install -d "${pkgdir}/opt/DeltaChat/electron_app"
    cp -r node_modules  images tsc-dist build html-dist _locales themes "${pkgdir}/opt/DeltaChat/electron_app"

    rm -rf "${pkgdir}/opt/DeltaChat/electron_app/node_modules/deltachat-node/prebuilds/win32-x64"
    rm -rf "${pkgdir}/opt/DeltaChat/electron_app/node_modules/deltachat-node/prebuilds/darwin-x64"
    find "${pkgdir}/opt/DeltaChat/electron_app/node_modules/" -name *.js.map -exec rm {} \;

    cp index.js package.json "${pkgdir}/opt/DeltaChat/electron_app"

    install -Dm644 "${srcdir}/deltachat-desktop.desktop" "${pkgdir}/usr/share/applications/deltachat.desktop"
    install -Dm755 "${srcdir}/deltachat-desktop.sh" "${pkgdir}/opt/DeltaChat/deltachat"
    install -d "${pkgdir}/usr/bin"
    ln -s "${pkdir}/opt/DeltaChat/deltachat" "${pkgdir}/usr/bin/deltachat"

    install -Dm644 ./images/deltachat.png "${pkgdir}/usr/share/icons/hicolor/scalable/apps/deltachat.png"
}
