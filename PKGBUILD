# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-service-manager
pkgver=26.03
pkgrel=1
pkgdesc="GUI service management tool"
arch=('x86_64' 'i686')
url="https://github.com/mx-linux/mx-service-manager"
license=('GPL3')
depends=('qt6-base' 'polkit' 'systemd')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/mx-linux/mx-service-manager/archive/refs/tags/26.03.tar.gz")
sha256sums=('51af2d0b1753cc149c6fa7656600a9dee331192614eafe408ff60ff80b1b45c7')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    rm -rf build

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}"

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 build/mx-service-manager "${pkgdir}/usr/bin/mx-service-manager"

    install -dm755 "${pkgdir}/usr/share/mx-service-manager/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/mx-service-manager/locale/" 2>/dev/null || true

    install -Dm644 mx-service-manager.desktop "${pkgdir}/usr/share/applications/mx-service-manager.desktop"

    install -Dm644 mx-service-manager.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/mx-service-manager.png"
    install -Dm644 mx-service-manager.png "${pkgdir}/usr/share/pixmaps/mx-service-manager.png"

    install -dm755 "${pkgdir}/usr/lib/mx-service-manager"
    install -Dm755 build/helper "${pkgdir}/usr/lib/mx-service-manager/helper"

    install -dm755 "${pkgdir}/usr/share/polkit-1/actions"
    install -Dm644 scripts/org.mxlinux.pkexec.mxsm-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mxsm-helper.policy"

    install -dm755 "${pkgdir}/usr/share/doc/mx-service-manager"
    if [ -d docs ]; then
        cp -r docs/* "${pkgdir}/usr/share/doc/mx-service-manager/" 2>/dev/null || true
    fi

    if [ -f debian/changelog ]; then
        gzip -c debian/changelog > "${pkgdir}/usr/share/doc/mx-service-manager/changelog.gz"
    fi

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
