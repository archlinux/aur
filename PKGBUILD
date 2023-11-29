# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simplest-file-renamer-git
pkgver=1.0.0.r72.gaa92593
pkgrel=1
pkgdesc="Rename your files directly or with your favorite text editor, making use of all your 1337 keyboard shortcuts"
arch=('any')
url="https://github.com/whyboris/Simplest-File-Renamer"
license=('MIT')
conflicts=(
    "${pkgname%-git}"
)
provides=(
    "${pkgname%-git}"
)
depends=(
    'electron27'
)
makedepends=(
    'gendesk'
    'git'
    'npm'
    'nodejs'
)
source=(
    "${pkgname%-git}"::"git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '07206f6e9f28632a195cf97706d7aefcc58c48555696b52c4ef07a792129b42c')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    gendesk -q -f -n --categories "Utility" --name="${pkgname%-git}" --exec="${pkgname%-git}"
    cd "${srcdir}/${pkgname%-git}"
    sed "s|src/assets/favicon.icns|src/assets/favicon.png|g" -i electron-builder.json
    npm install --cache "${srcdir}/npm-cache"
    npm run electron
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/release/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/src/assets/favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}