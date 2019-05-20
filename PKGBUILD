# Maintainer: Jikstra <jikstra@disroot.org>
pkgname=deltachat-desktop-git
pkgver=v0.102.0.dev.rpgp.r122.g0e3f738
pkgrel=1
pkgdesc="A privacy oriented chat application built on e-mail"
arch=("any")
url="https://github.com/deltachat/deltachat-desktop"
license=("GPL")
depends=('nodejs>=11.14.0-1' 'openssl>=1.0' 'sqlite' 'libsasl' 'zlib' 'bzip2' 'rpgp-git')
makedepends=('npm' 'git' 'meson' 'ninja')
source=(
    "deltachat-desktop-git::git://github.com/deltachat/deltachat-desktop.git"
    "deltachat-desktop.desktop"
    "deltachat-desktop.sh"
)

sha256sums=(
    "SKIP"
    "5772cf1942bd4fb1ecddfff4a4ad4783140960b1d109861908567fbd0fc3a553"
    "a0e3e682621f644133f21cf1844da6661378d1065f28e0dfd25f4636a6ca6dc2"
)


pkgver() {
    cd "$srcdir/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
    cd "$srcdir/${pkgname}"

    npm install --verbose
    npm run build

    # Save electron. this will otherwise get removed by the prune command
    mkdir -p tmp_node_modules
    mkdir -p tmp_node_modules/.bin
    mv node_modules/electron tmp_node_modules

    # Delete development dependencies, we don't need them anymore
    npm prune --production 

    # Put back electron
    mv tmp_node_modules/* node_modules
    rm -rf tmp_node_modules
}


package() {
    cd "$srcdir/${pkgname}"
    
    install -d "${pkgdir}/opt/DeltaChat/electron_app"
    cp -r node_modules  images src build static _locales "${pkgdir}/opt/DeltaChat/electron_app"
    cp index.js package.json "${pkgdir}/opt/DeltaChat/electron_app"
    
    install -Dm644 "${srcdir}/deltachat-desktop.desktop" "${pkgdir}/usr/share/applications/deltachat.desktop"
    install -Dm755 "${srcdir}/deltachat-desktop.sh" "${pkgdir}/opt/DeltaChat/deltachat"
    install -d "${pkgdir}/usr/bin"
    ln -s "${pkdir}/opt/DeltaChat/deltachat" "${pkgdir}/usr/bin/deltachat"
    
    install -Dm644 ./images/deltachat.png "${pkgdir}/usr/share/icons/hicolor/scalable/apps/deltachat.png"
}
 
