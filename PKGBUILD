# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: aarch64-binutils -> aarch64-linux-api-headers -> aarch64-gcc-bootstrap -> aarch64-glibc -> aarch64-gcc -> aarch64-glibc (again)

_arch=aarch64
_target=$_arch-unknown-linux-gnu
pkgname=$_arch-gcc-bootstrap
pkgver=10.2.0
_islver=0.23
pkgrel=2
#_snapshot=8-20190111
pkgdesc='The GNU Compiler Collection - cross compiler for ARM64 target'
arch=(x86_64)
url='https://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=(libmpc zstd)
makedepends=($_arch-binutils)
provides=($_arch-gcc)
conflicts=($_arch-gcc)
options=(!emptydirs !strip staticlibs)
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig}
        #https://gcc.gnu.org/pub/gcc/snapshots/$_snapshot/gcc-$_snapshot.tar.xz
        http://isl.gforge.inria.fr/isl-$_islver.tar.bz2)
sha256sums=('b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c'
            'SKIP'
            'c58922c14ae7d0791a77932f377840890f19bc486b653fa64eba7f1026fb214d')
validpgpkeys=(33C235A34C46AA3FFB293709A328C3A2C3C45C06  # Jakub Jelinek <jakub@redhat.com>
              13975A70E63C361C73AE69EF6EEB81F8981C74C7) # Richard Guenther <richard.guenther@gmail.com>

if [ -n "$_snapshot" ]; then
  _basedir=gcc-$_snapshot
else
  _basedir=gcc-$pkgver
fi

prepare() {
  cd $_basedir

  # link isl for in-tree builds
  ln -sf ../isl-$_islver isl

  #hack - Having CPPFLAGS defined makes the build barf. Workaround it like this:
  _cppflags=$CPPFLAGS
  CFLAGS="$_cppflags $CFLAGS"
  CXXFLAGS="$_cppflags $CXXFLAGS"
  unset CPPFLAGS

  rm -rf "$srcdir"/gcc-build
  mkdir "$srcdir"/gcc-build
}

build() {
  cd gcc-build

  "$srcdir"/$_basedir/configure \
      --prefix=/usr \
      --with-sysroot=/usr/$_target/sys-root \
      --libexecdir=/usr/lib \
      --target=$_target \
      --disable-nls --enable-default-pie \
      --enable-languages=c,c++ \
      --with-system-zlib --with-isl --enable-__cxa_atexit \
      --enable-linker-build-id \
      --enable-plugin \
      --with-linker-hash-style=gnu --enable-gnu-indirect-function \
      --disable-multilib --disable-werror \
      --enable-checking=release --enable-host-shared \
		--with-arch=armv8-a \
      --enable-fix-cortex-a53-835769 --enable-fix-cortex-a53-843419 \
      --disable-threads --without-headers --with-glibc-version=2.33 \
      --disable-shared --with-newlib

  make all-gcc all-target-libgcc
}

package() {
  cd gcc-build

  make install-strip-gcc install-strip-target-libgcc DESTDIR="$pkgdir"
  ln -s $_target-gcc "$pkgdir"/usr/bin/$_target-cc
  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/{include,share}

  #workaround for fakeroot bug
  chown -R root:root "$pkgdir"/usr

}
