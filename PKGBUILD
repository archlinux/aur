# Maintainer: Ruben De Smet <ruben dot de dot smet at glycos dot org>
# Contributor: Jashandeep Sohi <jashandeep.s.sohi@gmail.com>

_gccver="5.2.0"
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
 "ftp://gcc.gnu.org/pub/gcc/releases/gcc-$_gccver/$_gccsrc.tar.bz2"
)
md5sums=(
 'a51bcfeb3da7dd4c623e27207ed43467'
)
sha512sums=(
 '844120349ec04465dcea52d8ec747f1cbbc9d76a39fe3d8ef5e6b93614e63d718862d60d0a1c1cbf59ffc7815562287d0a2e536a6b220cebcd0b8de4ba35e715'
)
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
