# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
# Contributor: Daniel Hillenbrand < codeworkx at bbqlinux dot org >
# Contributor: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname=mipsel-linux-gnu-binutils-minimal
_pkgname=binutils
_target="mipsel-linux-gnu"
pkgver=2.45
pkgrel=2
pkgdesc="A set of programs to assemble and manipulate binary and object files for the MIPS architecture"
url="http://www.gnu.org/software/binutils/"
arch=('x86_64')
license=('GPL')
depends=('xz')
provides=('mipsel-linux-gnu-binutils')
conflicts=('mipsel-linux-gnu-binutils')
source=(https://ftp.gnu.org/gnu/binutils/${_pkgname}-${pkgver}.tar.xz{,.sig})
sha256sums=(
  'c50c0e7f9cb188980e2cc97e4537626b1672441815587f1eab69d2a1bfbef5d2'
  '987526135ba5e4c0269b397525d613ff9c737ec0cadf176e6b20d87ac6f7c073'
)
validpgpkeys=(3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Hack - see native package for details
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {

  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --libdir=/usr/${_target}/lib \
    --datadir=/usr/${_target}/share \
    --datarootdir=/usr/${_target}/share \
    --build=$CHOST \
    --host=$CHOST \
    --target=${_target} \
    --with-sysroot \
    --with-float=soft \
    --disable-nls \
    --disable-werror \
    --with-gcc \
    --with-gnu-as \
    --with-gnu-ld \
    --without-included-gettext

  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make -O CFLAGS_FOR_TARGET="-O2 -g" CXXFLAGS="-O2 -no-pie -fno-PIC" CFLAGS="-O2 -no-pie" LDFLAGS="" check || true
  #make -k check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  find "${pkgdir}" -name '*.la' -delete
  find "${pkgdir}" -type f -executable -exec strip --strip-unneeded {} + 2>/dev/null || true
  rm -rf ${pkgdir}/usr/${_target}/share/info/dir
}
