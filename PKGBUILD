# Maintainer: David Meents <dmeents@pm.me>
pkgname=poe2-overlord-bin
pkgver=0.0.5
pkgrel=1
pkgdesc='A powerful companion app for Path of Exile 2'
arch=('x86_64')
url='https://github.com/dmeents/poe2-overlord'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'openssl' 'libappindicator-gtk3')
provides=('poe2-overlord')
conflicts=('poe2-overlord')
options=('!strip' '!debug')

# Tauri v2 normalizes spaces to dots in bundle filenames (productName "POE2 Overlord" → "POE2.Overlord").
source=("${pkgname}-${pkgver}.deb::https://github.com/dmeents/poe2-overlord/releases/download/v${pkgver}/POE2.Overlord_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"

    # A .deb is an ar archive containing control.tar.* and data.tar.*
    bsdtar -xf "${pkgname}-${pkgver}.deb"

    # Extract the data archive (may be .gz, .xz, or .zst depending on Tauri version)
    bsdtar -xf data.tar.* -C "${pkgdir}/"

    # Ensure the binary is executable
    chmod 755 "${pkgdir}/usr/bin/poe2-overlord"

    # Install license
    install -Dm644 "${pkgdir}/usr/share/doc/poe2-overlord/copyright" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
