# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
# Contributor: Daniel Hillenbrand < codeworkx at bbqlinux dot org >
# Contributor: Liao Junxuan <mikeljx at 126 dot com>
# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot com>

pkgname=mipsel-elf-binutils
_pkgname=binutils
_target="mipsel-elf"
pkgver=2.44
pkgrel=2
pkgdesc="A collection of binary tools for baremetal MIPS."
url="http://www.gnu.org/software/binutils/"
arch=('x86_64')
license=('GPL-3.0-or-later AND GFDL-1.3-no-invariants-or-later AND FSFAP')
checkdepends=(dejagnu debuginfod bc)
depends=(glibc zstd libelf)
source=(https://ftp.gnu.org/gnu/binutils/${_pkgname}-${pkgver}.tar.xz{,.sig})
sha256sums=(
  'ce2017e059d63e67ddb9240e9d4ec49c2893605035cd60e92ad53177f4377237'
  'b8e0b848b8f615a02b5f91d2f6992db0c062689bc7d4d0fee68edfaf34dee29f'
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
    --target=${_target} \
    --with-newlib \
    --with-gnu-as \
    --with-gnu-ld \
    --disable-nls \
    --disable-decimal-float \
    --disable-threads \
    --disable-libatomic \
    --disable-libgomp \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libvtv \
    --disable-libstdcxx \
    --enable-languages=c,c++,fortran \
    --disable-multilib \
    --disable-libgcj \
    --enable-lto \
    --disable-werror \
    --without-headers \
    --disable-shared \
    --enable-initfini-array \
    --without-included-gettext \
    --disable-win32-registry

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

  find "$pkgdir" -name '*.la' -delete
  find "$pkgdir" -type f -executable -exec strip --strip-unneeded {} + 2>/dev/null || true
  rm -rf $pkgdir/usr/share/{man,info}
}
