# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

_target=arm-linux-gnueabihf
pkgname=${_target}-gcc-stage2
pkgver=15.2.1+r19+g76aeacb436df
_commit=76aeacb436dfad649974cf5f61ec1ce6dd5f8417
pkgrel=1
pkgdesc="The GNU Compiler Collection. Stage 2 for toolchain building"
arch=(x86_64)
license=(GPL-3.0-or-later LGPL-3.0-or-later GFDL-1.3-or-later custom)
url='https://gcc.gnu.org'
depends=("${_target}-binutils>=2.44" "${_target}-glibc-headers>=2.40")
makedepends=(binutils gcc glibc zlib)
options=(!emptydirs !distcc !debug !strip)
conflicts=("${_target}-gcc-stage1")
replaces=("${_target}-gcc-stage1")
source=(git+https://sourceware.org/git/gcc.git#commit=${_commit})
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62) # Jakub Jelinek <jakub@redhat.com>
sha256sums=('3ba0b55ec7bcc81ed05ad62e8dc78f6b13e49bdcb3d982b0f17e4292521298e6')

pkgver() {
  cd "${srcdir}"/gcc
  echo "$(cat gcc/BASE-VER)+$(git describe --abbrev=12 --tags | sed 's/[^-]*-[^-]*-//;s/[^-]*-/r&/;s/-/+/g;s/_/./')"
}

prepare() {
  cd "${srcdir}"/gcc

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

  export CFLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}=src"
  export CXXFLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}=src"

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
  cd "${srcdir}"/gcc-build

  make DESTDIR="${pkgdir}" install-gcc install-target-libgcc

  rm -rf "${pkgdir}"/usr/share

  # strip it manually
  find "${pkgdir}"/ -type f -and \( -name \*.a -or -name \*.o \) \
    -exec ${_target}-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges \
    -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line \
    -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;
  find "${pkgdir}"/ -type f -and \( -executable \) -exec strip '{}' \;
  find "${pkgdir}"/ -name "libgcc.a" -exec ${_target}-strip --strip-debug {} +
}
