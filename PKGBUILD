# Maintainer: molivier <martin dot olivier at live dot fr>

pkgname=airgorah
pkgver=0.8.1
pkgrel=1
pkgdesc="A WiFi security auditing software mainly based on aircrack-ng tools suite"
arch=("any")
url="https://github.com/martin-olivier/airgorah"
license=("MIT")

source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e86aaf8c60615050beffedec8880842d7f9e3b86855f9b901210246d4dd8d079')

provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")

depends=(
    'bash'
    'dbus'
    'xterm'
    'polkit'
    'gtk4'
    'aircrack-ng'
    'iproute2'
    'iw'
    'macchanger'
    'wireshark-cli'
    'adwaita-icon-theme'
)
optdepends=(
    'mdk4: alternative deauthentication method'
    'crunch: wordlist generation for handshake bruteforce'
)
makedepends=(
    'base-devel'
    'rust'
    'gtk4'
    'glib2'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm755 "target/release/${pkgname}-agent" -t "${pkgdir}/usr/bin"
    install -Dm644 "crates/gui/icons/app_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -Dm644 "package/.desktop" "${pkgdir}/usr/share/applications/com.molivier.${pkgname}.desktop"
    install -Dm644 "package/.policy" "${pkgdir}/usr/share/polkit-1/actions/org.freedesktop.policykit.${pkgname}.policy"

    install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
