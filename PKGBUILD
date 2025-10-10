# Maintainer: Viktor Gunnerson <support@rumatallc.com>

pkgname=battlecity-git
_gitname=battlecity
pkgver=0.1.0.r0.g0060076
pkgrel=1
pkgdesc="Remake of multidirectional shooter video game from NES"
arch=('x86_64')
url="https://github.com/gunnerson/${_gitname}"
license=('GPL-3.0-or-later')
depends=('glibc' 'libxi' 'libxcursor' 'libx11' 'libxrandr' 'gcc-libs' 'systemd-libs' 'flac' 'libvorbis' 'libogg')
makedepends=('git' 'cmake')
options=('!debug')

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/\([^-]*-\)g/\1r/' | sed 's/\([^-]*\)-\([^-]*\)/r\2.g/'
}

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        "${srcdir}/${_gitname}"
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
