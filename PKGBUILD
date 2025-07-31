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
sha256sums=('SKIP')

package() {
    ar x ProtonAuthenticator_${pkgver}_amd64.deb
    bsdtar -xf data.tar.gz -C "${pkgdir}"

    # Create desktop entry manually
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/proton-authenticator.desktop" <<EOF
[Desktop Entry]
Name=Proton Authenticator
Comment=Secure TOTP authenticator from Proton
Exec=/opt/ProtonAuthenticator/ProtonAuthenticator
Icon=proton-authenticator
Terminal=false
Type=Application
Categories=Utility;Security;
EOF

    # Install icon if present
    if [[ -f "${pkgdir}/opt/ProtonAuthenticator/icon.png" ]]; then
        install -Dm644 "${pkgdir}/opt/ProtonAuthenticator/icon.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/proton-authenticator.png"
    fi

    # Add symlink to /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/ProtonAuthenticator/ProtonAuthenticator \
        "${pkgdir}/usr/bin/proton-authenticator"
}

