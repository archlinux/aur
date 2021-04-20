# Maintainer: J. A. Cornejo Scappini <jacorsca at gmail dot com>
# Contributor: Michał Szymański <smiszym at gmail dot com>
# Contributor: Daniel Kirchner <daniel at ekpyron dot org>
# Contributor: RemiliaForever <remilia at koumakan dot cc>

pkgname=mingw-w64-glfw
pkgver=3.3.4
pkgrel=1
pkgdesc="A free, open source, portable framework for OpenGL application development (mingw-w64)"
arch=('any')
url="http://www.glfw.org/"
license=('zlib')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://github.com/glfw/glfw/releases/download/${pkgver}/glfw-${pkgver}.zip)
sha256sums=('bbd2c42c660b725e9755eb417e40b373f0d4c03138c9b2e210d02cd308bd99cd')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
        for _arch in ${_architectures}; do
                rm -rf "${srcdir}/build-${_arch}"
                mkdir "${srcdir}/build-${_arch}"
                cd "${srcdir}/build-${_arch}"

                ${_arch}-cmake "${srcdir}/glfw-${pkgver}" \
                      -DGLFW_BUILD_EXAMPLES=OFF \
                      -DGLFW_BUILD_TESTS=OFF \
                      -DBUILD_SHARED_LIBS=ON
                make

                rm -rf "${srcdir}/build-${_arch}-static"
                mkdir "${srcdir}/build-${_arch}-static"
                cd "${srcdir}/build-${_arch}-static"

                ${_arch}-cmake "${srcdir}/glfw-${pkgver}" \
                      -DGLFW_BUILD_EXAMPLES=OFF \
                      -DGLFW_BUILD_TESTS=OFF \
                      -DBUILD_SHARED_LIBS=OFF
                make
        done
}

package() {
        for _arch in ${_architectures}; do
                cd "${srcdir}/build-${_arch}"
                make DESTDIR="${pkgdir}" install
                mkdir -p "${pkgdir}/usr/${_arch}/bin/"
                ${_arch}-strip -x -g "${pkgdir}/usr/${_arch}/bin/"*.dll
                ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a

                cd "${srcdir}/build-${_arch}-static"
                make DESTDIR="${pkgdir}" install
                ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
        done

        #copy license file
        mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
        cp "${srcdir}/glfw-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"
}
