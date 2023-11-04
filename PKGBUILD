# Maintainer: molivier <martin dot olivier at live dot fr>

pkgname=airgorah
pkgver=0.6.0
pkgrel=1
pkgdesc="A WiFi auditing software that can perform deauth attacks and passwords cracking"
arch=("any")
url="https://github.com/martin-olivier/airgorah"
license=("MIT")

source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33c3f48a7e4edaeced42140e8a97c935f3e922f5c67f505ff42e43307af7ccfb')

provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")

depends=(
    'bash'
    'dbus'
    'systemd'
    'polkit'
    'gtk4'
    'aircrack-ng'
    'iproute2'
    'iw'
    'macchanger'
    'xfce4-terminal'
    'wireshark-cli'
    'mdk4'
    'adwaita-icon-theme'
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
    install -Dm644 "icons/app_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -Dm644 "package/config.toml" -t "${pkgdir}/etc/${pkgname}"
    install -Dm644 "package/.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "package/.policy" "${pkgdir}/usr/share/polkit-1/actions/org.freedesktop.policykit.${pkgname}.policy"

    install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
