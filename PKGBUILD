# Maintainer: Alex Indigo <ai@aegis.one>

pkgname=luch-git
_projname=luch
_release_ver=0.1.0.r0
pkgver=0.1.0.r0.g54e4257
pkgrel=2
pkgdesc="Link router for Linux/Wayland — pick which browser opens a URL — git master"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/luch"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'layer-shell-qt' 'qt6-xdgiconqml'
         'qt6-wayland' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'wayland-protocols')
optdepends=('wl-clipboard: Ctrl+C copy survives the popup exiting')
provides=('luch')
conflicts=('luch')
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
