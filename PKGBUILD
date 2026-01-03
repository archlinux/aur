# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=uefi-manager
pkgver=26.01
pkgrel=1
pkgdesc="A graphical tool for managing UEFI boot entries"
pkgver=26.01
arch=('x86_64' 'i686')
url="https://mxlinux.org"
license=('GPL3')
depends=('efibootmgr' 'qt6-base' 'polkit')
provides=('uefi-manager')
conflicts=('uefi-manager')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/uefi-manager/archive/refs/tags/26.01.tar.gz")
sha256sums=('f35f9a18888384eb22b1a80e030109e8b088607882e28eaab23f8422fcd3fac5')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Get version from pkgver (strip any extra pkgver info for CMake)
    _version="${pkgver}"

    # Flag Arch packaging builds for CMake
    export UEFI_MANAGER_ARCH_BUILD=1

    # Clean any previous build artifacts
    rm -rf build

    # Configure with CMake, passing version override (Arch uses git tags, not debian/changelog)
    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="$_version"

    # Build
    cmake --build build --parallel
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install binary
    install -Dm755 build/uefi-manager "${pkgdir}/usr/bin/uefi-manager"

    # Install translations
    install -dm755 "${pkgdir}/usr/share/uefi-manager/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/uefi-manager/locale/" 2>/dev/null || true

    # Install helper scripts
    install -dm755 "${pkgdir}/usr/lib/uefi-manager"
    install -Dm755 scripts/helper "${pkgdir}/usr/lib/uefi-manager/helper"
    install -Dm755 scripts/uefimanager-lib "${pkgdir}/usr/lib/uefi-manager/uefimanager-lib"

    # Install PolicyKit policy
    install -Dm644 scripts/org.mxlinux.pkexec.mx-uefimanager-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mx-uefimanager-helper.policy"

    # Install desktop file
    install -Dm644 uefi-manager.desktop "${pkgdir}/usr/share/applications/uefi-manager.desktop"

    # Install icons
    install -Dm644 uefi-manager.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/uefi-manager.png"
    install -Dm644 uefi-manager.png "${pkgdir}/usr/share/pixmaps/uefi-manager.png"
    install -Dm644 uefi-manager.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/uefi-manager.svg"

    # Install documentation
    install -dm755 "${pkgdir}/usr/share/doc/uefi-manager"
    if [ -d docs ]; then
        cp -r docs/license.html "${pkgdir}/usr/share/doc/uefi-manager/" 2>/dev/null || true
    fi

    # Install man page
    install -Dm644 docs/uefi-manager.1 "${pkgdir}/usr/share/man/man1/uefi-manager.1"

    # Install changelog
    gzip -c debian/changelog > "${pkgdir}/usr/share/doc/uefi-manager/changelog.gz"
}
