# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-user
pkgver=26.07
pkgrel=1
pkgdesc="Simple user configuration tool"
arch=('x86_64')
url="https://github.com/MX-Linux/mx-user"
license=('GPL3')
depends=('qt6-base' 'polkit' 'rsync' 'shadow')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/mx-user/archive/refs/tags/26.07.tar.gz")
sha256sums=('fa548a6afca91ff8a73456df50ed5dcdfd0bbdd22b5a2616ca342d65985f89d0')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    rm -rf build

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DENABLE_ZXCVBN=OFF \
        -DBUILD_FOR_ARCH=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}"

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 build/mx-user "${pkgdir}/usr/bin/mx-user"

    install -dm755 "${pkgdir}/usr/share/mx-user/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/mx-user/locale/" 2>/dev/null || true

    install -dm755 "${pkgdir}/usr/lib/mx-user"
    install -Dm755 build/helper "${pkgdir}/usr/lib/mx-user/helper"

    install -Dm644 scripts/org.mxlinux.pkexec.mx-user-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mx-user-helper.policy"

    install -Dm644 mx-user.desktop "${pkgdir}/usr/share/applications/mx-user.desktop"

    install -Dm644 icons/mx-user.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mx-user.png"
    install -Dm644 icons/mx-user.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-user.svg"

    install -dm755 "${pkgdir}/usr/share/doc/mx-user"
    if [ -d help ]; then
        cp -r help/* "${pkgdir}/usr/share/doc/mx-user/" 2>/dev/null || true
    fi

    # Install changelog
    if [ -f debian/changelog ]; then
        gzip -c debian/changelog > "${pkgdir}/usr/share/doc/mx-user/changelog.gz"
    fi
}
