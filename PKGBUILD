# Maintainer: tercean <cg@zknt.org>
pkgname=deltachat-desktop
pkgver=1.20.3
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
    "remove_git_submodule.patch"
    "static_build_info.patch"
)

sha256sums=('8451349b8ea3b1d6129ed0c7d707807d94813aed410098a6b5285d6ad5d4e4dc'
            '39bae164c234b3c89e7ae2bde89753c90065df7f37fece084f7f5acccbb9f1f1'
            'c7d2c3675faa09bb568b7f7c10779971783b1a4f11a225db8b2846fc1a6b4e14'
            'c7aed1aa75a83eddeca9131261eb22b5ee5ac6c7bc06d68b70bd35739563e44c'
            '006a9f3179acb79843f98701cc0ebee739817130a9c6af3603c828a3a18c4843')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/remove_git_submodule.patch"
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
