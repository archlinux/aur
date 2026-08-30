# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=quick-system-info-gui
pkgver=26.02arch
pkgrel=1
pkgdesc="A utility to show quick-system-info (inxi, etc...) in a gui"
arch=('x86_64' 'i686')
url="https://github.com/MX-Linux/quick-system-info-gui"
license=('GPL3')
depends=('qt6-base' 'libarchive' 'polkit' 'inxi')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/quick-system-info-gui/archive/refs/tags/26.02arch.tar.gz")
sha256sums=('3d2d081d83a3b65b7e95ef2fd5bd955179ceb057e2977c9a53ff3a9d20003689')

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

    install -Dm755 build/quick-system-info-gui "${pkgdir}/usr/bin/quick-system-info-gui"

    install -dm755 "${pkgdir}/usr/share/quick-system-info-gui/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/quick-system-info-gui/locale/" 2>/dev/null || true

    install -Dm644 Quick_System_Info.desktop "${pkgdir}/usr/share/applications/Quick_System_Info.desktop"

    install -Dm644 icons/mx-qsi.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/mx-qsi.png"

    install -dm755 "${pkgdir}/usr/lib/quick-system-info-gui"
    install -Dm755 lib/qsig-lib "${pkgdir}/usr/lib/quick-system-info-gui/qsig-lib"
    install -Dm755 lib/qsig-lib-list "${pkgdir}/usr/lib/quick-system-info-gui/qsig-lib-list"

    install -dm755 "${pkgdir}/usr/share/polkit-1/actions"
    install -Dm644 actions/org.mxlinux.quick-system-info-gui.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.quick-system-info-gui.policy"

    install -dm755 "${pkgdir}/usr/share/doc/quick-system-info-gui"

    install -Dm644 "${srcroot}/help"/*.1 "${pkgdir}/usr/share/man/man1/" 2>/dev/null || true
    for help_file in help/*.html help/*.jpg help/*.png help/*.css; do
        [ -f "$help_file" ] && install -Dm644 "$help_file" "${pkgdir}/usr/share/doc/quick-system-info-gui//$(basename "$help_file")"
    done

    if [ -f debian/changelog ]; then
        gzip -c debian/changelog > "${pkgdir}/usr/share/doc/quick-system-info-gui/changelog.gz"
    fi

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
