# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mogan-bin
pkgver=2025.1.1
_libgit2ver=1.8.0
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor.(Prebuilt version)"
arch=('x86_64')
url="https://mogan.app/"
_ghurl="https://github.com/XmacsLabs/mogan"
_libgit2url="https://github.com/libgit2/libgit2"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gawk'
    'freetype2'
    'libpng'
    'qt5-svg'
    'qt5-base'
    'python'
    'mimalloc'
)
makedepends=(
    'cmake'
    'gcc'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-stem-v${pkgver}-ubuntu22.04.deb"
    "libgit2-${_libgit2ver}.tar.gz::${_libgit2url}/archive/refs/tags/v${_libgit2ver}.tar.gz"
)
sha256sums=('b92de16a4c37d8120f139d473286a28a5a2f99feff5797cbec8b8dc98c44862e'
            '9e1d6a880d59026b675456fbb1593c724c68d73c34c0d214d6eb848e9bbd8ae4')
build() {
    bsdtar -xf "${srcdir}/data."*
    cd "${srcdir}/libgit2-${_libgit2ver}"
    local cmake_options=(
        -B build
        -D CMAKE_BUILD_TYPE=None
        -D REGEX_BACKEND=pcre2
        -D USE_HTTP_PARSER=llhttp
        -D USE_SSH=ON
        -W no-dev
    )
    cmake "${cmake_options[@]}"
    cmake --build build --verbose
}
package() {
    cp -Pr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${srcdir}/libgit2-${_libgit2ver}/build/libgit2.so.1.8.0" "${pkgdir}/usr/lib/libgit2.so.1.8"
}