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
pkgver=2.41
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files"
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(glibc libelf zlib zstd)
makedepends=(gcc glibc libelf zlib zstd)
source=(https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz{,.sig})
sha256sums=('ae9a5789e23459e59606e6714723f2d3ffc31c03174191ef0d015bdf06007450'
            'SKIP')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
  mkdir -p binutils-build

  cd binutils-${pkgver}
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  cd ../binutils-build
}

build() {
  cd binutils-build

  ../binutils-${pkgver}/configure \
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
  cd binutils-build

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # ignore failures in gold testsuite...
  make -k LDFLAGS="" check || true
}

package() {
  cd binutils-build

  make DESTDIR="${pkgdir}" install

  # elfedit does not support ARM and gprof makes no sense as a cross tool
  rm -rf "${pkgdir}"/usr/bin/*-{elfedit,gprof}
  # collides with system installation of binutils
  rm -rf "${pkgdir}"/usr/lib
  rm -rf "${pkgdir}"/usr/share
}
