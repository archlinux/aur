# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-datetime
pkgver=26.03.1
pkgrel=2
pkgdesc="Date and time configuration tool for MX Linux"
arch=('x86_64' 'i686')
url="https://github.com/MX-Linux/mx-datetime"
license=('Apache')
depends=('chrony' 'util-linux' 'qt6-base' 'polkit')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/mx-datetime/archive/refs/tags/26.03.1.tar.gz")
sha256sums=('1609eba10926fb3e674c254858ecc67d7794a2640b1a663f0c77a33ddf2dc0e9')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    rm -rf build

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}"

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 build/mx-datetime "${pkgdir}/usr/bin/mx-datetime"

    install -dm755 "${pkgdir}/usr/share/mx-datetime/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/mx-datetime/locale/" 2>/dev/null || true

    install -dm755 "${pkgdir}/usr/lib/mx-datetime"
    install -Dm755 build/helper "${pkgdir}/usr/lib/mx-datetime/helper"

    install -Dm644 scripts/org.mxlinux.pkexec.mx-datetime-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mx-datetime-helper.policy"

    install -Dm644 mx-datetime.desktop "${pkgdir}/usr/share/applications/mx-datetime.desktop"

    install -Dm644 images/mx-datetime.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/mx-datetime.png"
    install -Dm644 images/mx-datetime.png "${pkgdir}/usr/share/pixmaps/mx-datetime.png"
    install -Dm644 images/mx-datetime.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-datetime.svg"

    install -dm755 "${pkgdir}/usr/share/doc/mx-datetime"
    if [ -f debian/changelog ]; then
        gzip -c debian/changelog > "${pkgdir}/usr/share/doc/mx-datetime/changelog.gz"
    fi
    if [ -d help ]; then
        cp -r help/* "${pkgdir}/usr/share/doc/mx-datetime/" 2>/dev/null || true
    fi
}
