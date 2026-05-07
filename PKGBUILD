# Maintainer: AChep <artemchep at gmail dot com>

pkgname=keyguard-bin
pkgver=2.10.0
pkgrel=1
pkgdesc='Multi-client for the Bitwarden® platform and KeePass (KDBX), designed to provide the best user experience possible.'
arch=('x86_64' 'aarch64')
url='https://github.com/AChep/keyguard-app'
license=('LicenseRef-proprietary')
depends=('hicolor-icon-theme')
provides=('keyguard')
conflicts=('keyguard')
options=('!strip')
_releaseTag='r20260507.1'
source_x86_64=("https://github.com/AChep/keyguard-app/releases/download/${_releaseTag}/Keyguard-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/AChep/keyguard-app/releases/download/${_releaseTag}/Keyguard-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('e18969a7ce7edcd1977764bf8793891eac1714a2d45522b0d76c8d269a2b1f93')
sha256sums_aarch64=('6bffd336960d7c3fc3daa984c25744adf39c7bb39372206305c33c81ab48d29f')

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
