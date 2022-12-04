# Maintainer: schuay <jakob.gruber@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>

# Build order: avr-binutils -> avr-gcc -> avr-libc

_target=avr
pkgname=$_target-gcc-85
pkgver=8.5.0
pkgrel=1
#_snapshot=7-20180125
pkgdesc='The GNU AVR Compiler Collection'
arch=(x86_64)
license=(GPL LGPL FDL custom)
url='http://gcc.gnu.org/'
provides=("avr-gcc=$pkgver")
conflicts=("avr-gcc")
depends=($_target-binutils gcc-libs libmpc libisl zstd)
optdepends=('avr-libc: Standard C library for Atmel AVR development')
options=(!emptydirs !strip !lto)
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig}
        #ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.xz
       )
sha256sums=('d308841a511bb830a6100397b0042db24ce11f642dab6ea6ee44842e5325ed50'
            'SKIP')


validpgpkeys=(D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # Jakub Jelinek <jakub@redhat.com>
              33C235A34C46AA3FFB293709A328C3A2C3C45C06  # Jakub Jelinek <jakub@redhat.com>
              13975A70E63C361C73AE69EF6EEB81F8981C74C7) # Richard Guenther <richard.guenther@gmail.com>

if [ -n "${_snapshot}" ]; then
  _basedir=gcc-${_snapshot}
else
  _basedir=gcc-${pkgver}
fi

prepare() {
    cd ${_basedir}
}

build() {
    cd "${srcdir}"/${_basedir} 

    echo ${pkgver} > gcc/BASE-VER

    cd "${srcdir}"
    mkdir gcc-build && cd gcc-build

    export CFLAGS_FOR_TARGET='-O2 -pipe'
    export CXXFLAGS_FOR_TARGET='-O2 -pipe'

    # Credits @allanmcrae
    # https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/gcc/PKGBUILD
    # TODO: properly deal with the build issues resulting from this
    CFLAGS=${CFLAGS/-Werror=format-security/}
    CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

    # --disable-linker-build-id   https://bugs.archlinux.org/task/34902
    # --disable-__cxa_atexit   https://bugs.archlinux.org/task/50848
    "${srcdir}"/${_basedir}/configure \
                --disable-install-libiberty \
                --disable-libssp \
                --disable-libstdcxx-pch \
                --disable-libunwind-exceptions \
                --disable-linker-build-id \
                --disable-nls \
                --disable-werror \
                --disable-__cxa_atexit \
                --enable-checking=release \
                --enable-clocale=gnu \
                --enable-gnu-unique-object \
                --enable-gold \
                --enable-languages=c,c++ \
                --enable-ld=default \
                --enable-lto \
                --enable-plugin \
                --enable-shared \
                --infodir=/usr/share/info \
                --libdir=/usr/lib \
                --libexecdir=/usr/lib \
                --mandir=/usr/share/man \
                --prefix=/usr \
                --target=$_target \
                --with-as=/usr/bin/$_target-as \
                --with-gnu-as \
                --with-gnu-ld \
                --with-ld=/usr/bin/$_target-ld \
                --with-plugin-ld=ld.gold \
                --with-system-zlib \
                --with-isl \
                --enable-gnu-indirect-function

    make
}

package() {
    cd "${srcdir}"/gcc-build

    make -j1 DESTDIR="${pkgdir}" install

    # Strip debug symbols from libraries; without this, the package size balloons to ~500MB.
    find "${pkgdir}"/usr/lib -type f -name "*.a" \
        -exec /usr/bin/$_target-strip --strip-debug '{}' \;

    # Install Runtime Library Exception
    install -Dm644 "${srcdir}"/${_basedir}/COPYING.RUNTIME \
        "${pkgdir}"/usr/share/licenses/$_target-gcc/RUNTIME.LIBRARY.EXCEPTION

    rm -r "${pkgdir}"/usr/share/man/man7
    rm -r "${pkgdir}"/usr/share/info
    rm "${pkgdir}"/usr/lib/libcc1.*
}

