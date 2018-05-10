# Maintainer: Ruben De Smet <ruben dot de dot smet at glycos dot org>
# Contributor: Jashandeep Sohi <jashandeep.s.sohi@gmail.com>

_gccver="8.1.0"
_gccmajor="8.1.0"
_gccsrc="gcc-$_gccver"

pkgname='libgccjit'
pkgver="${_gccver}"
pkgrel=1
pkgdesc='Just-In-Time Compilation using GCC.'
url='https://gcc.gnu.org/wiki/JIT'
license=(
 'GPL3'
)
source=(
 "ftp://gcc.gnu.org/pub/gcc/releases/gcc-$_gccmajor/$_gccsrc.tar.xz"
)
sha512sums=('c96246f34a7aeb404c4525b754dc7f7708a18e06271aadb2b32fef00e6e0940f584e52430bfe2ab01e699c93e3cb418adc113d2622fa826facbec0ec8ce3eb2c')
arch=(
 'i686'
 'x86_64'
)
depends=(
 'glibc'
# 'isl>=0.14'
 'libmpc'
 'zlib'
)
makedepends=(
 'binutils'
 'gcc-ada'
 'libmpc>=0.8.1'
 'gmp>=4.3.2'
 'mpfr>=2.4.2'
# 'isl>=0.14'
)
checkdepends=(
 'dejagnu'
)
options=(
 '!emptydirs'
)

prepare() {
 cd "$srcdir/$_gccsrc"
 
 # Do not run fixincludes
 sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
 
}

build() { 
 install -d "$srcdir/$pkgname-build"
 cd "$srcdir/$pkgname-build"
 
 CPPFLAGS="$CPPFLAGS -O2"
 
 ../$_gccsrc/configure \
  --prefix="/usr" \
  --libexecdir="/usr/lib" \
  --with-system-zlib \
  --with-bugurl='https://github.com/jashandeep-sohi/libgccjit-pkg/issues' \
  --with-linker-hash-style=gnu \
  --enable-host-shared \
  --enable-shared \
  --enable-checking=release \
  --enable-languages=jit \
  --enable-linker-build-id \
  --disable-multilib \
  --disable-bootstrap \
  --disable-libssp \
  --disable-lto \
  --disable-libquadmath \
  --disable-liboffloadmic \
  --disable-libada \
  --disable-libsanitizer \
  --disable-libquadmath-support \
  --disable-libgomp \
  --disable-libvtv
 
 make
}

check() {
 cd "$srcdir/$pkgname-build/gcc"
 make check-jit RUNTESTFLAGS="-v -v -v"
}

package() {
 cd "$srcdir/$pkgname-build/gcc"
 make DESTDIR="$pkgdir" jit.install-common jit.install-info
}

post_install() {
 [[ -x usr/bin/install-info ]] || return 0
 install-info usr/share/info/libgccjit.info.gz usr/share/info/dir 2> /dev/null
}

# vim: tabstop=1 expandtab
