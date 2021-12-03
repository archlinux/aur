# Maintainer: tercean <cg@zknt.org>
pkgname=deltachat-desktop
pkgver=1.25.1
pkgrel=1
pkgdesc="A privacy oriented chat application built on e-mail"
arch=("any")
url="https://github.com/deltachat/deltachat-desktop"
license=("GPL")
depends=('electron')
makedepends=('npm' 'nodejs' 'rustup' 'python' 'unzip')
conflicts=("deltachat-desktop-git")
source=(
    "deltachat-desktop-${pkgver}.tar.gz::https://github.com/deltachat/deltachat-desktop/archive/v${pkgver}.tar.gz"
    "deltachat-desktop.desktop"
    "deltachat-desktop.sh"
    "static_build_info.patch"
)

sha256sums=('3a10ea8939deccf2a9544767866b4afe87b671c2f4d168d5daa5faa734e5d804'
            '39bae164c234b3c89e7ae2bde89753c90065df7f37fece084f7f5acccbb9f1f1'
            'c7d2c3675faa09bb568b7f7c10779971783b1a4f11a225db8b2846fc1a6b4e14'
            '2ddd8fb8c6ace3481065f444a77d08ca4698abdfc7426402713c06b8063a2e14')

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
