# Maintainer: Albert Graef <aggraef@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Sebastian Nowicki <sebnow@gmail.com>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

# These packages are meant to be used for compiling packages that haven't been
# ported to LLVM 3.6 yet. Such packages may depend on llvm35-libs but not on
# llvm35 or clang35 which aren't co-installable with the LLVM 3.6 packages.

# AG Fri Apr 6 07:18:08 CEST 2018: Resurrected from extra from which it
# recently got kicked, with the following changes:

# - couldn't get compiler-rt to compile any more, disabled for now

# - include the host target only, to speed up compilation; if you need the
#   cross compilation targets, change the configure option in the build
#   function to --enable-targets=all

# Please note that this is a split package, thus you need to install this with
# an AUR helper such as aurman which supports that kind of thing, or download
# the PKGBUILD and install manually using makepkg.

pkgbase=llvm35
pkgname=('llvm35' 'llvm35-libs' 'clang35')
pkgver=3.5.2
pkgrel=7
arch=('x86_64')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=('libffi' 'python-sphinx')
# Use gcc-multilib to build 32-bit compiler-rt libraries on x86_64 (FS#41911)
makedepends_x86_64=('gcc-multilib')
options=('staticlibs')
source=(https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz
        https://releases.llvm.org/$pkgver/cfe-$pkgver.src.tar.xz
        #https://releases.llvm.org/$pkgver/compiler-rt-$pkgver.src.tar.xz
        llvm-3.5.0-force-link-pass.o.patch
        gcc5.patch
        gcc10.patch
        llvm-Config-config.h
        llvm-Config-llvm-config.h)
