# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Vyacheslav Razykov <v.razykov@gmail.com>
# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

_target=arm-linux-gnueabihf
pkgname="${_target}-gcc"
pkgver=14.2.0
_majorver=${pkgver%%.*}
_gmpver=6.3.0
_islver=0.26
_mpcver=1.3.1
_mpfrver=4.2.1
pkgrel=3
pkgdesc="The GNU Compiler Collection"
arch=(x86_64)
license=(GPL LGPL FDL custom)
url='https://gcc.gnu.org'
depends=("${_target}-binutils>=2.40" "${_target}-glibc>=2.38" elfutils zlib zstd)
makedepends=(base-devel glibc libelf python zlib zstd)
options=(!emptydirs !distcc !strip lto)
conflicts=("${_target}-gcc-stage1" "${_target}-gcc-stage2")
replaces=("${_target}-gcc-stage1" "${_target}-gcc-stage2")
provides=("${_target}-gcc-stage1=${pkgver}" "${_target}-gcc-stage2=${pkgver}")
source=(https://sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz{,.sig}
        https://gmplib.org/download/gmp/gmp-${_gmpver}.tar.xz{,.sig}
        https://libisl.sourceforge.io/isl-${_islver}.tar.xz
        https://ftp.gnu.org/gnu/mpc/mpc-${_mpcver}.tar.gz
        https://www.mpfr.org/mpfr-${_mpfrver}/mpfr-${_mpfrver}.tar.xz{,.asc}
        0001-gm2-add-missing-debug-output-guard.patch
        0002-gm2-fix-bad-programming-practice-identifier-warning.patch
        0003-gm2-fix-bad-programming-practice-warning.patch)
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # jakub@redhat.com
              343C2FF0FBEE5EC2EDBEF399F3599FF828C67298  # nisse@lysator.liu.se
              A534BE3F83E241D918280AEB5831D11A0D4DB02A) # vincent@vinc17.net
sha256sums=('a7b39bc69cbf9e25826c5a60ab26477001f7c08d85cec04bc0e29cabed6f3cc9'
            'SKIP'
            'a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898'
            'SKIP'
            'a0b5cb06d24f9fa9e77b55fabbe9a3c94a336190345c2555f9915bb38e976504'
            'ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8'
            '277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2'
            'SKIP'
            'ce57c73ef16f4d56c2bec4cee79d876b5f2e67e85da1988b3a2cf4049575556a'
            '9252eca98be0183732f83c383e4680a40f756bab11df9269b53484fccf106874'
            '6fad5923d838486e72b41766b8bfd8a6785ff1fbd2005e1196107c9dc8d36a1d')

prepare() {
  cd gcc-${pkgver/+/-}

  mv ../gmp-${_gmpver} gmp
  mv ../isl-${_islver} isl
  mv ../mpc-${_mpcver} mpc
  mv ../mpfr-${_mpfrver} mpfr

  #echo "${pkgver}" > gcc/BASE-VER
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  patch -Np1 -i ${srcdir}/0001-gm2-add-missing-debug-output-guard.patch
  patch -Np1 -i ${srcdir}/0002-gm2-fix-bad-programming-practice-identifier-warning.patch
  patch -Np1 -i ${srcdir}/0003-gm2-fix-bad-programming-practice-warning.patch

  mkdir -p "${srcdir}"/gcc-build
}

build() {
  cd gcc-build

  # using -Werror=format-security causes libcpp buildig failures
  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100207 
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

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
  cd gcc-build

  make DESTDIR="${pkgdir}" install-gcc install-target-{libatomic,libgcc,libgm2,libgomp,libitm,libquadmath,libsanitizer,libstdc++-v3,libvtv}

  rm -rf "${pkgdir}"/usr/share/{gcc-${pkgver},info,man/man7}

  # strip it manually
  find "${pkgdir}"/usr -type f -exec /usr/bin/"${_target}"-strip --strip-unneeded {} \; 2>/dev/null || true
  find "${pkgdir}"/usr -type f -and \( -executable \) -exec /usr/bin/"${_target}"-strip --strip-unneeded {} \; 2>/dev/null || true
  find "${pkgdir}"/usr -type f -exec /usr/bin/strip --strip-unneeded {} \; 2>/dev/null || true
  find "${pkgdir}"/usr -type f -and \( -executable \) -exec /usr/bin/strip --strip-unneeded {} \; 2>/dev/null || true
}
