# Maintainer : CoiledSpring
# Original maintainer: Julien Savard <juju@juju2143.ca>
# Based on msp430-elf-gcc

_target="shcasio-elf"
pkgname=${_target}-gcc
pkgver=9.2.0
pkgrel=5
_islver=0.22
pkgdesc="The GNU Compiler Collection for the Casio calculators SuperH processors."
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=("${_target}-binutils" 'libmpc' 'elfutils')
options=('staticlibs' '!buildflags' '!libtool' '!emptydirs' 'zipman' 'docs' '!strip')
source=("https://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz"
	"http://isl.gforge.inria.fr/isl-${_islver}.tar.xz")
sha256sums=('ea6ef08f121239da5695f76c9b33637a118dcf63e24164422231917fa61fb206'
            '6c8bc56c477affecba9c59e2c9f026967ac8bad01b51bdd07916db40a517b9fa')

prepare() {
  cd "${srcdir}/gcc-${pkgver/+/-}"
  ln -sf ../isl-$_islver isl

  [[ -d gcc-build ]] && rm -rf gcc-build
  mkdir gcc-build
}

build() {
  cd "${srcdir}/gcc-${pkgver/+/-}"

  export CFLAGS="-O2 -pipe -s -fomit-frame-pointer -ffunction-sections -fdata-sections"
  export CXXFLAGS=$CFLAGS
  export LDFLAGS="-Wl,--gc-sections"
  export LIBRARY_PATH="" # Fix a bug in the matrix

  echo ${pkgver} > gcc/BASE-VER

  cd gcc-build

  ../configure \
    --prefix=/usr \
    --program-prefix=${_target}- \
	--with-local-prefix=/usr/${_target} \
	--with-as=/usr/bin/${_target}-as \
	--with-ld=/usr/bin/${_target}-ld \
    --target=sh3eb-elf \
	--with-multilib-list=m3,m4-nofpu \
    --host=$CHOST \
    --build=$CHOST \
	--enable-languages=c,c++ \
    --disable-shared \
    --disable-nls \
    --disable-tls \
	--disable-werror \
	--enable-libssp \
	--enable-lto \
    --disable-threads \
    --disable-libgomp \

  make all-gcc all-target-libgcc
}

package() {
  cd "${srcdir}/gcc-${pkgver/+/-}/gcc-build"

  make DESTDIR="${pkgdir}" install-gcc install-target-libgcc

  rm -rf "${pkgdir}/usr/share/man/man7/"
  rm -rf "${pkgdir}/usr/share/info"

  cp -r "${pkgdir}"/usr/libexec/* "${pkgdir}/usr/lib/"
  rm -rf "${pkgdir}/usr/libexec"

  # strip it manually
  strip "${pkgdir}"/usr/bin/* 2>/dev/null || true
  find "${pkgdir}"/usr/lib -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}
