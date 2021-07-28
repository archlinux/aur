# Maintainer: Diego Roux <diegoroux04 at protonmail dot com>
# Contributor: grant0417 <grant0417@protonmail.com>
# Contributor: Araragi Hokuto <kanseihonbucho@protonmail.com>
# Contributor: Marc Boocha <marcboocha@gmail.com>

_target=x86_64-elf
pkgname=$_target-gcc
pkgver=11.1.0
pkgrel=1
pkgdesc='The GNU Compiler Collection - cross compiler for x86_64-elf target'
arch=(x86_64)
url='http://gcc.gnu.org/'
license=('GPL' 'LGPL' 'FDL')
depends=("$_target-binutils" 'zlib' 'libmpc')
makedepends=('gmp' 'mpfr')
options=(!emptydirs)
conflicts=("$_target-gcc")
source=("https://mirrors.kernel.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz"
        "https://mirrors.kernel.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz.sig")

sha256sums=('4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf'
            '30ddb74a7dc144917ece0053e8cd0a18d6d0390941257925e0c70eb88a52e629')

_basedir=gcc-$pkgver

validpgpkeys=(
    'D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62' # Jakub Jelinek <jakub@redhat.com>
)

prepare() {
    cd $_basedir
    sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
    mkdir -p $srcdir/build
}

build() {
    cd build

    # GCC build fails with format-security.
    CFLAGS=${CFLAGS/-Werror=format-security/}
    CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

    $srcdir/$_basedir/configure \
        --prefix=/usr \
        --disable-nls \
        --disable-plugin \
        --target=$_target \
        --libexecdir=/usr/lib \
        --enable-languages=c,c++ \
        --without-headers \
        --with-bugurl=https://aur.archlinux.org/packages/x86_64-elf-gcc/

    make all-gcc
    make all-target-libgcc

}

check() {
    cd build

    # Increase stack size to prevent test failures.
	# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
    ulimit -s 32768

    # Don't abort on error as some are "expected".
	make -k check || true
	$srcdir/$_basedir/contrib/test_summary
}

package() {
    cd build

    make DESTDIR="$pkgdir" install-gcc
    make DESTDIR="$pkgdir" install-target-libgcc

    # Remove info and make since it expected already present by host compiler
    rm -vr "$pkgdir"/usr/share/{info,man}

}
