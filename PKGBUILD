# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=devkitppc
pkgver=r29.1
_binutilsver=2.27
_mnbinutilsver=2.17
_gccver=6.3.0
_newlibver=2.5.0
_gdbver=7.11
_wiiloadver=0.5.1
_generaltoolsver=1.0.0
_gamecubetoolsver=1.0.1
_islver=0.16.1
pkgrel=1
pkgdesc='PowerPC toolchain for Nintendo Gamecube/Wii/Wii U homebrew development'
arch=('i686' 'x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
depends=('xz' 'python' 'freeimage' 'flex' 'libmpc' 'guile')
makedepends=('mesa')
install=devkitppc.install
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/buildscripts-20170126.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/binutils-$_binutilsver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/binutils-$_mnbinutilsver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gcc-$_gccver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/newlib-$_newlibver.tar.gz"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gdb-$_gdbver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/wiiload-$_wiiloadver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/general-tools-$_generaltoolsver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gamecube-tools-$_gamecubetoolsver.tar.bz2"
        "http://isl.gforge.inria.fr/isl-$_islver.tar.bz2"
        "devkitppc-skip-libs.patch"
        "devkitppc-use-in-tree-isl.patch"
        "devkitppc.sh"
        "devkitppc.fish")
sha256sums=('6b142f265bc9c7fc9449f5b539198f140d231725b2ed0828749d8a1e0fad73ff'
            '369737ce51587f92466041a97ab7d2358c6d9e1b6490b3940eb09fb0a9a6ac88'
            'e2c33ce6f23c9a366f109ced295626cb2f8bd6b2f08ff9df6dafb5448505a25e'
            'f06ae7f3f790fbf0f018f6d40e844451e6bc3b7bc96e128e63b09825c1f8b29f'
            '5b76a9b97c9464209772ed25ce55181a7bb144a66e5669aaec945aa64da3189b'
            '67501030b8d5496ae3157e1c53c9b40fffbd794f210144064fcd18d2538f5a84'
            '95557ecae364d189fb771702af56c1c6f9ee076696046b78e7a2e931974533cc'
            '09474dfc1537e1008ee95b1a39a53715b8a740ee5ee37f4376607d6b110343c4'
            '6144c82539c28fed9eb06780e27e39f954d3da42d9250daa4b20692c4d52ff32'
            '412538bb65c799ac98e17e8cfcdacbb257a57362acfaaff254b0fcae970126d2'
            '62e9f2730a81a71efc7bc5f958d7186f48a6468ea3b5481ea8331418cc40cb7b'
            '745fdf40c11829044c02dedd39371163cdd0952d13cd88fd9cb32a8bd8e5dfa9'
            '3e7ab84e123f76c65a92c27932b4f80df598b9da6b0f44745d8d465120449d1d'
            'ab0c74e766fab7ada98541c530593b9f717a72d386f9bb9dad2779a080c66b9d')
noextract=("binutils-$_binutilsver.tar.bz2" "binutils-$_mnbinutilsver.tar.bz2"
           "gcc-$_gccver.tar.bz2" "newlib-$_newlibver.tar.gz"
           "gdb-$_gdbver.tar.bz2" "wiiload-$_wiiloadver.tar.bz2"
           "general-tools-$_generaltoolsver.tar.bz2"
           "gamecube-tools-$_gamecubetoolsver.tar.bz2")

prepare() {
  # reset build dir and force reinstalling already built tools
  rm -rf build
  [ -d buildscripts/.devkitPPC ] && find buildscripts/.devkitPPC \
    \( -name "installed-*" -o -name "installed" \) -delete

  # generate config file for automatic build
  cat << END > buildscripts/config.sh
#!bin/sh
BUILD_DKPRO_PACKAGE=2
BUILD_DKPRO_INSTALLDIR=$PWD/build
BUILD_DKPRO_SRCDIR=$PWD
BUILD_DKPRO_AUTOMATED=1
END

  # fix install of newlib, solution is to do the install again.
  sed 's/Error installing newlib"; exit 1; }/newlib, second try"; $MAKE install || { echo "& }/' \
    -i buildscripts/dkppc/scripts/build-gcc.sh

  # fix search path to use correct tools
  sed 's|$PATH:$TOOLPATH/$package/bin|$TOOLPATH/$package/bin:$PATH|' -i \
    buildscripts/build-devkit.sh

  # use in-tree isl
  patch -Np0 < devkitppc-use-in-tree-isl.patch
  # isl needlessly wants automake-14, upgrading
  autoreconf -Wnone -fi isl-$_islver

  # disable building of libogc and libfat, we have separate packages
  patch -Np0 < devkitppc-skip-libs.patch
}

build() {
  cd buildscripts

  # disable conflicting build flags
  unset CPPFLAGS
  ./build-devkit.sh
}

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r build/devkitPPC "$pkgdir"/opt/devkitpro
  # gzip manually, as makepkg only cares for standard directories
  gzip "$pkgdir"/opt/devkitpro/devkitPPC/share/man/man*/*
  gzip "$pkgdir"/opt/devkitpro/devkitPPC/man/man*/*
  gzip "$pkgdir"/opt/devkitpro/devkitPPC/share/info/*
  gzip "$pkgdir"/opt/devkitpro/devkitPPC/info/*
  # export environment variables
  install -Dm755 devkitppc.sh "$pkgdir"/etc/profile.d/devkitppc.sh
  install -Dm644 devkitppc.fish "$pkgdir"/etc/fish/conf.d/devkitppc.fish
}
