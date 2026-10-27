# Maintainer: AChep <artemchep at gmail dot com>

pkgname=keyguard-bin
pkgver=3.6.0
pkgrel=1
pkgdesc='Multi-client for the Bitwarden® platform and KeePass (KDBX), designed to provide the best user experience possible.'
arch=('x86_64' 'aarch64')
url='https://github.com/AChep/keyguard-app'
license=('LicenseRef-proprietary')
depends=('hicolor-icon-theme')
provides=('keyguard')
conflicts=('keyguard')
options=('!strip')
_releaseTag='r20261027'
source_x86_64=("https://github.com/AChep/keyguard-app/releases/download/${_releaseTag}/Keyguard-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/AChep/keyguard-app/releases/download/${_releaseTag}/Keyguard-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('a8d66e364d5a20d5a378a82e7bb16f8d39214483a6b66fbc8b69a732fe16c6d3')
sha256sums_aarch64=('6a248f05619fa97fbf049db8301ec87bf655e63bc876cca30de35925a1d87297')

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
