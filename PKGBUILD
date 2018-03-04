# $Id$
# Maintainer: Patrick Schratz <patrick.schratz@gmail.com
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>

pkgname=v8-3.14
pkgver=3.14.5
pkgrel=3
pkgdesc='A fast and modern javascript engine (old 3.14 version required R package 'V8')'
arch=('i686' 'x86_64')
url='http://code.google.com/p/v8'
license=('BSD')
depends=('gcc-libs')
makedepends=('python2' 'gyp-git')
source=("http://commondatastorage.googleapis.com/chromium-browser-official/v8-$pkgver.tar.bz2"
'0001_kfreebsd.patch'
'0002_mips.patch'
'0002_mips_r15102_backport.patch'
'0002_mips_r19121_backport.patch'
'0003_armv4t_disable_vfp.patch'
'0004_hurd.patch'
'0008_mksnapshot_stdout.patch'
'0011_use_system_gyp.patch'
'0012_loongson_force_cache_flush.patch'
'0013_gcc_48_compat.patch'
'0014_cve_2013_6639_6640.patch'
'0015-Backport-Utils-ApiCheck.patch'
'0016-remove-this-null.patch'
'0017_increase_stack_size_for_test.patch'
# 'https://gist.github.com/pat-s/942e255ea38821e6ac3e82a36cb3c4bd'
'fix_CVE-2014-5256.patch'
'nodejsREPLACE_INVALID_UTF8.patch'
'strict_overflow.patch'
'dont-assume-hardfloat-means-vfpv3.diff'
'gcc7-fix.patch'
)
sha256sums=('361ad3b63dc7c9d0943b72b1be592a8135e4ddb0e416b9bcf02b4d2df514fca7'
            '15af4bbb02ad510ed57f7c635f00f7163c45884e55acadb1d05510d2f3aaa494'
            '239170677f6dfcae285dfb719ae3ae8d698a9652dab69f54506fbdd1b2eac9e4'
            'a1bd65547bad7113619f77ad442422944b7fa5afac7795868e653a2d0c38877f'
            '1d4e0f503100515dea4be5558f6080321f3117108745cd3a481c44d80ebe8fc9'
            '16fdb157a24a336bf2979b73cfba484314f2cfca2cdcfa9fe51fe2ac9970f202'
            '8b43ef8dfc001d138d25348cd3594d139bc88bb1d333d3908800adbc8c6e55ab'
            '73f75ce1fe02cfa51d8ee6410e000e96f07c21f1e42dd48ffc7d7970434e1677'
            '4dba0e7e1d5f7cad6907c76551e36ef616765de003f83f8989d46008cf53911a'
            '7d4dc3f2325f2b95c612e89904a07d9f3e8b050552be856910cb3ae0b41e04f8'
            '8c1aa4a99748f7a567a3961022c39b1f3666cc57bf63b3ebabe0c51068a65b9b'
            '76b7be145758e80af56429d46c23ce0942be6d13047b31b40855363ce9f88ce4'
            '69906640439c263fdeacaf14605e785294f1f3daf28f7633b40a5ac8d6977797'
            'e90b54cf2e296c6d5c4bc41b7159015a6584191b5c2ab95a2f28861fb1c3bcb3'
            '71a600e3e502896d45076103201d35c30f778fa57a750bb3f2dfdbdcb3a708b8'
            #'64097860ecaa7894493190994c4ac3d167dda8cbd61e5ad6bbbbf4f6f5fe7c2a'
            'd6d3eb0ef53ce501c6da5d756f7dc1adcf85361ad75b17253051bb3869b0b3dc'
            'b76c02ca0d88e9818e58ef70592a216c6d969bde3b563c74244ee3687a39f672'
            '1b48a5714e9d89d419dac8969c005c56a0adc2599b558375ac9254a3168f55ae'
            '2e6a8f36c33e5e37956429eae2753944519f60a57fde81e0d72de1afa60a4103'
            'c67da79111fa171a0900af0da9b151a1568b233f4929922e72d049d7490f98df')
