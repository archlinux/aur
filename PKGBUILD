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
pkgver=26.11.1
pkgrel=1
pkgdesc="MX Tools - Dashboard application launcher for various MX tools"
arch=('x86_64')
url="https://mxlinux.org"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-declarative' 'qt6-tools')
source=("https://github.com/MX-Linux/mx-tools/archive/refs/tags/26.11.1.tar.gz")
sha256sums=('b0f9e83ece76748ea39ac4fded680cf1dc7f689504219dba80a3aa1eb92ee56f')

# dpkg-source packed this tarball from a directory called "src", so that - not
# ${pkgname}-${pkgver} - is what it unpacks to.
_srcdir="mx-tools-26.11.1"

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