sha256sums=('44196156d5749eb4b4224fe471a29cc3984df92570a4a89fa859f7394fc0c575'
            '4feb575f74fb3a74b6245400460230141bf610f235ef3a25008cfe6137828620'
            #'542d7aadd21e7fe35bea0a7912bc965f08a1a566746cebcca76f96dcfeb74dc3'
            '5702053503d49448598eda1b8dc8c263f0df9ad7486833273e3987b5dec25a19'
            'c964eecdfb0cbf4d2a59a553d7bdb3f16e70d8910e6aa7e9c768828ecbdfcea2'
            '75bfba16c3bf6fd4fc3d4807969f64a68e5259ca6d15b560333cdac9baf09df2'
            '312574e655f9a87784ca416949c505c452b819fad3061f2cde8aced6540a19a3'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48')

prepare() {
  cd "$srcdir/llvm-$pkgver.src"

  # At the present, clang must reside inside the LLVM source code tree to build
  # See http://llvm.org/bugs/show_bug.cgi?id=4840
  mv "$srcdir/cfe-$pkgver.src" tools/clang

  # AG: Can't get this to compile -- disabled for now.
  #mv "$srcdir/compiler-rt-$pkgver.src" projects/compiler-rt

  # Fix docs installation directory
  sed -i 's:$(PROJ_prefix)/docs/llvm:$(PROJ_prefix)/share/doc/llvm:' \
    Makefile.config.in

  # Fix definition of LLVM_CMAKE_DIR in LLVMConfig.cmake
  sed -i '/@LLVM_CONFIG_CMAKE_DIR@/s:$(PROJ_cmake):$(PROJ_prefix)/share/llvm/cmake:' \
    cmake/modules/Makefile

  # Fix build with GCC 4.9 (patch from Debian)
  # http://llvm.org/bugs/show_bug.cgi?id=20067
  patch -Np1 -i ../llvm-3.5.0-force-link-pass.o.patch

  # Fix build with GCC 5.1
  # http://llvm.org/viewvc/llvm-project?view=revision&revision=218295
  patch -Np0 -i ../gcc5.patch

  # -fvisibility-inlines-hidden breaks the build with GCC 10
  patch -Np0 -i ../gcc10.patch
}

build() {
  cd "$srcdir/llvm-$pkgver.src"

  # Include location of libffi headers in CPPFLAGS
  CPPFLAGS+=" $(pkg-config --cflags libffi)"

  # Force the use of GCC instead of clang
  # AG: Only build the host target for now, builds much quicker.
  CC=gcc CXX=g++ \
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-shared \
    --enable-optimized \
    --enable-libffi \
    --enable-targets=host \
    --disable-assertions \
    --with-binutils-include=/usr/include

  make REQUIRES_RTTI=1
  make -C docs -f Makefile.sphinx man
  make -C docs -f Makefile.sphinx html
  make -C tools/clang/docs -f Makefile.sphinx html
}

package_llvm35() {
  pkgdesc="Low Level Virtual Machine"
  depends=("llvm35-libs=$pkgver-$pkgrel" 'perl')
  conflicts=('llvm')

  cd "$srcdir/llvm-$pkgver.src"

  # We move the clang directory out of the tree so it won't get installed and
  # then we bring it back in for the clang package
  mv tools/clang "$srcdir"

  make DESTDIR="$pkgdir" install
  mv "$srcdir/clang" tools/

  # The runtime library goes into llvm35-libs
  mv -f "$pkgdir/usr/lib/libLLVM-$pkgver.so" "$srcdir/"
  mv -f "$pkgdir/usr/lib/libLLVM-${pkgver%.*}.so" "$srcdir/"

  # Fix permissions of static libs
  chmod -x "$pkgdir"/usr/lib/*.a

  # Get rid of example Hello transformation
  rm "$pkgdir"/usr/lib/*LLVMHello.*

  # Remove LTO libs which conflict with llvm-libs
  rm "$pkgdir"/usr/lib/{LLVMgold,libLTO,BugpointPasses}.so

  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stubs are taken from Fedora
    for _header in config llvm-config; do
      mv "$pkgdir/usr/include/llvm/Config/$_header"{,-64}.h
      cp "$srcdir/llvm-Config-$_header.h" \
        "$pkgdir/usr/include/llvm/Config/$_header.h"
    done
  fi

  # Install man pages
  install -d "$pkgdir/usr/share/man/man1"
  cp docs/_build/man/*.1 "$pkgdir/usr/share/man/man1/"

  # Install html docs
  cp -r docs/_build/html/* "$pkgdir/usr/share/doc/llvm/html/"
  rm -r "$pkgdir/usr/share/doc/llvm/html/_sources"

  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_llvm35-libs() {
  pkgdesc="Low Level Virtual Machine (runtime library)"
  depends=('gcc-libs' 'zlib' 'libffi' 'ncurses' 'libedit')

  install -d "$pkgdir/usr/lib"
  cp -P \
    "$srcdir/libLLVM-$pkgver.so" \
    "$srcdir/libLLVM-${pkgver%.*}.so" \
    "$pkgdir/usr/lib/"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_clang35() {
  pkgdesc="C language family frontend for LLVM"
  url="http://clang.llvm.org/"
  depends=("llvm35-libs=$pkgver-$pkgrel" 'gcc')
  optdepends=('llvm-libs: for compiling with -flto')
  conflicts=('clang')

  # Fix installation path for clang docs
  sed -i 's:$(PROJ_prefix)/share/doc/llvm:$(PROJ_prefix)/share/doc/clang:' \
    "$srcdir/llvm-$pkgver.src/Makefile.config"

  cd "$srcdir/llvm-$pkgver.src/tools/clang"

  make DESTDIR="$pkgdir" install

  # Fix permissions of static libs
  chmod -x "$pkgdir"/usr/lib/*.a

  # Revert the path change in case we want to do a repackage later
  sed -i 's:$(PROJ_prefix)/share/doc/clang:$(PROJ_prefix)/share/doc/llvm:' \
    "$srcdir/llvm-$pkgver.src/Makefile.config"

  # Install html docs
  cp -r docs/_build/html/* "$pkgdir/usr/share/doc/clang/html/"
  rm -r "$pkgdir/usr/share/doc/clang/html/_sources"

  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
