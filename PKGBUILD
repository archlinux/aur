# Maintainer: Adrian <adrian@mxlinux.org>

# The one PKGBUILD for this package; everything Arch builds from it:
#
# - AUR: release.sh copies it, with mx-samba-config.install, into aur/ and
#   fills in pkgver and the tag tarball's real checksum there.
# - OBS: the _service extracts arch/* from main and download_files fetches the
#   source= tarball below, since the build VMs have no network. makepkg on OBS
#   does check sums, which is why the SKIP here stays: the tarball's checksum
#   only exists once the tag has been pushed.
# - Local: "./build.sh --arch" builds the working tree from a git archive
#   tarball named after source= below, so makepkg uses it instead of fetching.
#
# Keep pkgver in step with debian/changelog; release.sh refuses to tag a
# version this file isn't at, because OBS fetches the tarball named here.
#
# Keep source= on one line with ${pkgver} in double quotes: OBS parses this
# file itself and only expands plain variables.

pkgname=mx-samba-config
pkgver=26.09
pkgrel=1
pkgdesc="Samba configuration GUI tool"
arch=('x86_64' 'i686')
url="https://github.com/MX-Linux/mx-samba-config"
license=('GPL3')
depends=('samba' 'qt6-base' 'polkit' 'xdg-utils')
makedepends=('cmake' 'ninja' 'qt6-tools')
install=mx-samba-config.install
source=("https://github.com/MX-Linux/mx-samba-config/archive/refs/tags/26.09.tar.gz")
sha256sums=('61b5d2ea36d85dec9d7c34bb50eb344f3e84c44a64516c1c50179ec0dede320a')

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
