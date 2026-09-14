# Maintainer: AChep <artemchep at gmail dot com>

pkgname=keyguard-bin
pkgver=3.2.2
pkgrel=1
pkgdesc='Multi-client for the Bitwarden® platform and KeePass (KDBX), designed to provide the best user experience possible.'
arch=('x86_64' 'aarch64')
url='https://github.com/AChep/keyguard-app'
license=('LicenseRef-proprietary')
depends=('hicolor-icon-theme')
provides=('keyguard')
conflicts=('keyguard')
options=('!strip')
_releaseTag='r20260914'
source_x86_64=("https://github.com/AChep/keyguard-app/releases/download/${_releaseTag}/Keyguard-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/AChep/keyguard-app/releases/download/${_releaseTag}/Keyguard-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('9bbe3b3f678b26066170dacebb46a4765d87ef5eacc586640eec44894e83f9b3')
sha256sums_aarch64=('711f6c115da36da11a7b77e1aceffdfb2c952efd8bb1572e51b423f1f7826f8c')

package() {
    cd Keyguard

    # Install application to /opt/keyguard
    install -dm755 "${pkgdir}/opt/keyguard"
    cp -a bin lib "${pkgdir}/opt/keyguard/"

    # Explicitly mark the binary as executable.
    chmod +x "${pkgdir}/opt/keyguard/bin/Keyguard"

    # Symlink binary to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/keyguard/bin/Keyguard "${pkgdir}/usr/bin/keyguard"

    # Install desktop file (patch Exec to use our symlink name)
    install -Dm644 share/applications/com.artemchep.keyguard.desktop \
        "${pkgdir}/usr/share/applications/com.artemchep.keyguard.desktop"
    sed -i 's|^Exec=Keyguard|Exec=keyguard|' \
        "${pkgdir}/usr/share/applications/com.artemchep.keyguard.desktop"

    # Install icon
    install -Dm644 share/icons/hicolor/scalable/apps/com.artemchep.keyguard.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.artemchep.keyguard.svg"
}
