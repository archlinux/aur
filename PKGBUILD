# Maintainer: Ary Kleinerman <kleinerman at gmail dot com>
#
pkgname=yubico-authenticator-bin
pkgver=7.0.0
pkgdesc="Cross-platform application for managing your YubiKey's second factor credentials (version 7)"
arch=('x86_64')
url="https://github.com/Yubico/yubioath-flutter"
license=('Apache')
depends=('ccid' 'zenity')
conflicts=('yubico-authenticator')
options=(!strip)
optdepends=('gnome-screenshot: QR scanning feature on GNOME'
            'spectacle: QR scanning feature on KDE')
pkgrel=3
source=(
    "${url}/releases/download/${pkgver}/yubico-authenticator-${pkgver}-linux.tar.gz"{,.sig}
)

validpgpkeys=(
    '20EE325B86A81BCBD3E56798F04367096FBA95E8'
)

sha256sums=('ec6bdca21ffabb0565d0d63f3e5525953dbb98b7ac2263bacea3770a18555ee5'
            'SKIP')

# If the installation fails with 'One or more PGP signatures could not be verified',
# then install the key with 'gpg --recv-keys 20EE325B86A81BCBD3E56798F04367096FBA95E8'
prepare() {
    sed -i 's|\(Exec="\)@EXEC_PATH|\1/opt/yubico-authenticator|' "${srcdir}"/yubico-authenticator-"${pkgver}"-linux/linux_support/com.yubico.authenticator.desktop
    sed -i 's|\(Icon=\)@EXEC_PATH/linux_support/|\1|' "${srcdir}"/yubico-authenticator-"${pkgver}"-linux/linux_support/com.yubico.authenticator.desktop
}

package() {
    # Install the application files
    mkdir -p "$pkgdir/opt/yubico-authenticator"
    ls -1 "${srcdir}"/yubico-authenticator-"${pkgver}"-linux | grep -v "linux_support\|desktop_integration.sh\|README.adoc" | xargs -I{} cp -r "${srcdir}"/yubico-authenticator-"${pkgver}"-linux/{} "$pkgdir/opt/yubico-authenticator"

    # Install the desktop file
    install -Dm644 "${srcdir}"/yubico-authenticator-"${pkgver}"-linux/linux_support/com.yubico.authenticator.desktop "${pkgdir}"/usr/share/applications/com.yubico.authenticator.desktop
    # Install the icon
    install -Dm644 "${srcdir}"/yubico-authenticator-"${pkgver}"-linux/linux_support/com.yubico.yubioath.png "${pkgdir}"/usr/share/pixmaps/com.yubico.yubioath.png

    # Create the symlink directory
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/yubico-authenticator/authenticator "${pkgdir}/usr/bin/yubico-authenticator"
}
