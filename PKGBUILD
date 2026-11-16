# Maintainer: AChep <artemchep at gmail dot com>

pkgname=keyguard-bin
pkgver=3.8.2
pkgrel=1
pkgdesc='Multi-client for the Bitwarden® platform and KeePass (KDBX), designed to provide the best user experience possible.'
arch=('x86_64' 'aarch64')
url='https://github.com/AChep/keyguard-app'
license=('LicenseRef-proprietary')
depends=('hicolor-icon-theme')
provides=('keyguard')
conflicts=('keyguard')
options=('!strip')
_releaseTag='r20261116'
source_x86_64=("https://github.com/AChep/keyguard-app/releases/download/${_releaseTag}/Keyguard-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/AChep/keyguard-app/releases/download/${_releaseTag}/Keyguard-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('0854ae233f67c64a1b1dfaf50a1e0d79256df67eae92b9b31a0c36b5dc36c7f7')
sha256sums_aarch64=('6bc2e0a5b3e05b3cb03edbba55ce3cbbe1d2398ee63c1eba52278e445ca1926f')

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

    # Install desktop integration, AppStream metadata, and polkit policy.
    install -dm755 "${pkgdir}/usr"
    cp -a share "${pkgdir}/usr/"

    # Match the launcher installed in /usr/bin.
    sed -i 's|^Exec=Keyguard|Exec=keyguard|' \
        "${pkgdir}/usr/share/applications/com.artemchep.keyguard.desktop"
    sed -i 's|<binary>Keyguard</binary>|<binary>keyguard</binary>|' \
        "${pkgdir}/usr/share/metainfo/com.artemchep.keyguard.metainfo.xml"
}
