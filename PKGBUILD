# -*- mode: shell-script -*-
# Maintainer: Manuel Reimer <mail+wine@m-reimer.de>

# This PKGBUILD builds a glibc with a "hack" required to run League Of Legends
# with wine-staging (wine-lol)
# See: https://bugs.winehq.org/show_bug.cgi?id=47198#c17

pkgname=wine-lol-glibc
pkgdesc='GNU C Library patched for wine-lol'
pkgver=2.33
pkgrel=1
arch=(x86_64)
url='https://www.gnu.org/software/libc'
license=(GPL LGPL)
makedepends=(git gd lib32-gcc-libs python)
depends=('linux-api-headers>=4.10' tzdata filesystem)
optdepends=('gd: for memusagestat')
options=(!strip staticlibs)
#_commit=067fc32968b601493f4b247a3ac00caeea3f3d61
#source=(git+https://sourceware.org/git/glibc.git#commit=$_commit
source=(https://ftp.gnu.org/gnu/glibc/glibc-$pkgver.tar.xz
        bz27343.patch
        wine-lol-poc1-glibc.diff::https://bugs.winehq.org/attachment.cgi?id=64482)
md5sums=('390bbd889c7e8e8a7041564cb6b27cca'
         'cfe57018d06bf748b8ca1779980fef33'
         '65e6d204ab9ad787c8dce999c4ba5c17')

prepare() {
  mkdir -p glibc-build lib32-glibc-build

  [[ -d glibc-$pkgver ]] && ln -s glibc-$pkgver glibc
  cd glibc

  # commit c3479fb7939898ec22c655c383454d6e8b982a67
  patch -p1 -i "$srcdir"/bz27343.patch

  # Add wine-lol glibc hack
  patch -p1 -i "$srcdir/wine-lol-poc1-glibc.diff"
}

build() {
  local _configure_flags=(
      --prefix=/opt/wine-lol
      --sysconfdir=/etc
      --datarootdir=/usr/share
      --with-headers=/usr/include
      --with-bugurl=https://bugs.archlinux.org/
      --enable-add-ons
      --enable-bind-now
      --enable-lock-elision
      --enable-multi-arch
      --enable-stack-protector=strong
      --enable-stackguard-randomization
      --enable-static-pie
      --disable-profile
      --disable-werror
  )

  cd "$srcdir/lib32-glibc-build"
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"

  echo "slibdir=/opt/wine-lol/lib32" >> configparms
  echo "rtlddir=/opt/wine-lol/lib32" >> configparms
  echo "sbindir=/opt/wine-lol/bin" >> configparms
  echo "rootsbindir=/opt/wine-lol/bin" >> configparms

  # remove fortify for building libraries
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/} # Before and
  CFLAGS=${CFLAGS/-D_FORTIFY_SOURCE=2,/} # after https://github.com/archlinux/svntogit-packages/commit/a790c38
  CFLAGS=${CFLAGS/-fno-plt/}
  CXXFLAGS=${CXXFLAGS/-fno-plt/}

  "$srcdir/glibc/configure" \
      --host=i686-pc-linux-gnu \
      --libdir=/opt/wine-lol/lib32 \
      --libexecdir=/opt/wine-lol/lib32 \
      ${_configure_flags[@]}

  # build libraries with fortify disabled
  echo "build-programs=no" >> configparms
  make

  # re-enable fortify for programs
  sed -i "/build-programs=/s#no#yes#" configparms

  echo "CC += -D_FORTIFY_SOURCE=2" >> configparms
  echo "CXX += -D_FORTIFY_SOURCE=2" >> configparms
  make
}

package() {
  cd lib32-glibc-build

  make install_root="$pkgdir" install

  # Dynamic linker
#  install -d "$pkgdir/opt/wine-lol/lib"
#  ln -s ../lib32/ld-linux.so.2 "$pkgdir/opt/wine-lol/lib/"

  # Symlink /opt/wine-lol/lib32/locale to /usr/lib/locale
  ln -s /usr/lib/locale "$pkgdir/opt/wine-lol/lib32/locale"

  if check_option 'debug' n; then
    find "$pkgdir"/opt/wine-lol/bin -type f -executable -exec strip $STRIP_BINARIES {} + 2> /dev/null || true
    find "$pkgdir"/opt/wine-lol/lib -name '*.a' -type f -exec strip $STRIP_STATIC {} + 2> /dev/null || true

    find "$pkgdir"/opt/wine-lol/lib32 -name '*.a' -type f -exec strip $STRIP_STATIC {} + 2> /dev/null || true
    find "$pkgdir"/opt/wine-lol/lib32 \
      -not -name 'ld-*.so' \
      -not -name 'libc-*.so' \
      -not -name 'libpthread-*.so' \
      -not -name 'libthread_db-*.so' \
      -name '*-*.so' -type f -exec strip $STRIP_SHARED {} + 2> /dev/null || true
  fi

  # These have been installed to the same location as the files in the
  # "system glibc" intentionally to make our glibc use the system files.
  rm -r "$pkgdir/usr/share"
  rm -r "$pkgdir/etc"
  rmdir "$pkgdir/usr" # should be empty now

  # Provided by lib32-libxcrypt;
  rm -f "$pkgdir"/opt/wine-lol/lib32/libcrypt.{a,so}
}
