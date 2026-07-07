# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
# Contributor: Shengqi Chen <i at harrychen dot xyz>
# Contributor: Liao Junxuan <mikeljx at 126 dot com>
# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot com>

pkgname=mipsel-elf-gcc
_pkgname=gcc
_target="mipsel-none-elf"
pkgver=16.1.0
pkgrel=1
pkgdesc="The GNU Compiler Collection - C and C++ frontends (for baremetal MIPS)"
url="https://www.gnu.org/software/gcc/"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=("${_target}-binutils")
makedepends=("gcc-ada>=${pkgver:0:2}")
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=(https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-${pkgver}.tar.xz{,.sig})
sha256sums=(
  '50efb4d94c3397aff3b0d61a5abd748b4dd31d9d3f2ab7be05b171d36a510f79' # gcc-16.1.0.tar.xz
  '33a851c045ea2ef6f580d82b2abfb1dc75d8b270727800028ca5f40c3b4a4246' # gcc-16.1.0.tar.xz.sig
)
validpgpkeys=(
  'D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62' # Jakub Jelinek <jakub@redhat.com>
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  echo $pkgver > gcc/BASE-VER

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
}

build() {

  cd "${srcdir}/${_pkgname}-${pkgver}"

  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}
  unset FFLAGS FCFLAGS

  ./configure \
    --prefix=/usr \
    --program-prefix=$_target- \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --target=${_target} \
    --build=$CHOST \
    --host=$CHOST \
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
    --enable-lto \
    --disable-werror \
    --without-headers \
    --disable-shared \
    --enable-initfini-array \
    --without-included-gettext

  make all-gcc "inhibit_libc=true"

}

package() {

  cd "${srcdir}/${_pkgname}-${pkgver}"

  # handle lib vs lib64; for regular gcc this is handled by filesystem package
  mkdir -p "$pkgdir"/usr/$_target/lib
  ln -s ./lib "$pkgdir"/usr/$_target/lib64

  make DESTDIR="${pkgdir}" install-gcc

  # strip target binaries
  find "$pkgdir"/usr/lib/gcc/$_target/ "$pkgdir"/usr/$_target/lib \
       -type f -and \( -name \*.a -or -name \*.o \) \
       -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges \
           -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line \
           -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir"/usr/bin/ "$pkgdir"/usr/lib/gcc/$_target/ -type f -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm -rf "$pkgdir"/usr/share/gcc-$pkgver

}
