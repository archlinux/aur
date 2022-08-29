# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

_pkgname=dde-grand-search
pkgname=deepin-grand-search-git
pkgver=r293.0a2fd7a
pkgrel=1
pkgdesc='System-wide desktop search for DDE'
arch=('x86_64')
url="https://github.com/linuxdeepin/${_pkgname}"
license=('GPL3')
depends=('deepin-anything' 'deepin-dock' 'poppler-qt5')
makedepends=('qt5-tools' 'cmake' 'git')
provides=('deepin-grand-search')
conflicts=('deepin-grand-search')
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
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    mv $pkgdir/usr/etc $pkgdir
}
