# Maintainer : CoiledSpring
# Original maintainer: Julien Savard <juju@juju2143.ca>
# Based on msp430-elf-gcc

_target="sh3eb-elf"
pkgname=${_target}-gcc
pkgver=15.2.0
pkgrel=1
_islver=0.27
pkgdesc="The GNU Compiler Collection for the ${_target} target."
arch=(i686 x86_64)
license=(GPL-3.0-with-GCC-exception GFDL-1.3-or-later)
url="http://gcc.gnu.org"
depends=("${_target}-binutils" 'libmpc' 'elfutils')
options=('staticlibs' '!buildflags' '!libtool' '!emptydirs')
source=("https://ftpmirror.gnu.org/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.xz"
	"https://libisl.sourceforge.io/isl-${_islver}.tar.xz")
sha256sums=('438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e'
            '6d8babb59e7b672e8cb7870e874f3f7b813b6e00e6af3f8b04f7579965643d5c')

prepare() {
  cd "${srcdir}/gcc-${pkgver/+/-}"
  ln -s ../isl-$_islver isl

  [[ -d gcc-build ]] && rm -rf gcc-build
  mkdir gcc-build
}

build() {
  cd "${srcdir}/gcc-${pkgver/+/-}"

  echo ${pkgver} > gcc/BASE-VER

  cd gcc-build

  [ $NOEXTRACT -eq 1 ] || ../configure \
    --prefix=/usr \
    --program-prefix=${_target}- \
    --target=${_target} \
    --host=$CHOST \
    --build=$CHOST \
    --enable-languages=c,c++ \
    --enable-multilib \
    --with-system-zlib \
    --with-local-prefix=/usr/${_target} \
    --with-as=/usr/bin/${_target}-as \
    --with-ld=/usr/bin/${_target}-ld \
    --disable-libgomp \
    --enable-interwork \
    --enable-addons \
    --enable-sjlj-exceptions \
    --disable-hosted-libstdcxx \
    --with-gnu-as \
    --with-gnu-ld \
    --disable-libssp \
    --disable-__cxa_atexit \
    --enable-lto

  make all-gcc all-target-libgcc
}

package() {
  cd "${srcdir}/gcc-${pkgver/+/-}/gcc-build"

  make DESTDIR="${pkgdir}" install-gcc install-target-libgcc

  rm -rf "${pkgdir}/usr/share/man/man7/"
  rm -rf "${pkgdir}/usr/share/info"
  rm -rf "${pkgdir}/usr/share/locale"

  cp -r "${pkgdir}"/usr/libexec/* "${pkgdir}/usr/lib/"
  rm -rf "${pkgdir}/usr/libexec"

  # strip it manually
  strip "${pkgdir}"/usr/bin/* 2>/dev/null || true
  find "${pkgdir}"/usr/lib -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}
