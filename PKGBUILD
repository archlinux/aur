# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target="arm-frc-linux-gnueabi"
pkgname=${_target}-gcc
pkgver=5.5.0
pkgrel=3
pkgdesc="The GNU Compiler Collection (${_target})"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
groups=('frc-toolchain')
depends=("${_target}-binutils" "${_target}-eglibc" 'libmpc' 'elfutils')
options=('!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs'
  '!strip' 'staticlibs')
source=("ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz"
        "config.patch")
md5sums=('0f70424213b4a1113c04ba66ddda0c1f'
         '47076fe53c07f4a0c1e1e3c612400521')

prepare() {
  cd "${srcdir}/gcc-${pkgver}"

  echo ${pkgver} > gcc/BASE-VER

  patch -p1 < ${srcdir}/config.patch

  mkdir -p ${srcdir}/gcc-build
}

build() {
  cd "${srcdir}/gcc-build"

  ${srcdir}/gcc-${pkgver}/configure \
    --prefix=/usr \
    --program-prefix=${_target}- \
    --target=${_target} \
    --host=$CHOST \
    --build=$CHOST \
    --enable-shared \
    --disable-nls \
    --enable-threads=posix \
    --enable-languages=c,c++ \
    --disable-multilib \
    --disable-multiarch \
    --with-sysroot=/usr/${_target} \
    --with-build-sysroot=/usr/${_target} \
    --with-as=/usr/bin/${_target}-as \
    --with-ld=/usr/bin/${_target}-ld \
    --with-cpu=cortex-a9 \
    --with-float=softfp \
    --with-fpu=vfpv3 \
    --with-specs='%{save-temps: -fverbose-asm} %{funwind-tables|fno-unwind-tables|mabi=*|ffreestanding|nostdlib:;:-funwind-tables}' \
    --enable-lto \
    --with-pkgversion='GCC for FRC' \
    --with-cloog \
    --enable-poison-system-directories \
    --enable-plugin \
    --with-system-zlib \
    --disable-libmudflap

  make all-gcc all-target-libsanitizer all-target-libgcc \
    all-target-libstdc++-v3
}

package() {
  cd "${srcdir}/gcc-build"

  make "DESTDIR=$pkgdir" install-gcc install-target-libsanitizer \
    install-target-libgcc install-target-libstdc++-v3

  rm -rf "$pkgdir"/usr/share/{man/man7,info}/

  cp -r "$pkgdir"/usr/libexec/* "$pkgdir/usr/lib/"
  rm -rf "$pkgdir/usr/libexec"

  rm -rf "$pkgdir/usr/share/gcc-${pkgver}/python"

  # strip it manually
  strip "$pkgdir"/usr/bin/* 2>/dev/null || true
  find "$pkgdir"/usr/lib -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}
