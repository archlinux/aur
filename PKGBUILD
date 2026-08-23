# Maintainer: Alex Indigo <iam@alexindigo.com>

pkgname=qt6-mangowcqml-git
_projname=mangowcqml
_release_ver=0.1.0.r0
pkgver=0.1.0.r0.g0000000
pkgrel=2
pkgdesc="Qt6/QML module for mangowc IPC (mmsg JSON socket) — workspaces, windows, monitors, tags — git master"
options=(!debug)
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/mangowcqml"
license=('LGPL-3.0-only')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake' 'git')
provides=('qt6-mangowcqml')
conflicts=('qt6-mangowcqml')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    # NOTE: capture describe output explicitly — `git describe ... | sed ...`
    # masks describe's exit code (sed exits 0 on empty input), so a pipeline
    # `|| echo fallback` never fires on tagless repos.
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
