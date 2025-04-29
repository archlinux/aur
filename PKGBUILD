# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Vyacheslav Razykov <v.razykov@gmail.com>
# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

_target=arm-linux-gnueabihf
pkgname=${_target}-gcc-stage2
pkgver=15.1.1.git+f36ec88aa85a
_majorver="15.1.1"
_commit=f36ec88aa85a1a8f4ec300dfcd862fc4fbca1c53
pkgrel=1
pkgdesc="The GNU Compiler Collection. Stage 2 for toolchain building"
arch=(x86_64)
license=(GPL LGPL FDL custom)
url='https://gcc.gnu.org'
depends=("${_target}-binutils>=2.42" "${_target}-glibc-headers>=2.40")
makedepends=(binutils gcc glibc zlib)
options=(!emptydirs !distcc !strip)
conflicts=("${_target}-gcc-stage1")
replaces=("${_target}-gcc-stage1")
provides=("${_target}-gcc-stage1=${pkgver}")
source=(git+https://sourceware.org/git/gcc.git#commit=${_commit})
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62) # Jakub Jelinek <jakub@redhat.com>
sha256sums=('7dc521dbaf5e8db83574db217c5fdb8c4fed6ec1cc6ce9f0095755f599890b8c')

pkgver() {
  cd gcc
  local _hash="$(git rev-parse --short ${_commit})"
  echo "${_majorver}.git+${_hash}"
}

prepare() {
  cd gcc

  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir -p "${srcdir}"/gcc-build
}

build() {
  cd gcc-build

  # using -Werror=format-security causes libcpp buildig failures
  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100207 
  CFLAGS="${CFLAGS/ -Werror=format-security/}"
  CXXFLAGS="${CXXFLAGS/ -Werror=format-security/}"

  ../gcc/configure \
    --target=${_target} \
    --host=${CHOST} \
    --build=${CHOST} \
    --prefix=/usr \
    --program-prefix=${_target}- \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --with-local-prefix=/usr/${_target} \
    --with-sysroot=/usr/${_target} \
    --with-build-sysroot=/usr/${_target} \
    --with-as=/usr/bin/${_target}-as \
    --with-ld=/usr/bin/${_target}-ld \
    --with-linker-hash-style=gnu \
    --with-system-zlib \
    --with-newlib \
    --with-arch=armv6 \
    --with-float=hard \
    --with-fpu=vfp \
    --enable-languages=c,c++,lto \
    --enable-__cxa_atexit \
    --enable-checking=release \
    --enable-clocale=gnu \
    --enable-default-pie \
    --enable-default-ssp \
    --enable-gnu-indirect-function \
    --enable-gnu-unique-object \
    --enable-install-libiberty \
    --enable-linker-build-id \
    --enable-lto \
    --enable-threads \
    --disable-nls \
    --disable-plugin \
    --disable-shared \
    --disable-libssp \
    --disable-libstdcxx-pch \
    --disable-libunwind-exceptions \
    --disable-multilib \
    --disable-werror

  make all-gcc all-target-libgcc
}

package() {
  cd gcc-build

  make DESTDIR="${pkgdir}" install-gcc install-target-libgcc

  rm -rf "${pkgdir}"/usr/share

  # strip it manually
  find "${pkgdir}"/ -type f -and \( -name \*.a -or -name \*.o \) \
    -exec ${_target}-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges \
    -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line \
    -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;
  find "${pkgdir}"/ -type f -and \( -executable \) -exec strip '{}' \;
}
