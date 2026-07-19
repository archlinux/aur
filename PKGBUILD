# Maintainer: Alex Indigo <ai at aegis dot one>
# Contributor: Alex Indigo <ai at aegis dot one>

pkgname=qt6-niriqml-git
_projname=niriqml
_release_ver=0.1.0.r0
pkgver=0.1.0.r0.gd165445
pkgrel=1
pkgdesc="Typed QML bindings for niri IPC — git master"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/niriqml"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake' 'git')
optdepends=('niri: the compositor niriqml is designed to talk to')
provides=("qt6-niriqml")
conflicts=("qt6-niriqml")
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
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
