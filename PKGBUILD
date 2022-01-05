pkgname=1password-beta

_tarver=8.5.0-79.BETA
_tar="1password-${_tarver}.x64.tar.gz"
pkgver=${_tarver//-/_}
pkgrel=79
conflicts=('1password' '1password-beta-bin')
pkgdesc="Password manager and secure wallet"
arch=('x86_64')
url='https://1password.com'
license=('LicenseRef-1Password-Proprietary')
options=(!strip)
install="1password.install"
source=(https://downloads.1password.com/linux/tar/beta/${CARCH}/${_tar}{,.sig})
sha256sums=('b620a9300f6cf3199c159b518dc754848f35978268cf7242565680fefdb1ac64'
            '07351aefd7822326f66477687e61c7b87e67559ce919ff183a04daafea669001'
)
validpgpkeys=('3FEF9748469ADBE15DA7CA80AC2D62742012EA22')

package() {
    depends=('hicolor-icon-theme' 'libgtk-3.so=0' 'nss')

    # Go to source directory
    cd "1password-${_tarver}.x64"

    # Install icons
    resolutions=(32x32 64x64 256x256 512x512)
    for resolution in "${resolutions[@]}"
    do
        install -Dm0644 "resources/icons/hicolor/${resolution}/apps/1password.png" \
            "${pkgdir}/usr/share/icons/hicolor/${resolution}/apps/1password.png"
    done
    # Install desktop file
    install -Dm0644 resources/1password.desktop -t "${pkgdir}"/usr/share/applications/
    # Install system unlock PolKit policy file
    install -Dm0644 com.1password.1Password.policy -t "${pkgdir}"/usr/share/polkit-1/actions/

    # Install examples
    install -Dm0644 resources/custom_allowed_browsers -t "${pkgdir}"/usr/share/doc/1password/examples/

    # Move package contents to /opt/1Password
    cd "${srcdir}"
    install -dm0755 "${pkgdir}"/opt
    mv "1password-${_tarver}.x64" "${pkgdir}/opt/1Password"

    # Symlink /usr/bin executable to opt
    install -dm0755 "${pkgdir}"/usr/bin
    ln -s /opt/1Password/1password "${pkgdir}"/usr/bin/1password
}
