# Maintainer: Adrian <adrian@mxlinux.org>

# PKGBUILD for building on the Open Build Service.
#
# OBS build VMs have no network, so every source has to be present in the
# package's OBS sources before the build starts: aur/PKGBUILD fetches a GitHub
# release tarball and cannot work there. This repository also commits no source
# tarball of its own, so the OBS tar_scm service packs the checkout into one.
# That tarball has a constant name rather than a versioned one, so a release
# never requires editing the OBS service as well.
#
# The repository-root PKGBUILD builds in-tree from an empty source array and
# cannot work on OBS either.
#
# This repository has no debian/changelog at all - the git tag is the only
# source of truth for the version, so keep pkgver in step with the tag by hand.
# The obs fish function's arch/PKGBUILD pkgver sync cannot help here: it reads
# the version with dpkg-parsechangelog and runs only when debian/changelog
# exists.
#
# The install= scriptlet below is read by makepkg relative to this PKGBUILD,
# not from the unpacked tarball, so update-notifier-qt.install has to be
# committed to the OBS package next to this file as well.

pkgname=update-notifier-qt
pkgver=26.11
pkgrel=1
pkgdesc="Qt-based update notifier tray for Arch Linux"
arch=("x86_64")
url="https://github.com/AdrianTM/update-notifier-qt"
license=("GPL")
depends=("qt6-base" "qt6-svg" "dbus" "polkit" "pacman")
makedepends=("cmake" "ninja" "qt6-tools")
install=update-notifier-qt.install
source=("https://github.com/AdrianTM/update-notifier-qt/archive/refs/tags/26.11.tar.gz")
sha256sums=('972a8c0e0be3361bc3ac6138a87305ca53c960aaeca2e0841e8c980e8d5992d7')

# tar_scm unpacks to <repository>-<versionformat>; both are fixed here.
_srcdir="update-notifier-qt-26.11"

build() {
    cd "${srcdir}/${_srcdir}"

    # -DAPP_VERSION is not optional: without it CMakeLists.txt scrapes pkgver
    # and pkgrel out of the repository-root PKGBUILD, which tracks nothing and
    # is stale, and falls back to "unknown" if that file ever goes away.
    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DAPP_VERSION="${pkgver}-${pkgrel}"

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${_srcdir}/build"
    DESTDIR="${pkgdir}" ninja install

    # Create symlink to enable tray service globally (package-managed)
    install -dm755 "${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants"
    ln -s ../update-notifier-tray.service \
        "${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants/update-notifier-tray.service"
    # namcap flags a declared license= with nothing under
    # /usr/share/licenses. The file is in the source; it was simply never
    # installed.
    # package() runs in build/, so LICENSE is one level up.
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
