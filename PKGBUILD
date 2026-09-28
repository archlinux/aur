# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-live-usb-maker
pkgver=36.03
pkgrel=1
pkgdesc="Graphical utility for creating bootable live USB drives"
arch=('x86_64' 'i686')
url="https://mxlinux.org"
license=('GPL3')
depends=(
    'qt6-base'
    'polkit'
    'parted'
    'dosfstools'
    'e2fsprogs'
    'exfatprogs'
    'xorriso'
    'rsync'
    'syslinux'
    'grub'
    'cryptsetup'
    'util-linux'
    'libarchive'
)
optdepends=('ntfs-3g: format the data partition as NTFS')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/mx-live-usb-maker/archive/refs/tags/36.03.tar.gz")
sha256sums=('a6dc8003bb30e4f74062aa19a012b57492bc9faaf3bd1257edbf14622956f4a3')

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

    install -Dm755 build/mx-live-usb-maker "${pkgdir}/usr/bin/mx-live-usb-maker"
    install -Dm755 build/mx-live-usb-maker-backend "${pkgdir}/usr/lib/mx-live-usb-maker/mx-live-usb-maker-backend"
    install -Dm755 build/helper "${pkgdir}/usr/lib/mx-live-usb-maker/helper"

    install -dm755 "${pkgdir}/usr/share/mx-live-usb-maker/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/mx-live-usb-maker/locale/" 2>/dev/null || true

    install -dm755 "${pkgdir}/usr/lib/mx-live-usb-maker"

    install -dm755 "${pkgdir}/usr/lib/mx-live-usb-maker/arch-live-usb-storage"
    install -Dm755 scripts/arch-live-usb-storage/inject-live-usb-storage.sh \
        "${pkgdir}/usr/lib/mx-live-usb-maker/arch-live-usb-storage/inject-live-usb-storage.sh"
    install -Dm755 scripts/arch-live-usb-storage/live-usb-storage \
        "${pkgdir}/usr/lib/mx-live-usb-maker/arch-live-usb-storage/live-usb-storage"
    install -Dm644 scripts/arch-live-usb-storage/live-usb-storage.service \
        "${pkgdir}/usr/lib/mx-live-usb-maker/arch-live-usb-storage/live-usb-storage.service"

    install -Dm644 scripts/org.mxlinux.pkexec.mxlum-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mxlum-helper.policy"

    install -Dm644 mx-live-usb-maker.desktop "${pkgdir}/usr/share/applications/mx-live-usb-maker.desktop"

    install -Dm644 mx-live-usb-maker.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mx-live-usb-maker.png"
    install -Dm644 mx-live-usb-maker.png "${pkgdir}/usr/share/pixmaps/mx-live-usb-maker.png"
    install -Dm644 mx-live-usb-maker.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-live-usb-maker.svg"

    install -Dm644 docs/mx-live-usb-maker.1 "${pkgdir}/usr/share/man/man1/mx-live-usb-maker.1"

    install -dm755 "${pkgdir}/usr/share/doc/mx-live-usb-maker"
    install -Dm644 authors.txt "${pkgdir}/usr/share/doc/mx-live-usb-maker/authors.txt"
    gzip -c debian/changelog > "${pkgdir}/usr/share/doc/mx-live-usb-maker/changelog.gz"
    if [ -d help ]; then
        cp -r help/* "${pkgdir}/usr/share/doc/mx-live-usb-maker/" 2>/dev/null || true
    fi
}
