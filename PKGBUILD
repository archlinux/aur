# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
# Contributor: Daniel Hillenbrand < codeworkx at bbqlinux dot org >
# Contributor: Liao Junxuan <mikeljx at 126 dot com>
# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot com>

pkgname=mipsel-elf-binutils
_pkgname=binutils
_target="mipsel-none-elf"
pkgver=2.46.0
pkgrel=1
pkgdesc="A collection of binary tools for baremetal MIPS."
url="http://www.gnu.org/software/binutils/"
arch=('x86_64')
license=('GPL-3.0-or-later AND GFDL-1.3-no-invariants-or-later AND FSFAP')
checkdepends=(dejagnu debuginfod bc)
depends=(glibc zstd libelf)
source=(
  "https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz"{,.sig}
)
source=(
  "https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz"{,.sig}
)
sha256sums=(
  'd75a94f4d73e7a4086f7513e67e439e8fcdcbb726ffe63f4661744e6256b2cf2'
  '5456d1ef66a8fdf4261c9487ffe6de23c52b3ae73e2514b3c8a957faaf098272'
)
validpgpkeys=(
  '3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F' # Nick Clifton
)

prepare() {

  cd ${srcdir}/binutils-${pkgver}
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
  # Turn off development mode (-Werror, gas run-time checks, date in sonames)
  sed -i '/^development=/s/true/false/' bfd/development.sh

}

build() {

  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --program-prefix=$_target- \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --target=$_target \
    --host=$CHOST \
    --build=$CHOST \
    --with-gnu-as \
    --with-gnu-ld \
    --disable-nls \
    --disable-multilib \
    --enable-lto \
    --disable-werror \
    --disable-shared

  make

}

check() {

  cd "${srcdir}/${_pkgname}-${pkgver}"
  make -O CFLAGS_FOR_TARGET="-O2 -g" CXXFLAGS="-O2 -no-pie -fno-PIC" CFLAGS="-O2 -no-pie" LDFLAGS="-no-pie" -k check || true

}

package() {

  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  find "${pkgdir}" -name '*.la' -delete
  find "${pkgdir}" -type f -executable -exec strip --strip-unneeded {} + 2>/dev/null || true


  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info

}
