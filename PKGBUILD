# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Emanuele 'Lele' Calo
# Contributor: c0gnitivefl0w
# Contributor: Redpill13
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=seadrive-gui
pkgver=3.0.18
pkgrel=1
pkgdesc="GUI part of seadrive"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/${pkgname}"
license=('Apache')
depends=('qt6-webengine' 'qt6-tools' 'qt6-5compat' 'seadrive-daemon' 'libsearpc')
makedepends=('git' 'cmake')
source=(
    "${pkgname}-v${pkgver}::git+${url}.git#tag=v${pkgver}"
    "use-qt6.patch"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    # Apply patch to the source code
    cd "${srcdir}/${pkgname}-v${pkgver}"
    patch -Np1 < "${srcdir}/use-qt6.patch"

    # Create build dir
    rm -rf build
    mkdir -p build
}

build () {
    # Build seadrive-gui
    cd "${srcdir}/${pkgname}-v${pkgver}/build"
    cmake \
        -Wno-dev \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "${srcdir}/${pkgname}-v${pkgver}"
    make -j$(nproc)
}

package () {
    # Install seadrive-gui
    cd "${srcdir}/${pkgname}-v${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}
