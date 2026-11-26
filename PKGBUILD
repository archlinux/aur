# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=uefi-manager
pkgver=26.11
pkgrel=1
pkgdesc="A graphical tool for managing UEFI boot entries"
arch=('x86_64' 'i686')
url="https://mxlinux.org"
license=('GPL-3.0-or-later')
depends=('efibootmgr' 'qt6-base' 'polkit')
optdepends=('cryptsetup: unlock encrypted partitions'
            'xdg-utils: open help and license links')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MX-Linux/uefi-manager/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1c2e3ffe61b68a323ed47f233d6ab523fa82f7d8d2c7bdd2aaf1a330adcec0db')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Flag Arch packaging builds for CMake
    export UEFI_MANAGER_ARCH_BUILD=1

    # Clean any previous build artifacts
    rm -rf build

    # Configure with CMake, passing version override (Arch uses git tags, not debian/changelog)
    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DHELPER_INSTALL_DIR=/usr/lib/uefi-manager \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}"

    # Build
    cmake --build build --parallel
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install binary
    install -Dm755 build/uefi-manager "${pkgdir}/usr/bin/uefi-manager"

    # Install translations
    install -Dm644 -t "${pkgdir}/usr/share/uefi-manager/locale/" build/*.qm

    # Install helper components
    install -dm755 "${pkgdir}/usr/lib/uefi-manager"
    install -Dm755 build/helper "${pkgdir}/usr/lib/uefi-manager/helper"
    install -Dm755 scripts/uefimanager-lib "${pkgdir}/usr/lib/uefi-manager/uefimanager-lib"

    # Install PolicyKit policy
    install -Dm644 build/org.mxlinux.pkexec.mx-uefimanager-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mx-uefimanager-helper.policy"

    # Install desktop file
    install -Dm644 uefi-manager.desktop "${pkgdir}/usr/share/applications/uefi-manager.desktop"

    # Install icons
    install -Dm644 uefi-manager.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/uefi-manager.png"
    install -Dm644 uefi-manager.png "${pkgdir}/usr/share/pixmaps/uefi-manager.png"
    install -Dm644 uefi-manager.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/uefi-manager.svg"

    # Install documentation
    install -Dm644 docs/license.html "${pkgdir}/usr/share/doc/uefi-manager/license.html"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install man page
    install -Dm644 docs/uefi-manager.1 "${pkgdir}/usr/share/man/man1/uefi-manager.1"

    # Install changelog
    gzip -c debian/changelog > "${pkgdir}/usr/share/doc/uefi-manager/changelog.gz"
}
