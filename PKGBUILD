pkgname=proton-authenticator-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Proton Authenticator is an open-source TOTP authenticator from Proton (prebuilt binary)"
arch=('x86_64')
url="https://proton.me/authenticator"
license=('GPL3')
depends=('glibc')
provides=('proton-authenticator')
conflicts=('proton-authenticator')
source=("https://proton.me/download/authenticator/linux/ProtonAuthenticator_${pkgver}_amd64.deb")
sha256sums=('SKIP')  # Use the real hash if desired

package() {
    ar x ProtonAuthenticator_${pkgver}_amd64.deb
    bsdtar -xf data.tar.gz -C "${pkgdir}"

    # Desktop entry fix
    install -Dm644 "${pkgdir}/opt/ProtonAuthenticator/ProtonAuthenticator.desktop" \
      "${pkgdir}/usr/share/applications/proton-authenticator.desktop"

    # Adjust Exec and Icon fields
    sed -i \
      -e 's|^Exec=.*|Exec=/opt/ProtonAuthenticator/ProtonAuthenticator|' \
      -e 's|^Icon=.*|Icon=proton-authenticator|' \
      "${pkgdir}/usr/share/applications/proton-authenticator.desktop"

    # Install icon (assumes it's named icon.png, adjust if needed)
    if [[ -f "${pkgdir}/opt/ProtonAuthenticator/icon.png" ]]; then
        install -Dm644 "${pkgdir}/opt/ProtonAuthenticator/icon.png" \
          "${pkgdir}/usr/share/icons/hicolor/256x256/apps/proton-authenticator.png"
    fi

    # Optional: Add launcher to PATH
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/ProtonAuthenticator/ProtonAuthenticator \
      "${pkgdir}/usr/bin/proton-authenticator"
}

