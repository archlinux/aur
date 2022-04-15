# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

_pkgname=deepin-diskmanager
pkgname=$_pkgname-git
pkgver=r526.e2caf0d
pkgrel=1
pkgdesc='A disk management tool for creating, reorganizing and formatting partitions'
arch=('x86_64')
url="https://github.com/linuxdeepin/${_pkgname}"
license=('GPL3')
depends=('dtkwidget' 'parted' 'polkit-qt5' 'smartmontools' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'cmake' 'git' 'gtest')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    # https://wiki.archlinux.org/title/VCS_package_guidelines#Git
   ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

# https://wiki.archlinux.org/title/CMake_package_guidelines

build() {
    cmake -B build -S "${_pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_LIBDIR='lib' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    cd $pkgdir
    mv lib/* usr/lib/
    rmdir lib
    cd usr/
    mv libexec/* lib/
    rmdir libexec
}
