# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-boot-repair
pkgver=26.07
pkgrel=1
pkgdesc="GUI tool for repairing GRUB bootloader"
arch=('x86_64' 'i686')
url="https://mxlinux.org"
license=('GPL3')
depends=('efibootmgr' 'qt6-base' 'polkit')
provides=('mx-boot-repair')
conflicts=('mx-boot-repair')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/mx-bootrepair/archive/refs/tags/26.07.tar.gz")
sha256sums=('a7653fb7f0818faf8bb8fef029788b85f0f8b137e86379b657459add0a5f3e94')

build() {
    cd "$srcdir/mx-bootrepair-$pkgver"

    # Clean any previous build artifacts
    rm -rf build

    # Arch packages build from release tarballs, so pass pkgver explicitly.
    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DHELPER_INSTALL_DIR=/usr/lib/mx-boot-repair \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}"

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

    # Install helper components
    install -dm755 "${pkgdir}/usr/lib/mx-boot-repair"
    install -Dm755 build/helper "${pkgdir}/usr/lib/mx-boot-repair/helper"

    # Install PolicyKit policy
    install -Dm644 build/org.mxlinux.pkexec.mxbr-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mxbr-helper.policy"

    # Install desktop file
    install -Dm644 mx-boot-repair.desktop "${pkgdir}/usr/share/applications/mx-boot-repair.desktop"

    # Install icons
    install -Dm644 icons/mx-boot-repair.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/mx-boot-repair.png"
    install -Dm644 icons/mx-boot-repair.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-boot-repair.svg"

    # Install man page
    install -Dm644 man/mx-boot-repair.1 "${pkgdir}/usr/share/man/man1/mx-boot-repair.1"

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
