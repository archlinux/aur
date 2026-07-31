# Maintainer: Alex Indigo <ai at aegis dot one>

pkgname=qt6-xdgiconqml-git
_projname=xdgiconqml
_release_ver=0.1.0.r0
pkgver=57d4605
pkgrel=1
pkgdesc="Qt 6 QML plugin implementing the XDG Icon Theme Specification (v0.13) — git master"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/xdgiconqml"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake' 'git')
provides=('qt6-xdgiconqml')
conflicts=('qt6-xdgiconqml' 'qt6-xdgiconqml-dbus-git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --always 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || echo "${_release_ver}.g$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "${srcdir}/${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TEST_MODE=OFF \
        -DWITH_DBUS_BROADCAST=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
