# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Felipe Balbi <felipe@balbi.sh>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Vyacheslav Razykov <v.razykov@gmail.com>
# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

_target="arm-linux-gnueabihf"
pkgname="${_target}-binutils"
pkgver=2.44+r94+gfe459e33c676
_commit=fe459e33c676883b5f28cc96c00e242973d906a9
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files"
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL-2.0-or-later GPL-3.0-or-later LGPL-2.0-or-later LGPL-3.0-or-later GFDL-1.3 FSFAP)
depends=(glibc libelf zlib zstd)
makedepends=(gcc git glibc libelf zlib zstd)
options=(!emptydirs !distcc !strip)
source=(git+https://sourceware.org/git/binutils-gdb.git#commit=${_commit})
sha256sums=('07a821f494fbb61dcf9e958f6f840eaa4a45c748c59415fd3ea1ec4b3326673c')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

pkgver() {
  cd binutils-gdb
  git describe --abbrev=12 --tags | sed 's/[^-]*-//;s/[^-]*-/&r/;s/-/+/g;s/_/./'
}

prepare() {
  if [ ! -d "${srcdir}"/binutils-gdb ]; then
    ln -s "${srcdir}"/binutils-${pkgver} "${srcdir}"/binutils-gdb
  fi
  mkdir "${srcdir}"/binutils-build
}

build() {
  cd "${srcdir}"/binutils-build

  "${srcdir}"/binutils-gdb/configure \
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
    --enable-multilib \
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
