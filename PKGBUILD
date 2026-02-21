# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-boot-options
pkgver=26.02
pkgrel=1
pkgdesc="GUI for managing boot options and UEFI settings"
arch=('x86_64' 'i686')
url="https://mxlinux.org"
license=('GPL3')
depends=('qt6-base' 'polkit' 'xdg-utils')
makedepends=('cmake' 'ninja' 'qt6-tools')
optdepends=('grub: GRUB configuration support' 'plymouth: bootsplash themes')
source=("https://github.com/MX-Linux/mx-boot-options/archive/refs/tags/26.02.tar.gz")
sha256sums=('748c0e092b7b156a9374dfbd75457bb74a98118504eae5d654a0b4fee9687bc6')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    rm -rf build

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE=${pkgver}

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install binary
    install -Dm755 build/mx-boot-options "${pkgdir}/usr/bin/mx-boot-options"

    # Install translations
    install -dm755 "${pkgdir}/usr/share/mx-boot-options/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/mx-boot-options/locale/" 2>/dev/null || true

    # Install helper scripts
    install -dm755 "${pkgdir}/usr/lib/mx-boot-options"
    install -Dm755 scripts/helper "${pkgdir}/usr/lib/mx-boot-options/helper"

    # Install PolicyKit policy
    install -Dm644 scripts/org.mxlinux.pkexec.mxbo-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mxbo-helper.policy"

    # Install desktop file
    install -Dm644 mx-boot-options.desktop "${pkgdir}/usr/share/applications/mx-boot-options.desktop"

    # Install icons
    install -Dm644 images/mx-boot-options.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/mx-boot-options.png"
    install -Dm644 images/mx-boot-options.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-boot-options.svg"

    # Install documentation
    install -dm755 "${pkgdir}/usr/share/doc/mx-boot-options"
    if [ -d help ]; then
        cp -r help/* "${pkgdir}/usr/share/doc/mx-boot-options/" 2>/dev/null || true
    fi

    # Install changelog
    if [ -f debian/changelog ]; then
        gzip -c debian/changelog > "${pkgdir}/usr/share/doc/mx-boot-options/changelog.gz"
    fi
}
