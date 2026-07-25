# Maintainer: Alex Indigo <ai at aegis dot one>

pkgname=qt6-dbusqml-git
_projname=dbusqml
_release_ver=0.1.0.r0
pkgver=0.1.0.r0.g44a98db
pkgrel=3
pkgdesc="Standalone D-Bus binding for QML (no KDE dependencies) — git master"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/dbusqml"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake' 'git')
provides=('qt6-dbusqml')
conflicts=('qt6-dbusqml' 'qt6-dbusqml-reactive')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags 2>/dev/null \
        | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' \
        || echo "${_release_ver}.g$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "${srcdir}/${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TEST_MODE=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
