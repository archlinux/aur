# Maintainer: Jikstra <jikstra@disroot.org>
pkgname=deltachat-desktop-git
pkgver=v1.36.4.r22.g709df3cf
pkgrel=1
pkgdesc="A privacy oriented chat application built on e-mail"
arch=("any")
url="https://github.com/deltachat/deltachat-desktop"
license=("GPL")
depends=('electron22')
makedepends=('npm' 'nodejs' 'git' 'rustup' 'python')
source=(
    "deltachat-desktop-git::git+https://git@github.com/deltachat/deltachat-desktop.git"
    "deltachat-desktop.desktop"
    "deltachat-desktop.sh"
)

sha256sums=(
    "SKIP"
    "bd118380fdfea9f47de6e23445cc995a1a1fa30fe87fcb37ac2981365adadcea"
    "b857308f06369e49422bf9266694b576936034940e83b4d6d92174af3c0706c4"
)


pkgver() {
    cd "$srcdir/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "$srcdir/${pkgname}"

    npm install --verbose
    npm run build

    # Delete development dependencies, we don't need them anymore
    npm prune --production 
}


package() {
    cd "$srcdir/${pkgname}"
    
    install -d "${pkgdir}/opt/DeltaChat/electron_app"
    cp -r node_modules  images tsc-dist build html-dist _locales themes "${pkgdir}/opt/DeltaChat/electron_app"

    rm -rf "${pkgdir}/opt/DeltaChat/electron_app/node_modules/deltachat-node/prebuilds/win32-x64"
    rm -rf "${pkgdir}/opt/DeltaChat/electron_app/node_modules/deltachat-node/prebuilds/darwin-x64"
    find "${pkgdir}/opt/DeltaChat/electron_app/node_modules/" -name "*.js.map" -exec rm {} \;

    cp index.js package.json "${pkgdir}/opt/DeltaChat/electron_app"

    
    install -Dm644 "${srcdir}/deltachat-desktop.desktop" "${pkgdir}/usr/share/applications/deltachat.desktop"
    install -Dm755 "${srcdir}/deltachat-desktop.sh" "${pkgdir}/opt/DeltaChat/deltachat"
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/DeltaChat/deltachat" "${pkgdir}/usr/bin/deltachat"
    
    install -Dm644 ./images/deltachat.png "${pkgdir}/usr/share/icons/hicolor/scalable/apps/deltachat.png"
}
 
