# Maintainer: Adrian <adrian@mxlinux.org>

# The one PKGBUILD for this package; everything Arch builds from it:
#
# - OBS: the _service extracts arch/* and the Debian native tarball that
#   release builds commit to debs/ from main. OBS build VMs have no network,
#   and download_files never sees a PKGBUILD that obs_scm extracted, so
#   source= must name a file the service already provides: that tarball.
#   obs (fish) keeps pkgver and source= in step with debian/changelog.
# - AUR: release.sh and release-aur copy it into aur/, point source= at the
#   GitHub tag tarball with its real checksum and set _srcdir to the
#   directory that tarball unpacks to.
# - Local: "./build.sh --arch" builds the working tree from a git archive
#   tarball laid out like the debs/ one.
#
# Keep source= on one line with ${pkgver} in double quotes: OBS parses this
# file itself and only expands plain variables.

pkgname=mx-samba-config
pkgver=26.11
pkgrel=1
pkgdesc="Samba configuration GUI tool"
arch=('x86_64' 'i686')
url="https://github.com/MX-Linux/mx-samba-config"
license=('GPL3')
depends=('samba' 'qt6-base' 'polkit' 'xdg-utils')
makedepends=('cmake' 'ninja' 'qt6-tools')
install=mx-samba-config.install
source=("https://github.com/MX-Linux/mx-samba-config/archive/refs/tags/26.11.tar.gz")
sha256sums=('672bcba45fc84e70ffe6791d168624a399747f162a3bc94946a9412e255656af')

# dpkg-source packed the debs/ tarball from a directory called "src"; the AUR
# copy sets this to the "${pkgname}-${pkgver}" its tag tarball unpacks to
_srcdir="mx-samba-config-26.11"

build() {
    cd "${srcdir}/${_srcdir}"

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
    cd "${srcdir}/${_srcdir}"

    install -Dm755 build/mx-samba-config "${pkgdir}/usr/bin/mx-samba-config"

    # "install -D" with several sources needs -t, and then creates the
    # destination directory itself. No error suppression either: a glob that
    # matches nothing must fail the build rather than ship no translations.
    install -Dm644 -t "${pkgdir}/usr/share/mx-samba-config/locale/" build/*.qm

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

    # help/ postdates the 26.03 tag, so its tarball has no man page. Guard on
    # the file existing rather than suppressing install's errors.
    if compgen -G "help/*.1" >/dev/null; then
        install -Dm644 -t "${pkgdir}/usr/share/man/man1/" help/*.1
    fi
    if [ -d docs ]; then
        cp -r docs/* "${pkgdir}/usr/share/doc/mx-samba-config/" 2>/dev/null || true
    fi

    if [ -f debian/changelog ]; then
        gzip -c debian/changelog > "${pkgdir}/usr/share/doc/mx-samba-config/changelog.gz"
    fi

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
