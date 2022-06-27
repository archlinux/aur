# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: naelstrof <naelstrof@gmail.com>

pkgname=mingw-w64-flac
pkgver=1.3.4
pkgrel=1
pkgdesc="Free Lossless Audio Codec (mingw-w64)"
arch=('any')
url="http://flac.sourceforge.net/"
license=('BSD' 'GPL')
depends=('mingw-w64-libogg' 'mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'ninja')
options=(!strip !buildflags staticlibs)
source=("https://github.com/xiph/flac/releases/download/${pkgver}/flac-${pkgver}.tar.xz")
sha256sums=('8ff0607e75a322dd7cd6ec48f4f225471404ae2730d0ea945127b1355155e737')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_pkgname="flac"

build() {
    for _arch in ${_architectures}; do
        ${_arch}-cmake -S flac-${pkgver} -B ${_arch} -G Ninja \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
            -DBUILD_SHARED_LIBS=ON \
            -DBUILD_DOCS=OFF \
            -DBUILD_EXAMPLES=OFF \
            -DBUILD_PROGRAMS=OFF \
            -DBUILD_TESTING=OFF \
            -DWITH_STACK_PROTECTOR=OFF \
            -DWITH_ASM=OFF \
            -DINSTALL_MANPAGES=OFF

        ${_arch}-cmake -S flac-${pkgver} -B ${_arch}-static -G Ninja \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=/usr/${_arch}/static \
            -DBUILD_SHARED_LIBS=OFF \
            -DBUILD_DOCS=OFF \
            -DBUILD_EXAMPLES=OFF \
            -DBUILD_PROGRAMS=OFF \
            -DBUILD_TESTING=OFF \
            -DWITH_STACK_PROTECTOR=OFF \
            -DWITH_ASM=OFF \
            -DINSTALL_MANPAGES=OFF

        cmake --build ${_arch}
        cmake --build ${_arch}-static
    done
}

package() {
    for _arch in ${_architectures}; do
        DESTDIR="${pkgdir}" cmake --install ${_arch}
        # DESTDIR="${pkgdir}" cmake --install ${_arch}-static
        # Rather than do a proper static install, we copy the static libs into the same prefix as the shared libs.
        # This is bad, but so are most AUR mingw packages and this is how 'mingw-w64-flac' was previously packaged.
        install -Dm644 ${srcdir}/${_arch}-static/src/libFLAC/libFLAC.a "${pkgdir}"/usr/${_arch}/lib/
        install -Dm644 ${srcdir}/${_arch}-static/src/libFLAC++/libFLAC++.a "${pkgdir}"/usr/${_arch}/lib/
        install -Dm644 flac-${pkgver}/src/*/*.m4 -t "${pkgdir}/usr/${_arch}/share/aclocal"
        ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
        ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    done
}
