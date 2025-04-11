# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Vyacheslav Razykov <v.razykov@gmail.com>
# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

_target=arm-linux-gnueabihf
pkgname="${_target}-gcc"
pkgver=14.2.1.git+1cd744a6828
_majorver="14.2.1"
_commit=1cd744a6828f6ab9179906d16434ea40b6404737
_gmpver=6.3.0
_islver=0.26
_mpcver=1.3.1
_mpfrver=4.2.2
pkgrel=2
pkgdesc="The GNU Compiler Collection"
arch=(x86_64)
license=(GPL LGPL FDL custom)
url='https://gcc.gnu.org'
depends=("${_target}-binutils>=2.42" "${_target}-glibc>=2.40" elfutils zlib zstd)
makedepends=(base-devel glibc libelf python zlib zstd)
options=(!emptydirs !distcc !strip lto)
conflicts=("${_target}-gcc-stage1" "${_target}-gcc-stage2")
replaces=("${_target}-gcc-stage1" "${_target}-gcc-stage2")
provides=("${_target}-gcc-stage1=${pkgver}" "${_target}-gcc-stage2=${pkgver}")
source=(git+https://github.com/gcc-mirror/gcc.git#commit=${_commit}
        https://gmplib.org/download/gmp/gmp-${_gmpver}.tar.xz{,.sig}
        https://libisl.sourceforge.io/isl-${_islver}.tar.xz
        https://ftp.gnu.org/gnu/mpc/mpc-${_mpcver}.tar.gz
        https://www.mpfr.org/mpfr-${_mpfrver}/mpfr-${_mpfrver}.tar.xz{,.asc}
        0001-gm2-add-missing-debug-output-guard.patch
        0002-gm2-fix-bad-programming-practice-identifier-warning.patch)
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # jakub@redhat.com
              343C2FF0FBEE5EC2EDBEF399F3599FF828C67298  # nisse@lysator.liu.se
              A534BE3F83E241D918280AEB5831D11A0D4DB02A) # vincent@vinc17.net
sha256sums=('33378643f1c72686181f9d3fcd09caf9b06815324467f5dc9b9a3ea41cfba4b4'
            'a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898'
            'SKIP'
            'a0b5cb06d24f9fa9e77b55fabbe9a3c94a336190345c2555f9915bb38e976504'
            'ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8'
            'b67ba0383ef7e8a8563734e2e889ef5ec3c3b898a01d00fa0a6869ad81c6ce01'
            'SKIP'
            'ce57c73ef16f4d56c2bec4cee79d876b5f2e67e85da1988b3a2cf4049575556a'
            '9252eca98be0183732f83c383e4680a40f756bab11df9269b53484fccf106874')

pkgver() {
  cd gcc
  local _hash="$(git rev-parse --short ${_commit})"
  echo "${_majorver}.git+${_hash}"
}

prepare() {
  cd gcc

  mv ../gmp-${_gmpver} gmp
  mv ../isl-${_islver} isl
  mv ../mpc-${_mpcver} mpc
  mv ../mpfr-${_mpfrver} mpfr

  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  patch -Np1 -i ${srcdir}/0001-gm2-add-missing-debug-output-guard.patch
  patch -Np1 -i ${srcdir}/0002-gm2-fix-bad-programming-practice-identifier-warning.patch

  mkdir -p "${srcdir}"/gcc-build
}

build() {
  cd gcc-build

  # using -Werror=format-security causes libcpp buildig failures
  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100207 
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

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
  cd gcc-build

  make DESTDIR="${pkgdir}" install-gcc install-target-{libatomic,libgcc,libgm2,libgomp,libitm,libquadmath,libsanitizer,libstdc++-v3,libvtv}

  rm -rf "${pkgdir}"/usr/share/{gcc-${_majorver},info,man/man7}

  # strip it manually
  find "${pkgdir}"/usr -type f -exec /usr/bin/"${_target}"-strip --strip-unneeded {} \; 2>/dev/null || true
  find "${pkgdir}"/usr -type f -and \( -executable \) -exec /usr/bin/"${_target}"-strip --strip-unneeded {} \; 2>/dev/null || true
  find "${pkgdir}"/usr -type f -exec /usr/bin/strip --strip-unneeded {} \; 2>/dev/null || true
  find "${pkgdir}"/usr -type f -and \( -executable \) -exec /usr/bin/strip --strip-unneeded {} \; 2>/dev/null || true
}
