# Maintainer:  Tyler Veness <calcmogul at gmail dot com>
# Contributor: Alex Brinister <alex_brinister@yahoo.com>
pkgname=gcc-powerpc-wrs-vxworks
pkgver=4.9.2
pkgrel=1
pkgdesc="GCC modded for VxWorks 6.3"
arch=('i686' 'x86_64')
url="http://firstforge.wpi.edu/sf/projects/c--11_toochain"
license=('GPL')
provides=('gcc-powerpc-wrs-vxworks')
conflicts=('vxworks-gcc-toolchain-bin')
depends=('wrs-vxworks-headers' 'binutils-powerpc-wrs-vxworks')
makedepends=('wget')
options=('!strip' '!libtool' '!zipman' '!buildflags' '!makeflags' 'staticlibs')
source=(http://ftp.gnu.org/gnu/gcc/gcc-"$pkgver"/gcc-"$pkgver".tar.bz2
        vxworks-pthread.patch
        pointer-cast.patch)
sha512sums=('e96cba06d572dbe7f382a2b00fd9297dcf9f9219d46a9ad0bd904dc36d5e7db3335e422640b79a27fed6fde91b0731732b94a0e2fbcd47344d6779f8ba1f4f9c'
            '5ba8c2757a1970df26bc1c656a5c315c32c62ea3e1f2e17d48cb77855a662b7770e581d5319d0d55bed270bd4028f7ce308c88d7d96c28806be484165b48e689'
            '838205c182611ac671a8a12b3eb39e89948092b65f3d13a5bd4af90a68362bef0ee31a46b81148916dbcace63e2876ef97fd53ea61ab8aa05beb64667c593572')
_gcc_name="gcc-$pkgver"
_target=powerpc-wrs-vxworks

build() {
  cd $srcdir/$_gcc_name
  ./contrib/download_prerequisites

	# Apply patches
	patch -p1 < ../../vxworks-pthread.patch
  patch -p1 < ../../pointer-cast.patch

  cd $srcdir
  mkdir -p build && cd build

  export CFLAGS_FOR_TARGET="-g -O2 -mlongcall"
  ../$_gcc_name/configure \
    --prefix=/usr \
    --target=${_target} \
    --with-gnu-as \
    --with-gnu-ld \
    --with-headers \
    --disable-shared \
    --disable-libssp \
    --disable-multilib \
    --with-float=hard \
    --enable-languages=c,c++ \
    --enable-libstdcxx \
    --enable-libstdcxx-time \
    --enable-threads=posix \
    --without-gconv \
    --disable-libgomp \
    --disable-nls \
    --with-cpu-PPC603 \
    --disable-libmudflap \
    --disable-symvers \
    --enable-cxx-flags=-mlongcall
  source /etc/profile.d/wind_base.sh
  make ${MAKEFLAGS} || return 1
}
package(){
  cd "$srcdir/build"
  make ${MAKEFLAGS} DESTDIR=$pkgdir install || return 1

  rm -r $pkgdir/usr/share/{info,man/man7}
  rm -r $pkgdir/usr/share/gcc-$pkgver
}

# vim:set ts=2 sw=2:
