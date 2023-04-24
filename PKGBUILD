# Maintainer: Ary Kleinerman <kleinerman at gmail dot com>
#
pkgname=yubico-authenticator-bin
pkgver=6.2.0
pkgdesc="Yubico Authenticator 6 is a cross-platform application for managing your YubiKey's second factor credentials.\
Yubico Authenticator 6 is a complete rewrite of the application using the Flutter framework."
arch=('x86_64')
url="https://developers.yubico.com/yubioath-flutter/"
license=('GPL')
depends=('ccid')
options=(!strip)
optdepends=('gnome-screenshot: QR scanning feature on GNOME'
            'spectacle: QR scanning feature on KDE')
pkgrel=1

source=(
    "https://developers.yubico.com/yubioath-flutter/Releases/yubico-authenticator-${pkgver}-linux.tar.gz"{,.sig}
)

validpgpkeys=(
    'AF511D2CBC0F973E5D308054325C8E4AE2E6437D'
)

sha256sums=('6304b8a345914fd9869fab94b3492f50706b0f536c0aeedc3404968de1766536'
            'SKIP')

prepare() {
    echo -e "\n\033[0;32mINSTALLATION NOTE:\n"
    echo -e "If installation fails with 'One or more PGP signatures could not be verified', then install the key with:\n"
    echo -e "  gpg --recv-keys AF511D2CBC0F973E5D308054325C8E4AE2E6437D\n"
    echo -e "Then retry the installation.\033[0m\n"
    sed -i 's|\(Exec="\)@EXEC_PATH|\1/opt/yubico-authenticator|' "${srcdir}"/yubioath-desktop-"${pkgver}"-linux/linux_support/com.yubico.authenticator.desktop
    sed -i 's|\(Icon=\)@EXEC_PATH/linux_support/|\1|' "${srcdir}"/yubioath-desktop-"${pkgver}"-linux/linux_support/com.yubico.authenticator.desktop
}

package() {
    mkdir -p "$pkgdir/opt/yubico-authenticator"
    ls -1 "${srcdir}"/yubioath-desktop-"${pkgver}"-linux | grep -v "linux_support\|desktop_integration.sh\|README.adoc" | xargs -I{} cp -r "${srcdir}"/yubioath-desktop-"${pkgver}"-linux/{} "$pkgdir/opt/yubico-authenticator"
    install -Dm644 "${srcdir}"/yubioath-desktop-"${pkgver}"-linux/linux_support/com.yubico.authenticator.desktop "${pkgdir}"/usr/share/applications/com.yubico.authenticator.desktop
    install -Dm644 "${srcdir}"/yubioath-desktop-"${pkgver}"-linux/linux_support/com.yubico.yubioath.png "${pkgdir}"/usr/share/pixmaps/com.yubico.yubioath.png
}
