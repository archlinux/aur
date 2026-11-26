# Maintainer: Adrian <adrian@mxlinux.org>

# PKGBUILD for building on the Open Build Service.
#
# OBS build VMs have no network, so this consumes the Debian native tarball that
# release builds commit to debs/ - the OBS source service extracts it alongside
# this file. The repository-root PKGBUILD builds in-tree instead and is not
# usable here.
#
# pkgver has to track debian/changelog because it names that tarball.
pkgname=uefi-manager
pkgrel=1
pkgdesc="A graphical tool for managing UEFI boot entries"
pkgver=26.11
arch=('x86_64' 'i686')
url="https://mxlinux.org"
license=('GPL-3.0-or-later')
depends=('efibootmgr' 'qt6-base' 'polkit')
optdepends=('cryptsetup: unlock encrypted partitions'
            'xdg-utils: open help and license links')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/uefi-manager/archive/refs/tags/26.11.tar.gz")
sha256sums=('1c2e3ffe61b68a323ed47f233d6ab523fa82f7d8d2c7bdd2aaf1a330adcec0db')

# dpkg-source packed the tarball from a directory called "src".
_srcdir="uefi-manager-26.11"

build() {
    cd "${srcdir}/${_srcdir}"

    # Get version from pkgver (strip any extra pkgver info for CMake)
    _version="${pkgver}"

    # Flag Arch packaging builds for CMake
    export UEFI_MANAGER_ARCH_BUILD=1

    # Clean any previous build artifacts
    rm -rf build

    # Configure with CMake, passing version override (Arch uses git tags, not debian/changelog)
    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DHELPER_INSTALL_DIR=/usr/lib/uefi-manager \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="$_version"

    # Build
    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${_srcdir}"

    # Install binary
    install -Dm755 build/uefi-manager "${pkgdir}/usr/bin/uefi-manager"

    # Install translations
    # "install -D" with several sources needs -t, and then creates the
    # destination directory itself, so the separate install -dm755 is gone. No
    # error suppression either: the old "2>/dev/null || true" swallowed a glob
    # that matched nothing, shipping the package with no translations at all.
    install -Dm644 -t "${pkgdir}/usr/share/uefi-manager/locale/" build/*.qm

    # Install helper components
    install -dm755 "${pkgdir}/usr/lib/uefi-manager"
    install -Dm755 build/helper "${pkgdir}/usr/lib/uefi-manager/helper"
    install -Dm755 scripts/uefimanager-lib "${pkgdir}/usr/lib/uefi-manager/uefimanager-lib"

    # Install PolicyKit policy
    install -Dm644 build/org.mxlinux.pkexec.mx-uefimanager-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mx-uefimanager-helper.policy"

    # Install desktop file
    install -Dm644 uefi-manager.desktop "${pkgdir}/usr/share/applications/uefi-manager.desktop"

    # Install icons
    install -Dm644 uefi-manager.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/uefi-manager.png"
    install -Dm644 uefi-manager.png "${pkgdir}/usr/share/pixmaps/uefi-manager.png"
    install -Dm644 uefi-manager.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/uefi-manager.svg"

    # Install documentation
    install -Dm644 docs/license.html "${pkgdir}/usr/share/doc/uefi-manager/license.html"

    # Install man page
    install -Dm644 docs/uefi-manager.1 "${pkgdir}/usr/share/man/man1/uefi-manager.1"

    # Install changelog
    gzip -c debian/changelog > "${pkgdir}/usr/share/doc/uefi-manager/changelog.gz"
    # namcap flags a declared license= with nothing under
    # /usr/share/licenses. The file is in the source; it was simply never
    # installed.
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
