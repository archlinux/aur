# Maintainer: Jikstra <jikstra@disroot.org>
pkgname=deltachat-desktop-git
pkgver=v0.90.1.r20.gb24fb2b
pkgrel=1
pkgdesc="A privacy oriented chat application built on e-mail"
arch=("any")
url="https://github.com/deltachat/deltachat-desktop"
license=("GPL")
depends=('openssl' 'sqlite' 'libsasl' 'zlib' 'bzip2' 'electron')
makedepends=("npm" "git")
source=(
    "deltachat-desktop-git::git://github.com/deltachat/deltachat-desktop.git"
    "deltachat-desktop.desktop"
    "deltachat-desktop.sh"
)

sha256sums=(
    "SKIP"
    "5772cf1942bd4fb1ecddfff4a4ad4783140960b1d109861908567fbd0fc3a553"
    "eba972f8f3920d3328805373efac345e6e112ed9cf0f5d2ee72a6b6d9089fe65"
)


pkgver() {
    cd "$srcdir/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
    cd "$srcdir/${pkgname}"

    npm install
    npm run build
    
    # Delete development dependencies, we don't need them anymore
    npm prune --production    
}


package() {
    cd "$srcdir/${pkgname}"
    
    install -d "${pkgdir}/opt/DeltaChat/electron_app"
    cp -r node_modules  images src build static _locales "${pkgdir}/opt/DeltaChat/electron_app"
    cp index.js package.json "${pkgdir}/opt/DeltaChat/electron_app"
    
    install -d "${pkgdir}/opt/DeltaChat/electron_app/conversations"
    cp -r conversations/build "${pkgdir}/opt/DeltaChat/electron_app/conversations"
    
    install -Dm644 "${srcdir}/deltachat-desktop.desktop" "${pkgdir}/usr/share/applications/deltachat.desktop"
    install -Dm755 "${srcdir}/deltachat-desktop.sh" "${pkgdir}/opt/DeltaChat/deltachat"
    install -d "${pkgdir}/usr/bin"
    ln -s "${pkdir}/opt/DeltaChat/deltachat" "${pkgdir}/usr/bin/deltachat"
    
    install -Dm644 ./images/deltachat.png "${pkgdir}/usr/share/icons/hicolor/scalable/apps/deltachat.png"
}
 
