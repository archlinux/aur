# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
# Contributor: Shengqi Chen <i at harrychen dot xyz>
# Contributor: Liao Junxuan <mikeljx at 126 dot com>
# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot com>

pkgname=mipsel-none-elf-gcc
_pkgname=gcc
_target="mipsel-none-elf"
pkgver=16.2.0
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
  'e6738e29597f733270731aa90600f37ffdc045079dfc27ec7e8192cc81085c3e' #  gcc-16.2.0.tar.xz
  '43d73202dcede15d31001c6ba0d28723014ef57e4dc815631772daadbe23bcd2' #  gcc-16.2.0.tar.xz.sig

)
validpgpkeys=(
  D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # Jakub Jelinek <jakub@redhat.com>
  33C235A34C46AA3FFB293709A328C3A2C3C45C06  # Jakub Jelinek <jakub@redhat.com>
  13975A70E63C361C73AE69EF6EEB81F8981C74C7  # Richard Guenther <richard.guenther@gmail.com>
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
