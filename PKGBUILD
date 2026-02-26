# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-samba-config
pkgver=26.02arch
pkgrel=1
pkgdesc="Samba configuration tool for MX Linux"
arch=('x86_64' 'i686')
url="https://github.com/MX-Linux/mx-samba-config"
license=('GPL3')
depends=('samba' 'qt6-base' 'polkit' 'xdg-utils')
makedepends=('cmake' 'ninja' 'qt6-tools')
install=mx-samba-config.install
source=("https://github.com/MX-Linux/mx-samba-config/archive/refs/tags/26.02arch.tar.gz")
sha256sums=('3467783493b6364c30c0e103305318ff6e956658e33b16663d10af159b3a4b7b')

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

    install -Dm755 build/mx-samba-config "${pkgdir}/usr/bin/mx-samba-config"

    install -dm755 "${pkgdir}/usr/share/mx-samba-config/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/mx-samba-config/locale/" 2>/dev/null || true

    install -Dm644 mx-samba-config.desktop "${pkgdir}/usr/share/applications/mx-samba-config.desktop"

    install -Dm644 images/mx-samba-config.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-samba-config.svg"

    install -dm755 "${pkgdir}/usr/lib/mx-samba-config"
    install -Dm755 scripts/mx-samba-config-lib "${pkgdir}/usr/lib/mx-samba-config/mx-samba-config-lib"
    install -Dm755 scripts/mx-samba-config-list-users "${pkgdir}/usr/lib/mx-samba-config/mx-samba-config-list-users"

    install -dm755 "${pkgdir}/usr/share/polkit-1/actions"
    install -Dm644 actions/org.mxlinux.mx-samba-config-lib.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.mx-samba-config-lib.policy"
    install -Dm644 actions/org.mxlinux.mx-samba-config-list-users.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.mx-samba-config-list-users.policy"

    install -dm755 "${pkgdir}/usr/share/doc/mx-samba-config"
    if [ -d docs ]; then
        cp -r docs/* "${pkgdir}/usr/share/doc/mx-samba-config/" 2>/dev/null || true
    fi

    if [ -f debian/changelog ]; then
        gzip -c debian/changelog > "${pkgdir}/usr/share/doc/mx-samba-config/changelog.gz"
    fi

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
