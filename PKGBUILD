# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: naelstrof <naelstrof@gmail.com>

pkgname=mingw-w64-flac
pkgver=1.4.1
pkgrel=1
pkgdesc="Free Lossless Audio Codec (mingw-w64)"
url="http://flac.sourceforge.net/"
arch=('any')
license=('BSD' 'GPL')
depends=('mingw-w64-libogg' 'mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'ninja' 'nasm')
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/xiph/flac/releases/download/${pkgver}/flac-${pkgver}.tar.xz")
sha256sums=('91303c3e5dfde52c3e94e75976c0ab3ee14ced278ab8f60033a3a12db9209ae6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_pkgname="${pkgname#mingw-w64-}"

build() {
    for _arch in ${_architectures}; do
        ${_arch}-cmake -S ${_pkgname}-${pkgver} -B build/${_arch}-static -G Ninja \
            -DCMAKE_BUILD_TYPE=None \
            -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
            -DBUILD_SHARED_LIBS=OFF \
            -DBUILD_DOCS=OFF \
            -DBUILD_EXAMPLES=OFF \
            -DBUILD_PROGRAMS=OFF \
            -DBUILD_TESTING=OFF \
            -DWITH_STACK_PROTECTOR=OFF \
            -DINSTALL_MANPAGES=OFF \
            -DNDEBUG=ON

        ${_arch}-cmake -S ${_pkgname}-${pkgver} -B build/${_arch} -G Ninja \
            -DCMAKE_BUILD_TYPE=None \
            -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
            -DBUILD_SHARED_LIBS=ON \
            -DBUILD_DOCS=OFF \
            -DBUILD_EXAMPLES=OFF \
            -DBUILD_PROGRAMS=OFF \
            -DBUILD_TESTING=OFF \
            -DWITH_STACK_PROTECTOR=OFF \
            -DINSTALL_MANPAGES=OFF \
            -DNDEBUG=ON

        cmake --build build/${_arch}-static
        cmake --build build/${_arch}
    done
}

package() {
    for _arch in ${_architectures}; do
        DESTDIR="${pkgdir}" cmake --install build/${_arch}-static
        DESTDIR="${pkgdir}" cmake --install build/${_arch}
        install -Dm644 ${_pkgname}-${pkgver}/src/*/*.m4 -t "${pkgdir}/usr/${_arch}/share/aclocal"
        ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
        ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    done
}
