# Maintainer: Adrian <adrian@mxlinux.org>

# PKGBUILD for building on the Open Build Service.
#
# OBS build VMs have no network, so every source has to be present in the
# package's OBS sources before the build starts. This consumes the Debian
# native tarball that release builds commit to debs/ - it carries the complete
# source tree - instead of fetching a GitHub tarball the way aur/PKGBUILD does.
#
# Keep pkgver in step with debian/changelog: it names the tarball. It is
# deliberately independent of aur/PKGBUILD's pkgver, which carries an "arch"
# suffix and may run ahead of the Debian version.

pkgname=mx-cleanup
pkgver=26.10
pkgrel=1
pkgdesc="GUI for system cleanup and maintenance"
arch=('x86_64' 'i686')
url="https://github.com/mxlinux/mx-cleanup"
license=('GPL3')
depends=('qt6-base' 'polkit')
makedepends=('cmake' 'ninja' 'qt6-tools')

# makepkg looks for this next to the PKGBUILD, not inside the unpacked source,
# so arch/mx-cleanup.install is a copy of the one in the repository root.
install=mx-cleanup.install

source=("https://github.com/MX-Linux/mx-cleanup/archive/refs/tags/26.10.tar.gz")
sha256sums=('d44c213b8f750b493a0ba65c986c013b9ba14f0c653616515b9f3349b3301a7a')

# dpkg-source packed this tarball from a directory called "src", so that - not
# ${pkgname}-${pkgver} - is what it unpacks to.
_srcdir="mx-cleanup-26.10"

build() {
    cd "${srcdir}/${_srcdir}"

    rm -rf build

    # CMake's project() VERSION only accepts numeric major.minor.patch.tweak.
    # Unlike aur/PKGBUILD's tag-derived pkgver, this one comes straight from
    # debian/changelog and is already numeric, so pass it through as-is.
    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DHELPER_INSTALL_DIR=/usr/lib/mx-cleanup \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}"

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${_srcdir}"

    install -Dm755 build/mx-cleanup "${pkgdir}/usr/bin/mx-cleanup"

    # "install -D" with several sources needs -t, and then creates the
    # destination directory itself, so the separate install -dm755 is gone. No
    # error suppression either: the old "2>/dev/null || true" swallowed a glob
    # that matched nothing, shipping the package with no translations at all.
    install -Dm644 -t "${pkgdir}/usr/share/mx-cleanup/locale/" build/*.qm

    install -dm755 "${pkgdir}/usr/lib/mx-cleanup"
    install -Dm755 build/helper "${pkgdir}/usr/lib/mx-cleanup/helper"
    install -Dm755 scripts/helper-terminal-keep-open "${pkgdir}/usr/lib/mx-cleanup/helper-terminal-keep-open"

    install -Dm644 build/org.mxlinux.pkexec.mx-cleanup-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mx-cleanup-helper.policy"

    install -Dm644 mx-cleanup.desktop "${pkgdir}/usr/share/applications/mx-cleanup.desktop"

    install -Dm644 images/mx-cleanup.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mx-cleanup.png"

    install -dm755 "${pkgdir}/usr/share/doc/mx-cleanup"
    if [ -d help ]; then
        cp -r help/* "${pkgdir}/usr/share/doc/mx-cleanup/" 2>/dev/null || true
    fi
    # namcap flags a declared license= with nothing under
    # /usr/share/licenses. The file is in the source; it was simply never
    # installed.
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
