pkgname=1password-beta

_tarver=8.1.0-60.BETA
_tar="1password-${_tarver}.x64.tar.gz"
pkgver=${_tarver//-/_}
pkgrel=60
pkgdesc="Password manager and secure wallet"
arch=('x86_64')
url='https://1password.com'
license=('LicenseRef-1Password-Proprietary')
depends=('hicolor-icon-theme')
options=(!strip)
install="1password.install"
source=(https://downloads.1password.com/linux/tar/beta/x86_64/${_tar}{,.sig})
sha256sums=('48559360d8c641ee3919dbb2f90bf42d2392a764777e7ed5cd720184df8bc1b1'
            '51eea4fd59e78737f40af60e5bb476efb1c06709567d3ebbb8130474c65c504e'
)
validpgpkeys=('3FEF9748469ADBE15DA7CA80AC2D62742012EA22')

package() {
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
