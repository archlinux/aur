# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=devkitarm
pkgver=r48
_buildscriptsver=20180514
_binutilsver=2.30
_gccver=8.1.0
_newlibver=3.0.0
_gdbver=8.0
pkgrel=1
pkgdesc="ARM toolchain for GP32, Nintendo (3)DS and GBA homebrew development"
arch=('x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
depends=('flex' 'libmpc' 'python' 'xz')
install=devkitarm.install
source=("https://github.com/devkitPro/buildscripts/releases/download/v$_buildscriptsver/buildscripts-$_buildscriptsver.tar.bz2"
        "https://ftp.gnu.org/gnu/binutils/binutils-$_binutilsver.tar.bz2"
        "https://ftp.gnu.org/gnu/gcc/gcc-$_gccver/gcc-$_gccver.tar.xz"
        "ftp://sourceware.org/pub/newlib/newlib-$_newlibver.tar.gz"
        "https://ftp.gnu.org/gnu/gdb/gdb-$_gdbver.tar.xz"
        "devkitarm.sh"
        "devkitarm.fish")
sha256sums=('c7c11bacfdbcc634d2d70ac17785a0701d5eaaa6753762ca57a918c3841119ac'
            'efeade848067e9a03f1918b1da0d37aaffa0b0127a06b5e9236229851d9d0c09'
            '1d1866f992626e61349a1ccd0b8d5253816222cdc13390dcfaa74b093aa2b153'
            'c8566335ee74e5fcaeb8595b4ebd0400c4b043d6acb3263ecb1314f8f5501332'
            'f6a24ffe4917e67014ef9273eb8b547cb96a13e5ca74895b06d683b391f3f4ee'
            '2162a4cf8ae8567b5ddff631474f28b6a0a5d0bce43915396b7dea602e2131e0'
            '13357e81de7ec8d7ad7f9fb37a78c23c4f99c6f7ca67d3a0070eedc388deb938')
noextract=("binutils-$_binutilsver.tar.bz2" "gcc-$_gccver.tar.xz"
           "newlib-$_newlibver.tar.gz" "gdb-$_gdbver.tar.xz")

prepare() {
  # reset build dir and force reinstalling already built tools
  rm -rf build
  [ -d buildscripts/.devkitARM ] && find buildscripts/.devkitARM \
    \( -name "installed-*" -o -name "installed" \) -delete

  (cd buildscripts
    # generate config file for automatic build
    cat << END > config.sh
#!bin/sh
BUILD_DKPRO_PACKAGE=1
BUILD_DKPRO_INSTALLDIR="$srcdir"/build
BUILD_DKPRO_SRCDIR="$srcdir"
BUILD_DKPRO_SKIP_LIBRARIES=1
BUILD_DKPRO_SKIP_TOOLS=1
BUILD_DKPRO_AUTOMATED=1
END

    # do not try to download or extract tool packages and libraries
    sed 's/ \$hostarchives/ ""/g;s/ \$targetarchives/ ""/g' -i build-devkit.sh

    # do not build gdb with guile support (broken)
    sed '/gdb/,$ s/--disable-werror/& --with-guile=no/' -i dkarm-eabi/scripts/build-gcc.sh

    # fix search path to use correct tools
    sed 's|$PATH:$TOOLPATH/$package/bin|$TOOLPATH/$package/bin:$PATH|' -i \
      build-devkit.sh
  )
}

build() {
  cd buildscripts

  # disable conflicting build flags
  unset CPPFLAGS
  ./build-devkit.sh
}

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r build/devkitARM "$pkgdir"/opt/devkitpro
  # gzip manually, as makepkg only cares for standard directories
  gzip "$pkgdir"/opt/devkitpro/devkitARM/share/man/man*/*
  gzip "$pkgdir"/opt/devkitpro/devkitARM/share/info/*
  # export environment variables
  install -Dm755 devkitarm.sh "$pkgdir"/etc/profile.d/devkitarm.sh
  install -Dm644 devkitarm.fish "$pkgdir"/etc/fish/conf.d/devkitarm.fish
}
