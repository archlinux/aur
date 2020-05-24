# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Filip Dvorak <fila@pruda.com>

pkgname=mingw-w64-enca
pkgver=1.19
pkgrel=4
pkgdesc="Charset analyser and converter (mingw-w64)"
arch=('any')
url="https://cihar.com/software/enca/"
options=('!strip' '!buildflags' 'staticlibs' '!makeflags')
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-recode')
makedepends=('mingw-w64-gcc' 'mingw-w64-wine')
source=("https://dl.cihar.com/enca/enca-${pkgver}.tar.xz"
        'enca-bad-file-descriptor.patch'
        'configure.patch'
        'tools.patch'
	'autogen.patch')
sha256sums=('3a487eca40b41021e2e4b7a6440b97d822e6532db5464471f572ecf77295e8b8'
            '270c7c0abaea5f3d10173b58849200d4106675d3127a0b9b8ce1fc3dcf775acb'
            '4092b2cfb4125419d7e93513b8a02a3d7c9dcc7423329d9b704f029f89dda084'
            '5c4d992ec9e0723b23ccb75bb06fad619aabd7c0d5981f89e3bd6deffbf3105b'
            '7e6c95b6b62c02b0ed50df9b1fb0c730ee0bd7108d04cd0f40d55035cb781b40')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd "${srcdir}/enca-${pkgver}"

    patch -p1 -i "${srcdir}/enca-bad-file-descriptor.patch" # https://github.com/nijel/enca/issues/28

    patch -Np1 -i "${srcdir}/configure.patch"
    patch -Np1 -i "${srcdir}/tools.patch"
    patch -Np1 -i "${srcdir}/autogen.patch"

    ./autogen.sh
    make distclean
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    ${srcdir}/enca-${pkgver}/configure --host=${_arch} \
                --target=${_arch} \
                --prefix=/usr/${_arch} \
                --libexecdir=/usr/${_arch}/lib \
                --mandir=/usr/${_arch}/share/man \
                --with-librecode=/usr/${_arch} \
                --enable-external

    # Do not run all/all-am in install/install-am of the tools/Makefile
    # since there is nothing to install and running make_hash.exe causes
    # the package function to fail with: 
    #   "wine: for some mysterious reason, the wine server failed to run."
    sed -i -e "/^install:.*$/ {N; s/^install: \$(BUILT_SOURCES)\n\t\$(MAKE) \$(AM_MAKEFLAGS) install-am/install:\n\t@echo \"install unnecessary\"/g}" "${srcdir}/build-${_arch}/tools/Makefile"
    sed -i -e "/^install-am:.*$/ {N; s/^install-am: all-am\n\t@\$(MAKE) \$(AM_MAKEFLAGS) install-exec-am install-data-am/install-am:\n\t@echo \"install unnecessary\"/g}" "${srcdir}/build-${_arch}/tools/Makefile"

    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}

    make DESTDIR="${pkgdir}" install

    rm -r "${pkgdir}/usr/${_arch}/share"
    rm -r "${pkgdir}/usr/${_arch}/lib/enca"

    ${_arch}-strip -s "${pkgdir}/usr/${_arch}"/bin/*.exe
    ${_arch}-strip -x -g "${pkgdir}/usr/${_arch}"/bin/*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}"/lib/*.a
  done
}
