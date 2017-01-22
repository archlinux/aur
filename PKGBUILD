# Maintainer (Arch): Allan McRae <allan@archlinux.org>
# Maintainer: André Silva <emulatorman@parabola.nu>
# Maintainer: Márcio Silva <coadde@parabola.nu>
# Maintainer: Luke R. <g4jc@openmailbox.org>

pkgname=xtensa-unknown-elf-binutils
pkgver=2.27
_pkgverpatch=$pkgver
pkgrel=1.92
pkgdesc="A set of programs to assemble and manipulate binary and object files"
arch=('i686' 'x86_64' 'armv7h')
url="https://www.gnu.org/software/binutils/"
license=('GPL')
groups=('cross-devel')
depends=('glibc>=2.24-2' 'zlib')
checkdepends=('dejagnu' 'bc')
options=('staticlibs' '!distcc' '!ccache')
source=(https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2{,.sig}
        https://repo.parabola.nu/other/binutils/$_pkgverpatch/binutils-xtensa.patch)
validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93') # Tristan Gingold <gingold@adacore.com>
sha512sums=('cf276f84935312361a2ca077e04d0b469d23a3aed979d8ba5d92ea590904ffb2c2e7ed12cc842822bfc402836be86f479660cef3791aa62f3753d8a1a6f564cb'
            'SKIP'
            'e10ed358794d7aa32ac25087afd804dc4c3028c4664d7608eb86147f041561d16209afa6501bc8a19e02386674011d567640175f6b8bf89275c243dc3b3a9980')

prepare() {
  cd binutils-$pkgver

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  # open-ath9k-htc-firmware patch
  patch -p1 -i ${srcdir}/binutils-xtensa.patch

  mkdir ${srcdir}/binutils-build
}

build() {
  cd binutils-build

  ../binutils-$pkgver/configure \
    --prefix=/usr \
    --with-lib-path=/usr/lib:/usr/local/lib \
    --with-bugurl=https://labs.parabola.nu/ \
    --enable-threads \
    --with-pic \
    --enable-ld=default \
    --enable-gold \
    --enable-plugins \
    --enable-deterministic-archives \
    --disable-werror \
    --disable-gdb \
    --disable-nls \
    --target=xtensa-unknown-elf --with-sysroot=/usr/xtensa-unknown-elf

  # check the host environment and makes sure all the necessary tools are available
  make configure-host

  make tooldir=/usr
}

check() {
  cd binutils-build
  
  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # ignore failures in gold testsuite...
  make -k LDFLAGS="" check || true
}

package() {
  cd binutils-build
  make prefix=${pkgdir}/usr install

  # Remove info documents that conflict with host version
  rm -rf ${pkgdir}/usr/share/info
}