provides=('v8')
conflicts=('v8')

[[ "$CARCH" = 'i686' ]]   && ARCH=ia32
[[ "$CARCH" = 'x86_64' ]] && ARCH=x64

build() {
  cd v8-$pkgver

   # work-around crashes in tests as reported in #812304
   # TODO fix the checks themselves instead

   # keep old ABI to prevent symbol changes due to GCC5 transition
   # https://wiki.debian.org/GCC5
   export CXXFLAGS="${CXXFLAGS} -fno-delete-null-pointer-checks  -std=c++98"

   export GYPFLAGS="-Dhost_arch=$ARCH -DOS=linux"

   # The world isn't ready for python2
   export PYTHON=python2
   find build/ test/ tools/ src/ -type f \
     -exec sed -e 's_^#!/usr/bin/env python$_&2_' \
               -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
               -e 's_^#!/usr/bin/python$_&2_' \
               -e "s_'python'_'python2'_" -i {} \;
   sed -i 's/python /python2 /' Makefile

  # debian patches
  cd $srcdir/v8-$pkgver
  msg "p1"
  patch -p1 <   $srcdir/0001_kfreebsd.patch
  msg "p2"
  patch -p1 <   $srcdir/0002_mips.patch
  msg "p3"
  patch -p1 <   $srcdir/0002_mips_r15102_backport.patch
  msg "p4"
  patch -p1 <   $srcdir/0002_mips_r19121_backport.patch
  msg "p5"
  patch -p1 <   $srcdir/0003_armv4t_disable_vfp.patch
  msg "p6"
  patch -p1 <   $srcdir/0004_hurd.patch
  msg "p7"
  patch -p1 <   $srcdir/0008_mksnapshot_stdout.patch
  msg "p8"
  patch -p1 <   $srcdir/0011_use_system_gyp.patch
  msg "p9"
  patch -p1 <   $srcdir/0012_loongson_force_cache_flush.patch
  msg "p10"
  patch -p1 <   $srcdir/0013_gcc_48_compat.patch
  msg "p11"
  patch -p1 <   $srcdir/0014_cve_2013_6639_6640.patch
  msg "p12"
  patch -p1 <   $srcdir/0015-Backport-Utils-ApiCheck.patch
  msg "p13"
  patch -p1 <   $srcdir/0016-remove-this-null.patch
  msg "p14"
  patch -p1 <   $srcdir/0017_increase_stack_size_for_test.patch
  # msg "p15"
  # patch -p1 <   $srcdir/0099_powerpc_support.patch
  msg "p16"
  patch -p1 <   $srcdir/fix_CVE-2014-5256.patch
  msg "p17"
  patch -p1 <   $srcdir/nodejsREPLACE_INVALID_UTF8.patch
  msg "p8"
  patch -p1 <   $srcdir/strict_overflow.patch
  msg "p19"
  patch -p1 <   $srcdir/dont-assume-hardfloat-means-vfpv3.diff
  msg "p20"
  patch -p1 <   $srcdir/gcc7-fix.patch

  make $ARCH.release library=shared snapshot=off soname_version=$pkgver OS=linux V=1
}

package() {
  cd v8-$pkgver

  install -Dm755 out/$ARCH.release/d8 $pkgdir/usr/bin/d8
  install -Dm755 out/$ARCH.release/lib.target/libv8.so.$pkgver $pkgdir/usr/lib/libv8.so.$pkgver

  install -d $pkgdir/usr/include
  install -Dm644 include/*.h $pkgdir/usr/include

  install -d $pkgdir/usr/share/licenses/v8
  install -m644 LICENSE* ${pkgdir}/usr/share/licenses/v8

  # debian way
  cd $pkgdir/usr/lib
  ln -s -T libv8.so.$pkgver libv8.so
}
