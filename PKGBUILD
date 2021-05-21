# Maintainer: jhbruhn <aur@jhbruhn.de> 
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>

# Build order: avr-binutils -> avr-gcc -> avr-libc

_target=avr
_pkgname=$_target-gcc
pkgname=$_pkgname-45
pkgver=4.5.4
pkgrel=1
#_snapshot=7-20180125
pkgdesc='The GNU AVR Compiler Collection'
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
arch=(x86_64)
license=(GPL LGPL FDL custom)
url='http://gcc.gnu.org/'
depends=($_target-binutils gcc-libs libmpc)
optdepends=('avr-libc: Standard C library for Atmel AVR development')
options=(!emptydirs !strip)
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.gz
        #ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.xz
       )
sha256sums=('33fb968907ef7b6c528f6395ba049eb34c4df859bf5aa6c2bc3856268801e078')
#validpgpkeys=(D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # Jakub Jelinek <jakub@redhat.com>
#              33C235A34C46AA3FFB293709A328C3A2C3C45C06  # Jakub Jelinek <jakub@redhat.com>
#              13975A70E63C361C73AE69EF6EEB81F8981C74C7) # Richard Guenther <richard.guenther@gmail.com>

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

    config_guess=$(./config.guess)
    # https://bugs.archlinux.org/task/34629
    # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
    sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
    
    # GCCVER=$(gcc -dumpversion | sed -e 's/\.\([0-9][0-9]\)/\1/g' -e 's/\.\([0-9]\)/0\1/g' -e 's/^[0-9]\{3,4\}$/&00/')
    echo ${pkgver} > gcc/BASE-VER
    config_guess=$(./config.guess)
    cd "${srcdir}"
    mkdir gcc-build && cd gcc-build

    export CFLAGS_FOR_TARGET='-O2 -pipe -Wno-error=format-security -Wno-error -fcommon'
    export CXXFLAGS_FOR_TARGET='-O2 -pipe -Wno-error=format-security -Wno-error -fcommon'
    export CFLAGS="-Wno-error=format-security -fgnu89-inline -fcommon -Wno-error"
    export CXXFLAGS="-Wno-error=format-security -fgnu89-inline -fcommon -Wno-error"

    # Doesn't like FORTIFY_SOURCE
    CPPFLAGS="${CPPFLAGS//-D_FORTIFY_SOURCE=?/}"

    # Doesn't like -fstack-protector-strong
    CFLAGS="${CFLAGS//-fstack-protector-strong/-fstack-protector}"
    CXXFLAGS="${CXXFLAGS//-fstack-protector-strong/-fstack-protector}"

    # using -pipe causes spurious test-suite failures
    # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
    CFLAGS="${CFLAGS/-pipe/}"
    CXXFLAGS="${CXXFLAGS/-pipe/}"

    # Flags from new compilers that old compilers don't recognize
    CFLAGS="${CFLAGS/-fno-plt/}"
    CXXFLAGS="${CXXFLAGS/-fno-plt/}"

    CFLAGS="${CFLAGS/-Wformat-overflow=[0-9]/}"
    CXXFLAGS="${CXXFLAGS/-Wformat-overflow=[0-9]/}"
    # --disable-linker-build-id   https://bugs.archlinux.org/task/34902
    # --disable-__cxa_atexit   https://bugs.archlinux.org/task/50848
    ${srcdir}/${_basedir}/configure \
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
            --enable-gnu-indirect-function
    
        


    make MAKEINFO=true
}

package() {
    cd "${srcdir}"/gcc-build

    make -j1 DESTDIR="${pkgdir}" install

    rm $pkgdir/usr/lib/libiberty.a

    # Strip debug symbols from libraries; without this, the package size balloons to ~500MB.
    find "${pkgdir}"/usr/lib/gcc -type f -name "*.a" \
        -exec /usr/bin/$_target-strip --strip-debug '{}' \;

    rm -r "${pkgdir}"/usr/share/man/man7
    rm -r "${pkgdir}"/usr/share/info
}
