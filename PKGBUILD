# Maintainer: Ary Kleinerman <kleinerman at gmail dot com>
#
pkgname=yubico-authenticator-bin
pkgver=6.4.0
pkgdesc="Yubico Authenticator 6 is a cross-platform application for managing your YubiKey's second factor credentials.\
Yubico Authenticator 6 is a complete rewrite of the application using the Flutter framework."
arch=('x86_64')
url="https://github.com/Yubico/yubioath-flutter"
license=('GPL')
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

sha256sums=('a28fd33db6f9e3074e565caa7428869cd4b4b663ea009835c6a8cd71f15473a7'
            'SKIP')

prepare() {
    echo -e "\n\033[0;32mINSTALLATION NOTE:\n"
    echo -e "If installation fails with 'One or more PGP signatures could not be verified', then install the key with:\n"
    echo -e "  gpg --recv-keys 20EE325B86A81BCBD3E56798F04367096FBA95E8\n"
    echo -e "Then retry the installation.\033[0m\n"
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
