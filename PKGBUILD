# Maintainer: Ary Kleinerman <kleinerman at gmail dot com>
#
pkgname=yubico-authenticator-bin
pkgver=7.2.3
pkgdesc="Cross-platform application for managing your YubiKey's second factor credentials (version 7)"
arch=('x86_64')
url="https://github.com/Yubico/yubioath-flutter"
license=('Apache')
depends=('ccid' 'zenity')
conflicts=('yubico-authenticator')
options=(!strip)
optdepends=('gnome-screenshot: QR scanning feature on GNOME'
            'spectacle: QR scanning feature on KDE')
pkgrel=1
source=(
    "${url}/releases/download/${pkgver}/yubico-authenticator-${pkgver}-linux.tar.gz"{,.sig}
)

validpgpkeys=(
    '20EE325B86A81BCBD3E56798F04367096FBA95E8'
)

sha256sums=('05a6127bd58481780649026bf8dcc73020eb940512971a81d765c6c0e4a2bb7d'
            'SKIP')

# If the installation fails with 'One or more PGP signatures could not be verified',
# then install the key with 'curl https://keys.openpgp.org/vks/v1/by-fingerprint/20EE325B86A81BCBD3E56798F04367096FBA95E8 | gpg --import'
prepare() {
    DESKTOP_FILE="${srcdir}//yubico-authenticator-"${pkgver}"-linux/linux_support/com.yubico.yubioath.desktop"
    sed -i 's|\(Exec="\)@EXEC_PATH|\1/opt/yubico-authenticator|' "${DESKTOP_FILE}"
    sed -i 's|\(Icon=\)@EXEC_PATH/linux_support/|\1/usr/share/pixmaps/|' "${DESKTOP_FILE}"
    # add a new line to the desktop file at the end
    if grep -q '^StartupWMClass=' "${DESKTOP_FILE}"; then
        sed -i 's|^StartupWMClass=.*|StartupWMClass=authenticator|' "${DESKTOP_FILE}"
    else
        echo 'StartupWMClass=authenticator' >> "${DESKTOP_FILE}"
    fi
}

package() {
    # Install the application files
    mkdir -p "$pkgdir/opt/yubico-authenticator"
    ls -1 "${srcdir}"/yubico-authenticator-"${pkgver}"-linux | grep -v "linux_support\|desktop_integration.sh\|README.adoc" | xargs -I{} cp -r "${srcdir}"/yubico-authenticator-"${pkgver}"-linux/{} "$pkgdir/opt/yubico-authenticator"

    # Install the desktop file
    install -Dm644 "${srcdir}"/yubico-authenticator-"${pkgver}"-linux/linux_support/com.yubico.yubioath.desktop "${pkgdir}"/usr/share/applications/com.yubico.yubioath.desktop
    # Install the icon
    install -Dm644 "${srcdir}"/yubico-authenticator-"${pkgver}"-linux/linux_support/com.yubico.yubioath.png "${pkgdir}"/usr/share/pixmaps/com.yubico.yubioath.png

    # Create the symlink directory
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/yubico-authenticator/authenticator "${pkgdir}/usr/bin/yubico-authenticator"
}
