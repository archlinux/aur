# Maintainer: Ary Kleinerman <kleinerman at gmail dot com>
#
pkgname=yubico-authenticator-bin
pkgver=6.1.0
pkgdesc="Yubico Authenticator 6 is a cross-platform application for managing your YubiKey's second factor credentials.\
Yubico Authenticator 6 is a complete rewrite of the application using the Flutter framework."
arch=('x86_64')
url="https://developers.yubico.com/yubioath-flutter/"
license=('GPL')
depends=('ccid')
pkgrel=1

source=(
    "https://developers.yubico.com/yubioath-flutter/Releases/yubico-authenticator-${pkgver}-linux.tar.gz"{,.sig}
)

validpgpkeys=(
    '20EE325B86A81BCBD3E56798F04367096FBA95E8'
)

sha256sums=('be686148475d642027d6126ea0984578aa2c22a179a565dc24b81b72ea457417'
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
    mkdir -p "$pkgdir/opt/yubico-authenticator"
    ls -1 "${srcdir}"/yubico-authenticator-"${pkgver}"-linux | grep -v "linux_support\|desktop_integration.sh\|README.adoc" | xargs -I{} cp -r "${srcdir}"/yubico-authenticator-"${pkgver}"-linux/{} "$pkgdir/opt/yubico-authenticator"
    install -Dm644 "${srcdir}"/yubico-authenticator-"${pkgver}"-linux/linux_support/com.yubico.authenticator.desktop "${pkgdir}"/usr/share/applications/com.yubico.authenticator.desktop
    install -Dm644 "${srcdir}"/yubico-authenticator-"${pkgver}"-linux/linux_support/com.yubico.yubioath.png "${pkgdir}"/usr/share/pixmaps/com.yubico.yubioath.png
}
