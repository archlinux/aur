# Maintainer: devome <evinedeng@hotmail.com>

_binname="Restic-Browser"
pkgname="${_binname,,}"
pkgver=0.3.3
pkgrel=2
pkgdesc="A GUI to browse and restore restic backup repositories."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/emuell/${pkgname}"
provides=("${pkgname}")
conflicts=("${pkgname}")
license=("MIT")
depends=("restic" "webkit2gtk-4.1")
makedepends=("appmenu-gtk-module" "cargo" "gtk3" "jq" "libappindicator-gtk3" "librsvg" "nodejs" "npm" "openssl" "restic" "xdotool" "webkit2gtk-4.1")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('32b4b6deffb052c9d406a9e02beff1b38ff327066521041995f92927485fa70a'
            '74e63083d076cdd3f5de3917e5c242b40e61119fbc3aaac013607b63824a8f71')

prepare() {
    cd "${pkgname}-${pkgver}/src-tauri"
    jq ".bundle.active = false" tauri.conf.json > tauri.conf.json.new
    mv tauri.conf.json.new tauri.conf.json
}

build() {
    cd "${pkgname}-${pkgver}"
    npm ci
    npm run tauri build
}

package() {
    install -Dm644 "${pkgname}.desktop"                   "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    cd "${pkgname}-${pkgver}"
    install -Dm755 "src-tauri/target/release/${_binname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "src-tauri/icons/icon.png"             "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -Dm644 LICENSE                                "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md                              "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
