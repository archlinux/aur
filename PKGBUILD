# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-boot-repair
pkgver=26.02
pkgrel=1
pkgdesc="GUI tool for repairing GRUB bootloader"
arch=('x86_64' 'i686')
url="https://mxlinux.org"
license=('GPL3')
depends=('efibootmgr' 'qt6-base' 'polkit')
provides=('mx-boot-repair')
conflicts=('mx-boot-repair')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/mx-bootrepair/archive/refs/tags/26.02.tar.gz")
sha256sums=('a436e863b214c8795533f8ec7dfd800950db2ecc0ef07b01f4ce5a457b47dd9b')

build() {
    cd "$srcdir/mx-bootrepair-$pkgver"

    # Get version from pkgver
    _version="${pkgver}"

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
    cd "$srcdir/mx-bootrepair-$pkgver"

    # Install binary
    install -Dm755 build/mx-boot-repair "${pkgdir}/usr/bin/mx-boot-repair"

    # Install translations
    install -dm755 "${pkgdir}/usr/share/mx-bootrepair/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/mx-bootrepair/locale/" 2>/dev/null || true

    # Install helper scripts
    install -dm755 "${pkgdir}/usr/lib/mx-boot-repair"
    install -Dm755 scripts/helper "${pkgdir}/usr/lib/mx-boot-repair/helper"
    install -Dm755 scripts/mxbr-lib "${pkgdir}/usr/lib/mx-boot-repair/mxbr-lib"

    # Install PolicyKit policy
    install -Dm644 scripts/org.mxlinux.pkexec.mxbr-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mxbr-helper.policy"

    # Install desktop file
    install -Dm644 mx-boot-repair.desktop "${pkgdir}/usr/share/applications/mx-boot-repair.desktop"

    # Install icons
    install -Dm644 icons/mx-boot-repair.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mx-boot-repair.png"
    install -Dm644 icons/mx-boot-repair.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-boot-repair.svg"

    # Install documentation
    install -dm755 "${pkgdir}/usr/share/doc/mx-bootrepair"
    if [ -d help ]; then
        cp -r help/* "${pkgdir}/usr/share/doc/mx-bootrepair/" 2>/dev/null || true
    fi

    # Install changelog
    if [ -f debian/changelog ]; then
        gzip -c debian/changelog > "${pkgdir}/usr/share/doc/mx-bootrepair/changelog.gz"
    fi
}
