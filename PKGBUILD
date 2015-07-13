
# Maintainer: Max Mertens <max DOT mail AT dameweb DOT de>

pkgname=curlcpp-git
_gitname=curlcpp
pkgver=r35.023e161
pkgrel=1
pkgdesc="An object oriented C++ wrapper for cURL tool."
arch=('i686' 'x86_64')
url="https://github.com/JosephP91/curlcpp"
license=('GPL2')
depends=('curl')
makedepends=('git' 'cmake')
options=()
conflicts=('curlcpp')
provides=('curlcpp')

source=("${_gitname}::git+https://github.com/JosephP91/curlcpp.git"
        "CMakeLists.txt")

md5sums=('SKIP'
         '7858aa6a9eb359fd9baf38ddd28e7f0c')

prepare()
{
    cd "${srcdir}/${_gitname}"
    ln -sf "${srcdir}/CMakeLists.txt" ./
}

pkgver()
{
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    cd "${srcdir}/${_gitname}"
    mkdir -p build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX:PATH=/usr -Wno-dev
    CORE_COUNT="$(nproc)"
    make -j"${CORE_COUNT}"
}

package()
{
    cd "${srcdir}/${_gitname}/build"
    make DESTDIR="${pkgdir}" install
    mkdir -p "${pkgdir}/usr/include/curlcpp"
    install "${srcdir}/${_gitname}/include/"* "${pkgdir}/usr/include/curlcpp/"
}
