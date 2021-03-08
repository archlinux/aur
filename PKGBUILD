# Maintainer:  dreieck
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

### Based on Artix Linux binutils 2.36.1-2 PKGBUILD. Was needed on 2021-03-08 due to [this problem](https://bbs.archlinux.org/viewtopic.php?id=263393) (compilation error of virtualbox host modules for custom built kernel).

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

_pkgname="binutils"
_pkgver=2.35.2
pkgname="${_pkgname}-${_pkgver}"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files. Version ${_pkgver}."
arch=(
  'x86_64'
)
url='https://www.gnu.org/software/binutils/'
license=("GPL")
groups=("base-devel")
depends=(
  "elfutils"
  "glibc"
  "zlib"
)
makedepends=(
  "elfutils"
)
conflicts=(
  "binutils-multilib"
  "${_pkgname}"
)
replaces=(
  "binutils-multilib"
)
provides=(
  "${_pkgname}=${pkgver}"
)
options=(
  "staticlibs"
  "!distcc"
  "!ccache"
)
source=(
  "https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz"
  "https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz.sig"
)
sha256sums=(
  'dcd5b0416e7b0a9b24bed76cd8c6c132526805761863150a26d016415b8bdc7b'
  'a8c541025b77cd932355f7abaa679c34c41f503cccdb8eab8145f2e1a1fb2efd'
)
validpgpkeys=(
  "3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F"
)

prepare() {
  [[ ! -d binutils-gdb ]] && ln -s "binutils-${pkgver}" binutils-gdb
  mkdir -p binutils-build

  cd binutils-gdb

  # Turn off development mode (-Werror, gas run-time checks, date in sonames)
  sed -i '/^development=/s/true/false/' bfd/development.sh

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-build

  "${srcdir}/binutils-gdb/configure" \
    --prefix="/usr" \
    --with-lib-path="/usr/lib:/usr/local/lib" \
    --with-bugurl="https://aur.archlinux.org/packages/${pkgname}/" \
    --enable-cet \
    --enable-deterministic-archives \
    --enable-gold \
    --enable-ld="default" \
    --enable-lto \
    --enable-plugins \
    --enable-relro \
    --enable-targets="x86_64-pep" \
    --enable-threads \
    --disable-gdb \
    --disable-werror \
    --with-debuginfod \
    --with-pic \
    --with-system-zlib

  make configure-host
  make tooldir=/usr
}

check() {
  cd binutils-build

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # ignore failures in gold testsuite...
  make -k LDFLAGS="" check || true
}

package() {
  cd binutils-build
  make prefix="${pkgdir}/usr" tooldir="${pkgdir}/usr" install

  # Remove unwanted files
  rm -f "${pkgdir}"/usr/share/man/man1/{dlltool,nlmconv,windres,windmc}*

  # No shared linking to these files outside binutils
  rm -f "${pkgdir}"/usr/lib/lib{bfd,opcodes}.so
  echo 'INPUT( /usr/lib/libbfd.a -liberty -lz -ldl )' > "${pkgdir}/usr/lib/libbfd.so"
  echo 'INPUT( /usr/lib/libopcodes.a -lbfd )' > "${pkgdir}/usr/lib/libopcodes.so"
}
