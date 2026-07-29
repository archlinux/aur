# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-snapshot
pkgver=26.07.6
pkgrel=1
pkgdesc="A tool for creating live ISO images from running systems"
arch=('x86_64' 'i686')
url="https://mxlinux.org"
license=('GPL3')
# openssl: installed-to-live-arch hashes the demo/root passwords with
# `openssl passwd -6` in reset-accounts mode (python3 is the fallback).
# syslinux: provides isohdpfx.bin, needed for make_isohybrid=yes (the
# shipped default) to actually produce a BIOS/USB-hybrid ISO.
depends=('qt6-base' 'polkit' 'squashfs-tools' 'xorriso' 'mx-iso-template-arch' 'lsb-release' 'openssl'
         'syslinux')
optdepends=('paru: install gazelle-installer from the AUR when missing'
            'xdg-user-dirs: resolve localized Documents/Downloads/etc. paths for exclusions')
makedepends=('cmake' 'ninja' 'qt6-tools')
conflicts=('mx-remaster-live-files')
replaces=('mx-remaster-live-files')
provides=('mx-remaster-live-files=1.0.0')
# /etc/mx-snapshot.conf and the exclude list are meant to be user-edited;
# without this, pacman would overwrite local changes on every upgrade.
backup=('etc/mx-snapshot.conf' 'etc/mx-snapshot-exclude.list')
source=("https://github.com/MX-Linux/mx-snapshot/archive/refs/tags/26.07.6.tar.gz")
sha256sums=('33694d94448e4ead98fbb0497c9e3774a574b374b6f26ad1a3c9d014d6ff7062')

build() {
    cd "${srcdir}"/mx-snapshot*-"${pkgver}"

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
    cd "${srcdir}"/mx-snapshot*-"${pkgver}"

    install -Dm755 build/mx-snapshot "${pkgdir}/usr/bin/mx-snapshot"

    install -dm755 "${pkgdir}/usr/share/mx-snapshot/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/mx-snapshot/locale/" 2>/dev/null || true

    # Arch packaging is GUI-only (BUILD_CLI=OFF above); install scripts only
    # under /usr/share/mx-snapshot/, not /usr/share/iso-snapshot-cli/.
    install -dm755 "${pkgdir}/usr/share/mx-snapshot/scripts"
    cp -a scripts-arch/* "${pkgdir}/usr/share/mx-snapshot/scripts/"

    install -dm755 "${pkgdir}/usr/lib/mx-snapshot"
    install -Dm755 build/helper "${pkgdir}/usr/lib/mx-snapshot/helper"
    install -Dm755 polkit/snapshot-lib "${pkgdir}/usr/lib/mx-snapshot/snapshot-lib"

    install -dm755 "${pkgdir}/usr/share/polkit-1/actions"
    # GUI-only: install only the mx-snapshot policies. The iso-snapshot-cli
    # policies would be inert without the CLI binary on this distro.
    for policy in polkit/*mx-snapshot*.policy; do
        install -Dm644 "$policy" "${pkgdir}/usr/share/polkit-1/actions/$(basename "$policy")"
    done

    install -Dm644 mx-snapshot.desktop "${pkgdir}/usr/share/applications/mx-snapshot.desktop"
    install -Dm644 icons/mx-snapshot.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/mx-snapshot.png"
    install -Dm644 icons/mx-snapshot.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-snapshot.svg"
    install -Dm644 icons/mx-snapshot.png "${pkgdir}/usr/share/pixmaps/mx-snapshot.png"

    install -Dm644 mx-snapshot.conf "${pkgdir}/etc/mx-snapshot.conf"

    # Keep Arch cache exclusions in their own list. The fallback preserves
    # compatibility while this recipe still references an older release tarball.
    local excludes_file=mx-snapshot-exclude-arch.list
    if [[ ! -f "$excludes_file" ]]; then
        excludes_file=mx-snapshot-exclude.list
    fi
    install -Dm644 "$excludes_file" "${pkgdir}/etc/mx-snapshot-exclude.list"

    install -dm755 "${pkgdir}/usr/share/excludes"
    install -Dm644 "$excludes_file" "${pkgdir}/usr/share/excludes/mx-snapshot-exclude.list"

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
