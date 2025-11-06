# Maintainer: psi4j <116757358+psi4j@users.noreply.github.com>

pkgname=sunsetr
pkgver=0.11.1
pkgrel=1
pkgdesc="Automatic blue light filter for Hyprland, Niri, and everything Wayland"
arch=('x86_64')
url="https://github.com/psi4j/sunsetr"
license=('MIT')
depends=('wayland')
makedepends=('rust' 'cargo')
provides=('sunsetr')
conflicts=('sunsetr-bin' 'sunsetr-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('56fc9776b858d1d2b28e62cdcdff079641936d9694abb56108524475a2a51316')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install the binary
    install -Dm755 "target/release/${pkgname}" \
                    "${pkgdir}/usr/bin/${pkgname}"

    # Install the license file
    install -Dm644 "LICENSE" \
                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install the systemd user service file
    install -Dm644 "${pkgname}.service" \
                    "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    # Install README
    install -Dm644 "README.md" \
                    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

post_install() {
    echo ":: Sleep/resume detection is handled automatically via D-Bus"
}

post_upgrade() {
    # Clean up old sleep hook from previous versions (< 0.8.0)
    if [ -f "/usr/lib/systemd/system-sleep/${pkgname}-resume" ]; then
        echo ":: Removing deprecated sleep hook (sleep/resume now handled via D-Bus)"
        rm -f "/usr/lib/systemd/system-sleep/${pkgname}-resume"
    fi
}

# vim:set ts=4 sw=4 et:
