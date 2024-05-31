# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-cmake-shared-git
pkgver=v1.1.0.r91.ge633ba7
pkgrel=1
pkgdesc="Additional macros and functions for CMake"
arch=('any')
url='https://github.com/lirios/cmake-shared'
license=('GPL-3.0-only')
depends=('extra-cmake-modules')
makedepends=('git')
conflicts=('liri-cmake-shared')
replaces=('liri-cmake-shared')
provides=('liri-cmake-shared')
groups=('liri-git')

_gitroot="git+https://github.com/lirios/cmake-shared.git"
_gitbranch=develop
_gitname=cmake-shared
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_gitname}
    ( set -o pipefail
      git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cmake -B build -S "${srcdir}/${_gitname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
