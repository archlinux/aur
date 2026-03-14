# Maintainer: Sofian Jafar <skjafar@gmail.com>
pkgname=dshub
pkgver=0.1.0
pkgrel=1
pkgdesc="Desktop application for monitoring and controlling industrial devices via TCP/UDP"
arch=('x86_64')
url="https://github.com/skjafar/dshub"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'openssl'
    'libsoup3'
    'xdg-utils'
)
makedepends=(
    'rust'
    'npm'
    'webkit2gtk-4.1'
    'libsoup3'
)
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"

    # Build the React frontend
    npm --prefix client ci
    npm --prefix client run build

    # Build the Tauri (Rust) binary
    cd src-tauri
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${pkgname}"

    # Binary
    install -Dm755 "src-tauri/target/release/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"

    # Desktop entry
    install -Dm644 "aur/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icons
    install -Dm644 "src-tauri/icons/32x32.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
    install -Dm644 "src-tauri/icons/128x128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

    # License
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
