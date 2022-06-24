# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=make-3.81
pkgver=3.81
pkgrel=4
pkgdesc="GNU make utility to maintain groups of programs (3.81 version)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/make"
license=('GPL')
depends=('glibc')
checkdepends=('procps-ng')
source=(
    https://ftpmirror.gnu.org/make/${pkgname}.tar.gz{,.sig}
    # Fixing builds on newer toolchains, thanks to BangL
    https://raw.githubusercontent.com/InuSasha/LibreELEC.tv/master/packages/devel/make/patches/make-glibc_alloc_fix.patch
    # Fix unsafe Perl imports, see: https://bugs.archlinux.org/task/55127
    perl-use_safe_inclusion.patch::https://git.savannah.gnu.org/cgit/make.git/patch/?id=d9d4e06084a4c7da480bd49a3487aadf6ba77b54
)
validpgpkeys=('3D2554F0A15338AB9AF1BB9D96B047156338B6D4') # Paul Smith
sha256sums=('16b77de9f013bcd536b7bc1efbe314223aedfe250f9063e33cbb4dfd347215a2'
            'SKIP'
            '7145e958d5209c3de5a40fe77f71141363dadfbbe7a206826d7b7d7c09c8f98f'
            '24831f321e7ecc0c9c9daa13ae3397922cd46dc1e7e21636d3e16bc181f2a30c')

prepare() {
    cd ${srcdir}/${pkgname}
    patch -Np1 -i $srcdir/make-glibc_alloc_fix.patch
    patch -Np1 -i $srcdir/perl-use_safe_inclusion.patch

    # Patch for updated GNU libc (glibc) glob interface version
    sed -i 's/#define GLOB_INTERFACE_VERSION 1/#define GLOB_INTERFACE_VERSION 2/' configure{,.in}

}

build() {
    cd ${srcdir}/${pkgname}

    ./configure --prefix=/usr --program-suffix=-$pkgver
    make
}

# Optional: decomment it to have tests running
#check() {
#    cd ${srcdir}/${pkgname}
#    make -k check
#}

package() {
    cd ${srcdir}/${pkgname}
    # Just install the binaries, so that it can live along-side with the normal make
    make DESTDIR=${pkgdir} install-exec
}
