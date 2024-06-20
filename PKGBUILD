# Maintainer: devome <evinedeng@hotmail.com>

pkgname="restic-browser"
pkgver=0.3.1
pkgrel=1
pkgdesc="A GUI to browse and restore restic backup repositories."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/emuell/${pkgname}"
provides=("${pkgname}")
conflicts=("${pkgname}")
license=("MIT")
depends=("restic" "webkit2gtk")
makedepends=("appmenu-gtk-module" "cargo" "gtk3" "libappindicator-gtk3" "librsvg" "libvips" "nodejs" "npm" "restic" "webkit2gtk")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('bbad8cf99e11a32f30491625b956ef1f22f39d1973ada4988c9202f2e194870a'
            '74e63083d076cdd3f5de3917e5c242b40e61119fbc3aaac013607b63824a8f71')

build() {
    cd "${pkgname}-${pkgver}"
    npm ci --cache cache
    npm run --cache cache tauri build
}

package() {
    install -Dm644 "${pkgname}.desktop"                  "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    cd "${pkgname}-${pkgver}"
    install -Dm755 "src-tauri/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "src-tauri/icons/icon.png"            "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -Dm644 LICENSE                               "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md                             "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
