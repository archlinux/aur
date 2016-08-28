# Maintainer:  Tyler Veness <calcmogul at gmail dot com>
# Contributor: Alex Brinister <alex_brinister@yahoo.com>

_target=powerpc-wrs-vxworks
pkgname=${_target}-gcc
pkgver=6.2.0
pkgrel=1
pkgdesc="The GNU Compiler Collection (${_target})"
arch=('i686' 'x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL')
depends=('wrs-vxworks-headers' 'powerpc-wrs-vxworks-binutils')
makedepends=('libmpc' 'wget')
conflicts=('gcc-powerpc-wrs-vxworks')
provides=('gcc-powerpc-wrs-vxworks')
options=('!strip' '!libtool' '!zipman' '!buildflags' '!makeflags' 'staticlibs')
source=(http://ftp.gnu.org/gnu/gcc/gcc-"${pkgver}"/gcc-"${pkgver}".tar.bz2
        vxworks-pthread.patch
        pointer-cast.patch)
sha512sums=('1e8b826a3d44b9d5899309894e20c03abeb352bf3d273b8ad63af814c0ee2911f1a83ce1cd4cdd2d1cb0b3e3c34e9b7ae1b2ab83dfc649ee817ab05247c76198'
            '5ba8c2757a1970df26bc1c656a5c315c32c62ea3e1f2e17d48cb77855a662b7770e581d5319d0d55bed270bd4028f7ce308c88d7d96c28806be484165b48e689'
            'e1e7bec1e821ec7cc14bbab97bcce53e9a4932d238f530597dc5a957c2eac1773817b820c3e863119e2807b8b9ece364fbc4b1cf58c9ecbaf67ac6f068978a36')

prepare() {
  cd "${srcdir}/gcc-${pkgver}"

  # Apply patches
  patch -p1 < ../vxworks-pthread.patch
  patch -p1 < ../pointer-cast.patch

  mkdir ${srcdir}/gcc-build
}

build() {
  cd "${srcdir}/gcc-build"

  export CFLAGS_FOR_TARGET="-g -O2 -mlongcall"
  ${srcdir}/gcc-${pkgver}/configure \
    --prefix=/usr \
    --program-prefix=${_target}- \
    --target=${_target} \
    --host=$CHOST \
    --build=$CHOST \
    --disable-nls \
    --enable-threads=posix \
    --enable-languages=c,c++ \
    --disable-multilib \
    --with-sysroot=/usr/${_target} \
    --with-build-sysroot=/usr/${_target} \
    --with-as=/usr/bin/${_target}-as \
    --with-ld=/usr/bin/${_target}-ld \
    --with-cpu-PPC603 \
    --with-float=hard \
    --enable-lto \
    --enable-plugin \
    --disable-shared \
    --disable-libssp \
    --enable-libstdcxx \
    --enable-libstdcxx-time \
    --without-gconv \
    --disable-libgomp \
    --disable-libmudflap \
    --disable-symvers \
    --enable-cxx-flags=-mlongcall

  source /etc/profile.d/wind_base.sh
  make all-gcc all-target-libgcc all-target-libstdc++-v3
}

package() {
  cd "${srcdir}/gcc-build"

  make "DESTDIR=${pkgdir}" install-gcc install-target-libgcc \
    install-target-libstdc++-v3

  rm -rf ${pkgdir}/usr/share/{man/man7,info}/

  cp -r "${pkgdir}"/usr/libexec/* "${pkgdir}/usr/lib/"
  rm -rf "${pkgdir}/usr/libexec"

  rm -rf "${pkgdir}/usr/share/gcc-${pkgver}/python"
}
