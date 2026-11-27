# Maintainer: AChep <artemchep at gmail dot com>

pkgname=keyguard-bin
pkgver=3.10.0
pkgrel=1
pkgdesc='Multi-client for the Bitwarden® platform and KeePass (KDBX), designed to provide the best user experience possible.'
arch=('x86_64' 'aarch64')
url='https://github.com/AChep/keyguard-app'
license=('LicenseRef-proprietary')
depends=('hicolor-icon-theme')
provides=('keyguard')
conflicts=('keyguard')
options=('!strip')
_releaseTag='r20261127'
source_x86_64=("https://github.com/AChep/keyguard-app/releases/download/${_releaseTag}/Keyguard-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/AChep/keyguard-app/releases/download/${_releaseTag}/Keyguard-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('eba6f337e1ce3f4bb585b2eb8a66c796ace05999ca08675ae3b57269cec8bd81')
sha256sums_aarch64=('c1ed67fb14d3e8d505ec114d6bd700e21f4ed96e44be322b4f920e70028ed236')

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
