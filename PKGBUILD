# Maintainer: Core_UK <dev@coredev.uk>

pkgname=cider
_pkgname=Cider
_pkgbranch=stable
pkgver=1.6.0
pkgrel=5
pkgdesc="Project Cider. An open-source Apple Music client built from the ground up with Vue.js and Electron. Compiled from the GitHub repositories ${_pkgbranch} branch."
arch=("armv7h" "i686" "x86_64")
url="https://github.com/ciderapp/${_pkgname}.git"
license=("GPL")
depends=('gtk3' 'nss')
makedepends=('git' 'npm' 'pnpm' 'python')
optdepends=('libnotify: Playback notifications')
source=(
    "git+https://github.com/CiderApp/${_pkgname}.git#branch=${_pkgbranch}"
    "cider.desktop"
)
sha256sums=('SKIP'
    'c41e9b1019411019fce8509e32f770edf33c9e864bf707c30ffe2e3f2dcf1571')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    chmod +x ./resources/version.sh
    GITHUB_REF_NAME=${_pkgbranch} ./resources/version.sh | sed 's/\-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    git submodule update --init --recursive

    echo "store-dir=.pnpm-store" >>.npmrc

    echo "Building ${_pkgname} on v${pkgver} : [Install Build Dependencies] | Build | Done"
    pnpm install --frozen-lockfile

    echo "Building : Install Build Dependencies | [Build] | Done"
    pnpm dist --linux dir

    echo "Building : Install Build Dependencies | Build | [Done]"
}

package() {
    cd "${srcdir}/${_pkgname}"

    # Desktop File
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    # Install the icon
    install -Dm644 "${srcdir}/${_pkgname}/resources/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"
    # Install the build files
    install -d "$pkgdir/opt/"
    install -d "$pkgdir/usr/bin/"
    cd ${srcdir}/${_pkgname}/dist/linux-unpacked
    mkdir "${pkgdir}/opt/${pkgname%-git}"
    cp -r --preserve=mode * "${pkgdir}/opt/${pkgname%-git}"
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    # License and Readme
    install -d "$pkgdir/usr/share/licenses" "$pkgdir/usr/share/doc"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
