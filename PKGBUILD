# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

_target=arm-linux-gnueabihf
pkgname="${_target}-gcc"
pkgver=15.2.1+r19+g76aeacb436df
_commit=76aeacb436dfad649974cf5f61ec1ce6dd5f8417
_gmpver=6.3.0
_islver=0.26
_mpcver=1.3.1
_mpfrver=4.2.2
pkgrel=1
pkgdesc="The GNU Compiler Collection"
arch=(x86_64)
license=(GPL-3.0-or-later LGPL-3.0-or-later GFDL-1.3-or-later custom)
url='https://gcc.gnu.org'
depends=("${_target}-binutils>=2.44" "${_target}-glibc>=2.40" elfutils zlib zstd)
makedepends=(base-devel glibc libelf python zlib zstd)
options=(!emptydirs !distcc !debug !strip lto)
conflicts=("${_target}-gcc-stage1" "${_target}-gcc-stage2")
replaces=("${_target}-gcc-stage1" "${_target}-gcc-stage2")
provides=("${_target}-gcc-stage1=${pkgver}" "${_target}-gcc-stage2=${pkgver}")
source=(git+https://github.com/gcc-mirror/gcc.git#commit=${_commit}
        https://gmplib.org/download/gmp/gmp-${_gmpver}.tar.xz{,.sig}
        https://libisl.sourceforge.io/isl-${_islver}.tar.xz
        https://ftpmirror.gnu.org/gnu/mpc/mpc-${_mpcver/_/-}.tar.gz{,.sig}
        https://www.mpfr.org/mpfr-${_mpfrver}/mpfr-${_mpfrver}.tar.xz{,.asc})
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # jakub@redhat.com
              343C2FF0FBEE5EC2EDBEF399F3599FF828C67298  # nisse@lysator.liu.se
              AD17A21EF8AED8F1CC02DBD9F7D5C9BF765C61E3  # andreas.enge@inria.fr
              A534BE3F83E241D918280AEB5831D11A0D4DB02A) # vincent@vinc17.net
sha256sums=('3ba0b55ec7bcc81ed05ad62e8dc78f6b13e49bdcb3d982b0f17e4292521298e6'
            'a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898'
            'SKIP'
            'a0b5cb06d24f9fa9e77b55fabbe9a3c94a336190345c2555f9915bb38e976504'
            'ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8'
            'SKIP'
            'b67ba0383ef7e8a8563734e2e889ef5ec3c3b898a01d00fa0a6869ad81c6ce01'
            'SKIP')

pkgver() {
  cd "${srcdir}"/gcc
  echo "$(cat gcc/BASE-VER)+$(git describe --abbrev=12 --tags | sed 's/[^-]*-[^-]*-//;s/[^-]*-/r&/;s/-/+/g;s/_/./')"
}

prepare() {
  cd "${srcdir}"/gcc

  mv ../gmp-${_gmpver} gmp
  mv ../isl-${_islver} isl
  mv ../mpc-${_mpcver} mpc
  mv ../mpfr-${_mpfrver} mpfr

  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir -p "${srcdir}"/gcc-build
}

build() {
  cd gcc-build

  # using -Werror=format-security causes libcpp buildig failures
  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100207 
  CFLAGS="${CFLAGS/-Werror=format-security/}"
  CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

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
    --with-native-system-header-dir=/include \
    --with-as=/usr/bin/${_target}-as \
    --with-ld=/usr/bin/${_target}-ld \
    --with-linker-hash-style=gnu \
    --with-system-zlib \
    --with-arch=armv6 \
    --with-float=hard \
    --with-fpu=vfp \
    --enable-languages=c,c++,lto,m2 \
    --enable-__cxa_atexit \
    --enable-cet=auto \
    --enable-checking=release \
    --enable-clocale=gnu \
    --enable-default-pie \
    --enable-default-ssp \
    --enable-gnu-indirect-function \
    --enable-gnu-unique-object \
    --enable-libstdcxx-backtrace \
    --enable-link-serialization=1 \
    --enable-linker-build-id \
    --enable-lto \
    --enable-plugin \
    --enable-shared \
    --enable-threads=posix \
    --enable-libquadmath \
    --enable-libvtv \
    --disable-nls \
    --disable-install-libiberty \
    --disable-libssp \
    --disable-libstdcxx-pch \
    --disable-multilib \
    --disable-werror

  make
}

package() {
  cd "${srcdir}"/gcc-build

  make DESTDIR="${pkgdir}" install-gcc install-target-{libatomic,libgcc,libgm2,libgomp,libitm,libquadmath,libsanitizer,libstdc++-v3,libvtv}

  rm -rf "${pkgdir}"/usr/share/{gcc-*,info,man/man7}

  # strip it manually
  find "${pkgdir}"/usr -type f -exec /usr/bin/"${_target}"-strip --strip-unneeded {} \; 2>/dev/null || true
  find "${pkgdir}"/usr -type f -and \( -executable \) -exec /usr/bin/"${_target}"-strip --strip-unneeded {} \; 2>/dev/null || true
}
