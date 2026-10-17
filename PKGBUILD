# Maintainer: Adrian <adrian@mxlinux.org>

# PKGBUILD for building on the Open Build Service.
#
# OBS build VMs have no network, so every source has to be present in the
# package's OBS sources before the build starts. This consumes the Debian
# native tarball that release builds commit to debs/ - it carries the complete
# source tree - instead of fetching a GitHub tarball the way aur/PKGBUILD does.
#
# Keep pkgver in step with debian/changelog: it names the tarball.

pkgname=mx-tools
pkgver=26.10
pkgrel=1
pkgdesc="MX Tools - Dashboard application launcher for various MX tools"
arch=('x86_64')
url="https://mxlinux.org"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-declarative' 'qt6-tools')
source=("https://github.com/MX-Linux/mx-tools/archive/refs/tags/26.10.tar.gz")
sha256sums=('9d7f0b3d239765898288a90ca72c7b93033bba98e8ea7479bb0d129c1a49cec0')

# dpkg-source packed this tarball from a directory called "src", so that - not
# ${pkgname}-${pkgver} - is what it unpacks to.
_srcdir="mx-tools-26.10"

build() {
    cd "${srcdir}/${_srcdir}"

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMX_TOOLS_INSTALL_MENU=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}"

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${_srcdir}"

    # CMake installs the application's files; only Arch's own locations are added here.
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    gzip -c debian/changelog > "${pkgdir}/usr/share/doc/${pkgname}/changelog.gz"
}
