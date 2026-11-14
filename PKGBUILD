# Maintainer: Adrian <adrian@mxlinux.org>

# PKGBUILD for building on the Open Build Service.
#
# OBS build VMs have no network, so every source has to be present in the
# package's OBS sources before the build starts. This consumes the Debian
# native tarball that release builds commit to debs/ - it carries the complete
# source tree - instead of fetching a GitHub tarball the way aur/PKGBUILD does.
#
# Keep pkgver in step with debian/changelog: it names the tarball.

pkgname=mx-user
pkgver=26.11.1
pkgrel=1
pkgdesc="Simple user configuration tool"
arch=('x86_64')
url="https://github.com/MX-Linux/mx-user"
license=('GPL3')
depends=('qt6-base' 'polkit' 'rsync' 'shadow')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/MX-Linux/mx-user/archive/refs/tags/26.11.1.tar.gz")
sha256sums=('0a617e8c8edf546511ea1f39d00b982559c326c1598e947a082055bc2d421472')

# dpkg-source packed this tarball from a directory called "src", so that - not
# ${pkgname}-${pkgver} - is what it unpacks to.
_srcdir="mx-user-26.11.1"

build() {
    cd "${srcdir}/${_srcdir}"

    rm -rf build

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DHELPER_INSTALL_DIR=/usr/lib/mx-user \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DENABLE_ZXCVBN=OFF \
        -DBUILD_FOR_ARCH=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}"

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${_srcdir}"

    install -Dm755 build/mx-user "${pkgdir}/usr/bin/mx-user"

    # "install -D" with several sources needs -t, and then creates the
    # destination directory itself, so the separate install -dm755 is gone. No
    # error suppression either: the old "2>/dev/null || true" swallowed a glob
    # that matched nothing, shipping the package with no translations at all.
    install -Dm644 -t "${pkgdir}/usr/share/mx-user/locale/" build/*.qm

    install -dm755 "${pkgdir}/usr/lib/mx-user"
    install -Dm755 build/helper "${pkgdir}/usr/lib/mx-user/helper"

    install -Dm644 build/org.mxlinux.pkexec.mx-user-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mx-user-helper.policy"

    install -Dm644 mx-user.desktop "${pkgdir}/usr/share/applications/mx-user.desktop"
    install -Dm644 debian/mx-user.1 "${pkgdir}/usr/share/man/man1/mx-user.1"

    install -Dm644 icons/mx-user.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/mx-user.png"
    install -Dm644 icons/mx-user.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-user.svg"

    install -dm755 "${pkgdir}/usr/share/doc/mx-user"
    if [ -d help ]; then
        cp -r help/* "${pkgdir}/usr/share/doc/mx-user/" 2>/dev/null || true
    fi

    # Install changelog
    if [ -f debian/changelog ]; then
        gzip -c debian/changelog > "${pkgdir}/usr/share/doc/mx-user/changelog.gz"
    fi
    # namcap flags a declared license= with nothing under
    # /usr/share/licenses. The file is in the source; it was simply never
    # installed.
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
