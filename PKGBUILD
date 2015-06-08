# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target="arm-frc-linux-gnueabi"
pkgname=${_target}-gcc-stage1
pkgver=4.9.1
pkgrel=1
pkgdesc="The GNU Compiler Collection. Stage 1 for toolchain building (${_target})"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=("${_target}-binutils" 'libmpc' 'elfutils')
options=('!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs' '!strip')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2)
md5sums=('fddf71348546af523353bd43d34919c1')

build() {
  cd "${srcdir}/gcc-${pkgver}"

  echo ${pkgver} > gcc/BASE-VER

  mkdir -p gcc-build
  cd gcc-build

  [ $NOEXTRACT -eq 1 ] || ../configure \
    --prefix=/usr \
    --target=${_target} \
    --host=$CHOST \
    --build=$CHOST \
    --disable-shared \
    --disable-nls \
    --disable-threads \
    --enable-languages=c \
    --disable-multilib \
    --with-sysroot=/usr/${_target} \
    --with-local-prefix=/usr/${_target} \
    --with-newlib \
    --with-arch=armv7-a \
    --with-cpu=cortex-a9 \
    --with-float=softfp \
    --with-fpu=vfp \
    --with-specs='%{save-temps: -fverbose-asm} %{funwind-tables|fno-unwind-tables|mabi=*|ffreestanding|nostdlib:;:-funwind-tables}' \
    --with-pkgversion='GCC for FRC' \
    --disable-multiarch \
    --disable-libssp \
    --disable-libgomp \
    --disable-libmudflap

  make all-gcc all-target-libgcc
}

package() {
  cd "${srcdir}/gcc-${pkgver}"/gcc-build

  make DESTDIR="$pkgdir" install-gcc install-target-libgcc

  rm -rf "$pkgdir"/usr/share/man/man7/
  rm -rf "$pkgdir/usr/share/info"

  cp -r "$pkgdir"/usr/libexec/* "$pkgdir/usr/lib/"
  rm -rf "$pkgdir/usr/libexec"

  # strip it manually
  strip "$pkgdir"/usr/bin/* 2>/dev/null || true
  find "$pkgdir"/usr/lib -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}
