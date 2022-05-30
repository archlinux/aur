# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: c0gnitivefl0w

pkgname=seadrive-gui
pkgver=2.0.21
pkgrel=1
pkgdesc="GUI part of seadrive"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/${pkgname}"
license=('Apache')
depends=('qt5-webengine' 'qt5-tools' 'seadrive-daemon')
makedepends=("cmake")
source=(
    "${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    'cmake.patch'
)
sha256sums=('4134f3b42288b5d6e3d9538ca33cb36db6a32272ab1e47ad062292b68b1d8a0c'
            'f6ccd5cb436c241d34cd9467307ac33a07def0303660d3df5fd29811f41137e8')

prepare() {
    # Create build dir
    rm -rf build
    mkdir -p build
    # Apply patches
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np0 -i ${srcdir}/cmake.patch
}

build () {
    # Build seadrive-gui
    cd "$srcdir/build"
    cmake \
        -Wno-dev \
        -DBUILD_SPARKLE_SUPPORT=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "${srcdir}/${pkgname}-${pkgver}"
    make
}

package () {
    # Install seadrive-gui
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
