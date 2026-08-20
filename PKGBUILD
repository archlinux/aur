# Maintainer: Alex Indigo <iam@alexindigo.com>

pkgname=qt6-pipewirespectrum-git
_projname=pipewirespectrum
_release_ver=0.1.0.r0
pkgver=0.1.0.r0.g2c8cc6f
pkgrel=1
pkgdesc="PipeWire audio spectrum analyzer for QML — git master"
options=(!debug)
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/pipewirespectrum"
license=('LGPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'libpipewire')
makedepends=('cmake' 'git')
provides=('qt6-pipewirespectrum')
conflicts=('qt6-pipewirespectrum')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    local out
    out=$(git describe --long --tags 2>/dev/null) || out=""
    if [ -n "$out" ]; then
        printf "%s" "$out" | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
    else
        echo "${_release_ver}.g$(git rev-parse --short HEAD)"
    fi
}

build() {
    cmake -B build -S "${srcdir}/${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
