# Maintainer: Adrian <adrian@mxlinux.org>

# PKGBUILD for building on the Open Build Service.
#
# OBS build VMs have no network, so every source has to be present in the
# package's OBS sources before the build starts. This consumes the Debian
# native tarball that release builds commit to debs/ - it carries the complete
# source tree - instead of fetching a GitHub tarball the way aur/PKGBUILD does.
#
# Keep pkgver in step with debian/changelog: it names the tarball.

pkgname=mx-service-manager
pkgver=26.11
pkgrel=1
pkgdesc="GUI service management tool"
arch=('x86_64' 'i686')
url="https://github.com/mx-linux/mx-service-manager"
license=('GPL3')
depends=('qt6-base' 'polkit' 'systemd')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/mx-linux/mx-service-manager/archive/refs/tags/26.11.tar.gz")
sha256sums=('2d4e3171be4c9874dc2db17b0a0f0cc6ec354406ef639b965661781d43c2137c')

# dpkg-source packed this tarball from a directory called "src", so that - not
# ${pkgname}-${pkgver} - is what it unpacks to.
_srcdir="mx-service-manager-26.11"

build() {
    cd "${srcdir}/${_srcdir}"

    rm -rf build

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DHELPER_INSTALL_DIR=/usr/lib/mx-service-manager \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}"

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${_srcdir}"

    install -Dm755 build/mx-service-manager "${pkgdir}/usr/bin/mx-service-manager"

    # "install -D" with several sources needs -t, and then creates the
    # destination directory itself, so the separate install -dm755 is gone. No
    # error suppression either: the old "2>/dev/null || true" swallowed a glob
    # that matched nothing, shipping the package with no translations at all.
    install -Dm644 -t "${pkgdir}/usr/share/mx-service-manager/locale/" build/*.qm

    install -Dm644 mx-service-manager.desktop "${pkgdir}/usr/share/applications/mx-service-manager.desktop"

    install -Dm644 mx-service-manager.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/mx-service-manager.png"
    install -Dm644 mx-service-manager.png "${pkgdir}/usr/share/pixmaps/mx-service-manager.png"

    install -dm755 "${pkgdir}/usr/lib/mx-service-manager"
    install -Dm755 build/helper "${pkgdir}/usr/lib/mx-service-manager/helper"

    install -dm755 "${pkgdir}/usr/share/polkit-1/actions"
    install -Dm644 build/org.mxlinux.pkexec.mxsm-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mxsm-helper.policy"

    install -dm755 "${pkgdir}/usr/share/doc/mx-service-manager"

    # -t is required: "install -D" treats its last argument as a file
    # path even with one source, so this failed with "cannot create regular
    # file '.../man1/': Not a directory" and the suppression hid it.
    install -Dm644 -t "${pkgdir}/usr/share/man/man1/" help/*.1
    if [ -d docs ]; then
        cp -r docs/* "${pkgdir}/usr/share/doc/mx-service-manager/" 2>/dev/null || true
    fi

    if [ -f debian/changelog ]; then
        gzip -c debian/changelog > "${pkgdir}/usr/share/doc/mx-service-manager/changelog.gz"
    fi

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
