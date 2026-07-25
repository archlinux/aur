# Maintainer: Hayden Parker <hayden@bounce.chat>
pkgname=bounce
pkgver=0.1.0
pkgrel=1
pkgdesc="A metadata-protecting distributed group chat application"
arch=('x86_64')
url="https://github.com/bounce-chat/bounce"
license=('MIT')
provides=("${pkgname}")
conflicts=('bounce' 'bounce-bin')
makedepends=('git' 'go')
depends=('hicolor-icon-theme' 'glibc' 'libxcursor' 'libglvnd' 'libxxf86vm' 'libxi' 'libxkbcommon' 'wayland' 'libx11' 'libxrandr' 'libxinerama')
options+=( !debug )
source=("${pkgname}::git+https://github.com/${pkgname}-chat/${pkgname}.git#tag=v${pkgver}"
        "${pkgname}-fyne::git+https://github.com/${pkgname}-chat/fyne.git"
        "${pkgname}-fyne-tools::git+https://github.com/${pkgname}-chat/tools.git")
sha256sums=('153b0585c94b1b2b979d21854938766d51b1294c28829b7e618607addb336351'
            'SKIP'
            'SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"

    git config submodule.fyne-tools.url ${srcdir}/${pkgname}-fyne-tools
    git config submodule.fyne.url ${srcdir}/${pkgname}-fyne
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${srcdir}/${pkgname}"

    go build -tags migrated_fynedo
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "pkg/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "ui/assets/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
