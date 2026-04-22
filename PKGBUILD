# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Filip Dvorak <fila@pruda.com>

pkgname=mingw-w64-enca
pkgver=1.22
pkgrel=1
pkgdesc="Charset analyser and converter (mingw-w64)"
arch=('any')
url="https://cihar.com/software/enca/"
options=('!strip' '!buildflags' 'staticlibs' '!makeflags' '!debug')
license=('GPL-2.0-only')
depends=(
  'mingw-w64-crt'
  'mingw-w64-recode'
)
makedepends=(
  'git'
  'mingw-w64-gcc'
  'mingw-w64-libiconv'
  'mingw-w64-wine'
)
source=("git+https://github.com/nijel/enca#tag=$pkgver"
        'enca-bad-file-descriptor.patch'
        'configure.patch'
        'tools.patch')
b2sums=('7cb7f391221739d237e9fe19adedf99b741db5b4d1c8740bb6507b3d48823cfee2ebb04755a7db92aeb4d04cecaaf0c39ccd51a098905d5eb4348f3b464cb3ad'
	'787e33ad3238c6e8bfc550587f243f4d2f81ccda66d83706d60d6488ed3bfb99e9cbf108067c5f1641386f17d07274d7fbea762445f686df56c050f166ac16bd'
        'f08cfbf2f6ba47d9b21dc60e26e3722a80222394471f931667cf0d4991cf0a0bc6f1f204a1dcc8fd794ecaaabcba00dd47f3acc797b0c5dd06711787ab59008f'
        'd04c92221c01b6e341686ec364c9d01fabee4d56b4426fcbad5b7b74ea68e2e3994418fd0aa4251ab761c736faa3f51974579473b26e316cb019f898fa341275')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd "${srcdir}/enca"

    patch -p1 -i "${srcdir}/enca-bad-file-descriptor.patch" # https://github.com/nijel/enca/issues/28

    patch -Np1 -i "${srcdir}/configure.patch"
    patch -Np1 -i "${srcdir}/tools.patch"

    autoreconf -fiv -I /usr/share/gettext/m4
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    ${srcdir}/enca/configure --host=${_arch} \
                --target=${_arch} \
                --prefix=/usr/${_arch} \
                --libexecdir=/usr/${_arch}/lib \
                --mandir=/usr/${_arch}/share/man \
                --with-libiconv=/usr/${_arch} \
                --with-librecode=/usr/${_arch} \
                --enable-external

    sed -i -e "s/^EXEEXT =/EXEEXT = .exe/" "${srcdir}/build-${_arch}/src/Makefile"

    sed -i "s|#define HAVE_LOCALE_ALIAS 1|/* #undef HAVE_LOCALE_ALIAS */|" "${srcdir}/build-${_arch}/config.h"

    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}

    make DESTDIR="${pkgdir}" install

    rm -r "${pkgdir}/usr/${_arch}/share"
    rm -r "${pkgdir}/usr/${_arch}/lib/enca"

    #FIXME: should fix build scripts
    mv "${pkgdir}/usr/${_arch}/bin/enca.exe.exe" "${pkgdir}/usr/${_arch}/bin/enca.exe"

    ${_arch}-strip -s "${pkgdir}/usr/${_arch}"/bin/*.exe
    ${_arch}-strip -x -g "${pkgdir}/usr/${_arch}"/bin/*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}"/lib/*.a
  done
}
