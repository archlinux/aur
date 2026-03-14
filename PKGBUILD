# Maintainer: Adrian Baumgart <adrian at abmgrt dot dev>
# Co-Maintainer: Noctiro <noctiro@gmail.com>

pkgname=keyguard
pkgver=20260313.1
pkgrel=1
pkgdesc="Keyguard is an alternative client for the Bitwarden® platform & KeePass (KDBX), created to provide the best user experience possible."
arch=('any')
url='https://github.com/AChep/keyguard-app'
license=('custom')
depends=()
makedepends=('java-environment>=21')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AChep/keyguard-app/archive/refs/tags/r${pkgver}.tar.gz")
sha256sums=('8a8311896abeffa16e892e76a384d6828804abe12010410b629cf3b1ec22197a')
options=('!strip' '!debug')

build() {
    cd "${pkgname}-app-r${pkgver}"

    # Configure build properties (matching the GitHub workflow)
    echo "" >> gradle.properties
    cat >> gradle.properties << EOF
versionDate=${pkgver}
versionRef=${pkgver}-${pkgrel}
buildkonfig.flavor=release
EOF

    # Build distributable package
    ./gradlew :desktopApp:packageReleaseDistributable --no-daemon
}

package() {
    cd "${pkgname}-app-r${pkgver}"

    # Find the generated .tar.gz file
    local tarfile=$(find desktopApp/build/distributions -name "*.tar.gz" -type f)

    if [[ -z "$tarfile" ]]; then
        error "No .tar.gz file found"
        return 1
    fi

    # Extract tar.gz to temporary directory
    mkdir -p "${srcdir}/extracted"
    tar -xzf "$tarfile" -C "${srcdir}/extracted" --strip-components=1

    # Install application files
    install -dm755 "${pkgdir}/opt"
    cp -r "${srcdir}/extracted" "${pkgdir}/opt/keyguard"

    # Create symlink to binary
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/keyguard/bin/Keyguard "${pkgdir}/usr/bin/keyguard"

    # Fix permissions for executables
    chmod +x "${pkgdir}/opt/keyguard/bin/Keyguard"
    if [[ -f "${pkgdir}/opt/keyguard/bin/keyguard" ]]; then
        chmod +x "${pkgdir}/opt/keyguard/bin/keyguard"
    fi

    # Install icon from extracted build
    install -Dm644 "${srcdir}/extracted/lib/Keyguard.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/keyguard.png"

    # Create and install .desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/keyguard.desktop" << EOF
[Desktop Entry]
Type=Application
Name=Keyguard
Comment=Alternative client for Bitwarden and KeePass
Exec=keyguard
Icon=keyguard
Terminal=false
Categories=Utility;Security;
StartupWMClass=com-artemchep-keyguard-MainKt
Keywords=password;bitwarden;keepass;vault;credentials;
EOF

    # Install license if available
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
