# Maintainer: Alex Indigo <ai at aegis dot one>
# Contributor: Alex Indigo <ai at aegis dot one>

pkgname=qt6-mpvqml-git
pkgver=0.2.0.r0.gdb659c2
pkgrel=2
epoch=1
pkgdesc="Qt6 QML video player element backed by libmpv"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/mpvqml"
license=('GPL-3.0-or-later AND LGPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'mpv')
makedepends=('cmake' 'git')
provides=("qt6-mpvqml=${pkgver%%.r*}")
conflicts=('qt6-mpvqml')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "${srcdir}/${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TEST_MODE=OFF \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -dm755 "${pkgdir}/usr/share/licenses"
    ln -s ../mpvqml/licenses "${pkgdir}/usr/share/licenses/${pkgname}"
}
