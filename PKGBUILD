# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Vyacheslav Razykov <v.razykov@gmail.com>
# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

_target=arm-linux-gnueabihf
pkgname="${_target}-gcc"
pkgver=13.2.0
_majorver=${pkgver%%.*}
_gmpver=6.3.0
_islver=0.26
_mpcver=1.3.1
_mpfrver=4.2.0
pkgrel=2
pkgdesc="The GNU Compiler Collection"
arch=(x86_64)
license=(GPL LGPL FDL custom)
url='https://gcc.gnu.org'
depends=("${_target}-binutils>=2.40" "${_target}-glibc>=2.38" elfutils zlib zstd)
makedepends=(binutils libelf gcc glibc zlib zstd)
checkdepends=(dejagnu inetutils)
options=(!emptydirs !distcc !strip)
conflicts=("${_target}-gcc-stage1" "${_target}-gcc-stage2")
replaces=("${_target}-gcc-stage1" "${_target}-gcc-stage2")
provides=("${_target}-gcc-stage1=${pkgver}" "${_target}-gcc-stage2=${pkgver}")
source=(https://sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz{,.sig}
        https://gmplib.org/download/gmp/gmp-${_gmpver}.tar.xz{,.sig}
        https://libisl.sourceforge.io/isl-${_islver}.tar.xz
        https://ftp.gnu.org/gnu/mpc/mpc-${_mpcver}.tar.gz{,.sig}
        https://www.mpfr.org/mpfr-current/mpfr-${_mpfrver}.tar.xz{,.asc})
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # jakub@redhat.com
              343C2FF0FBEE5EC2EDBEF399F3599FF828C67298  # nisse@lysator.liu.se
              AD17A21EF8AED8F1CC02DBD9F7D5C9BF765C61E3  # andreas.enge@inria.fr
              A534BE3F83E241D918280AEB5831D11A0D4DB02A) # vincent@vinc17.net
sha256sums=('e275e76442a6067341a27f04c5c6b83d8613144004c0413528863dc6b5c743da'
            'SKIP'
            'a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898'
            'SKIP'
            'a0b5cb06d24f9fa9e77b55fabbe9a3c94a336190345c2555f9915bb38e976504'
            'ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8'
            'SKIP'
            '06a378df13501248c1b2db5aa977a2c8126ae849a9d9b7be2546fb4a9c26d993'
            'SKIP')

prepare() {
  cd gcc-${pkgver/+/-}

  mv ../gmp-${_gmpver} gmp
  mv ../isl-${_islver} isl
  mv ../mpc-${_mpcver} mpc
  mv ../mpfr-${_mpfrver} mpfr

  # do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir -p "${srcdir}"/gcc-build
}

build() {
  cd gcc-build

  # using -Werror=format-security causes libcpp buildig failures
  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100207 
  CFLAGS="${CFLAGS/ -Werror=format-security/}"
  CXXFLAGS="${CXXFLAGS/ -Werror=format-security/}"

  ../gcc-${pkgver/+/-}/configure \
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
    --with-native-system-header-dir=/include \
    --with-as=/usr/bin/${_target}-as \
    --with-ld=/usr/bin/${_target}-ld \
    --with-linker-hash-style=gnu \
    --with-system-zlib \
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
    --enable-plugin \
    --enable-shared \
    --enable-threads \
    --disable-nls \
    --disable-libssp \
    --disable-libstdcxx-pch \
    --disable-libunwind-exceptions \
    --disable-multilib \
    --disable-werror

  make
}

package() {
  cd gcc-build

  make DESTDIR="${pkgdir}" install-gcc install-target-{libgcc,libstdc++-v3,libquadmath,libatomic,libitm,libsanitizer,libgomp}

  rm -rf "${pkgdir}"/usr/share

  # strip it manually
  find "${pkgdir}"/usr -type f -exec /usr/bin/"${_target}"-strip --strip-unneeded {} \; 2>/dev/null || true
}
