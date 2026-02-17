# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-snapshot
pkgver=26.02.8arch
pkgrel=1
pkgdesc="A tool for creating live ISO images from running systems"
arch=('x86_64' 'i686')
url="https://mxlinux.org"
license=('GPL3')
depends=('qt6-base' 'polkit' 'squashfs-tools' 'xorriso' 'mx-iso-template-arch')
makedepends=('cmake' 'ninja' 'qt6-tools')
conflicts=('mx-remaster-live-files')
replaces=('mx-remaster-live-files')
provides=('mx-remaster-live-files=1.0.0')
source=("https://github.com/MX-Linux/mx-snapshot/archive/refs/tags/26.02.8arch.tar.gz")
sha256sums=('6bf228d62149d63befa60184e2046410f14fd476065181032f9ac9e68f8909fb')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    rm -rf build

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DGIT_TAG_VERSION=${pkgver} \
        -DARCH_BUILD=ON \
        -DBUILD_GUI=ON \
        -DBUILD_CLI=OFF

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 build/mx-snapshot "${pkgdir}/usr/bin/mx-snapshot"

    install -dm755 "${pkgdir}/usr/share/mx-snapshot/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/mx-snapshot/locale/" 2>/dev/null || true

    install -dm755 "${pkgdir}/usr/share/mx-snapshot/scripts"
    install -dm755 "${pkgdir}/usr/share/iso-snapshot-cli/scripts"
    cp -a scripts-arch/* "${pkgdir}/usr/share/mx-snapshot/scripts/"
    cp -a scripts-arch/* "${pkgdir}/usr/share/iso-snapshot-cli/scripts/"

    install -dm755 "${pkgdir}/usr/lib/mx-snapshot"
    install -Dm755 polkit/helper "${pkgdir}/usr/lib/mx-snapshot/helper"
    install -Dm755 polkit/snapshot-lib "${pkgdir}/usr/lib/mx-snapshot/snapshot-lib"

    install -dm755 "${pkgdir}/usr/share/polkit-1/actions"
    for policy in polkit/*.policy; do
        install -Dm644 "$policy" "${pkgdir}/usr/share/polkit-1/actions/$(basename "$policy")"
    done

    install -dm755 "${pkgdir}/usr/share/polkit-1/rules.d"
    install -Dm644 polkit/10-mx-snapshot-restrict.rules "${pkgdir}/usr/share/polkit-1/rules.d/10-mx-snapshot-restrict.rules"

    install -Dm644 mx-snapshot.desktop "${pkgdir}/usr/share/applications/mx-snapshot.desktop"
    install -Dm644 icons/mx-snapshot.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/mx-snapshot.png"
    install -Dm644 icons/mx-snapshot.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-snapshot.svg"
    install -Dm644 icons/mx-snapshot.png "${pkgdir}/usr/share/pixmaps/mx-snapshot.png"

    install -Dm644 mx-snapshot.conf "${pkgdir}/etc/mx-snapshot.conf"
    install -Dm644 mx-snapshot-exclude.list "${pkgdir}/etc/mx-snapshot-exclude.list"

    install -dm755 "${pkgdir}/usr/share/excludes"
    install -Dm644 mx-snapshot-exclude.list "${pkgdir}/usr/share/excludes/mx-snapshot-exclude.list"

    install -Dm644 manual/mx-snapshot.8 "${pkgdir}/usr/share/man/man8/mx-snapshot.8"

    install -dm755 "${pkgdir}/usr/share/doc/mx-snapshot"
    if [ -d docs ]; then
        cp -r docs/* "${pkgdir}/usr/share/doc/mx-snapshot/" 2>/dev/null || true
    fi

    # Install live-files (replaces mx-remaster-live-files package)
    install -dm755 "${pkgdir}/usr/share/live-files"
    cp -a live-files/files live-files/general-files "${pkgdir}/usr/share/live-files/"

    # Install changelog
    if [ -f debian/changelog ]; then
        gzip -c debian/changelog > "${pkgdir}/usr/share/doc/mx-snapshot/changelog.gz"
    fi

}
