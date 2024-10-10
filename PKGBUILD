# Maintainer: Jikstra <jikstra@disroot.org>
pkgname=deltachat-desktop-git
pkgver=monorepo.testrelease.rc1.r7.gbdca27289
pkgrel=1
pkgdesc="A privacy oriented chat application built on e-mail"
arch=("any")
url="https://github.com/deltachat/deltachat-desktop"
license=("GPL")
makedepends=('pnpm' 'nodejs' 'git' 'python')
source=(
    "deltachat-desktop-git::git+https://git@github.com/deltachat/deltachat-desktop.git"
    "deltachat-desktop.desktop"
    "deltachat-desktop.sh"
    "deltachat-desktop.xml"
)

sha256sums=(
    "SKIP"
    "bdd5740b8d051fe9b4d3bace656b2475a322352f9826eb329a0daf0a7bf3a4c2"
    "3a546d9aa79e0d4faa090523e7774fded1ffdeb22995bd013e9cb40e20117dd0"
    "851a593350fa064dfcb8ea2a021dc997c908c7568c3ceb5dab6809209958b9aa"
)


pkgver() {
    cd "$srcdir/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}


build() {
    cd "$srcdir/${pkgname}"

    pnpm install --verbose

    pnpm --filter @deltachat-desktop/target-electron build4production
    pnpm --filter @deltachat-desktop/target-electron pack:generate_config
    pnpm --filter @deltachat-desktop/target-electron pack:patch-node-modules
    pnpm --filter @deltachat-desktop/target-electron pack:linux:dir
}


package() {
    cd "$srcdir/${pkgname}/packages/target-electron"
    
    install -d "${pkgdir}/opt/DeltaChat/electron_app"
    cp -r "$srcdir/${pkgname}/packages/target-electron/dist/linux-unpacked/"* "${pkgdir}/opt/DeltaChat/electron_app"

    install -Dm644 "${srcdir}/deltachat-desktop.desktop" "${pkgdir}/usr/share/applications/deltachat.desktop"
    install -Dm644 "${srcdir}/deltachat-desktop.xml" "${pkgdir}/usr/share/mime/chat.delta.desktop.xml"
    install -Dm755 "${srcdir}/deltachat-desktop.sh" "${pkgdir}/opt/DeltaChat/deltachat"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/DeltaChat/deltachat" "${pkgdir}/usr/bin/deltachat"
    
    install -Dm644 ../../images/deltachat.png "${pkgdir}/usr/share/icons/hicolor/scalable/apps/deltachat.png"
}
 
