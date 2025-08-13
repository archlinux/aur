# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

_target="arm-linux-gnueabihf"
pkgname="${_target}-binutils"
pkgver=2.45+r8+g09be88bfb653
_commit=09be88bfb653bc9739bc281733407fcae73fb12f
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files"
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL-2.0-or-later GPL-3.0-or-later LGPL-2.0-or-later LGPL-3.0-or-later GFDL-1.3-or-later FSFAP)
depends=(glibc jansson libelf zlib zstd)
makedepends=(gcc git glibc libelf zlib zstd)
options=(staticlibs !emptydirs !distcc !debug !strip)
source=(git+https://sourceware.org/git/binutils-gdb.git#commit=${_commit})
sha256sums=('68533b94c94db960cd138f0651002f91305a835619a691ad75fe259838103f25')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

pkgver() {
  cd binutils-gdb
  git describe --abbrev=12 --long --tags | sed 's/[^-]*-//;s/[^-]*-/&r/;s/-/+/g;s/_/./'
}

prepare() {
  if [ ! -d "${srcdir}"/binutils-gdb ]; then
    ln -s "${srcdir}"/binutils-${pkgver} "${srcdir}"/binutils-gdb
  fi
  mkdir "${srcdir}"/binutils-build
}

build() {
  cd "${srcdir}"/binutils-build

  export CFLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}=src"
  export CXXFLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}=src"

  ../binutils-gdb/configure \
    --build=$CHOST \
    --host=$CHOST \
    --target=$_target \
    --prefix=/usr \
    --with-sysroot=/usr/${_target} \
    --with-debuginfod \
    --with-pic \
    --with-system-zlib \
    --with-gnu-as \
    --with-gnu-ld \
    --enable-cet \
    --enable-deterministic-archives \
    --enable-gold \
    --enable-ld=default \
    --enable-lto \
    --enable-plugins \
    --enable-relro \
    --enable-threads \
    --disable-multilib \
    --disable-gdb \
    --disable-werror

  make
}

check() {
  cd "${srcdir}"/binutils-build

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # ignore failures in gold testsuite...
  make -k LDFLAGS="" check || true
}

package() {
  cd "${srcdir}"/binutils-build

  make DESTDIR="${pkgdir}" install

  # elfedit does not support ARM and gprof makes no sense as a cross tool
  rm -rf "${pkgdir}"/usr/bin/*-{elfedit,gprof}
  # collides with system installation of binutils
  rm -rf "${pkgdir}"/usr/{lib,share}

  # strip it manually
  find "${pkgdir}"/ -type f -and \( -executable \) -exec strip '{}' \;
}
