# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=devkitppc
pkgver=r30
_buildscriptsver=20180514
_binutilsver=2.28
_mnbinutilsver=2.17
_gccver=8.1.0
_newlibver=2.5.0
_gdbver=8.0.1
pkgrel=1
pkgdesc='PowerPC toolchain for Nintendo Gamecube/Wii/Wii U homebrew development'
arch=('x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
depends=('flex' 'libmpc' 'python' 'xz')
install=devkitppc.install
source=("https://github.com/devkitPro/buildscripts/releases/download/v$_buildscriptsver/buildscripts-$_buildscriptsver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/binutils-$_binutilsver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/binutils-$_mnbinutilsver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gcc-$_gccver.tar.xz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/newlib-$_newlibver.tar.gz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gdb-$_gdbver.tar.xz"
        "devkitppc.sh"
        "devkitppc.fish")
sha256sums=('c7c11bacfdbcc634d2d70ac17785a0701d5eaaa6753762ca57a918c3841119ac'
            '6297433ee120b11b4b0a1c8f3512d7d73501753142ab9e2daa13c5a3edd32a72'
            'e2c33ce6f23c9a366f109ced295626cb2f8bd6b2f08ff9df6dafb5448505a25e'
            '1d1866f992626e61349a1ccd0b8d5253816222cdc13390dcfaa74b093aa2b153'
            '5b76a9b97c9464209772ed25ce55181a7bb144a66e5669aaec945aa64da3189b'
            '3dbd5f93e36ba2815ad0efab030dcd0c7b211d7b353a40a53f4c02d7d56295e3'
            '69755d0b77c0c3233dee9255a5d897710410be18b9dcdfb8d9d6b18c6945ae34'
            '135a9cbe1fc28c96c2ce38b19cd305857ce49ed56e35bfb5bd96638a51c3ec6f')
noextract=("binutils-$_binutilsver.tar.bz2" "binutils-$_mnbinutilsver.tar.bz2"
           "gcc-$_gccver.tar.xz" "newlib-$_newlibver.tar.gz" "gdb-$_gdbver.tar.xz")

prepare() {
  # reset build dir and force reinstalling already built tools
  rm -rf build
  [ -d buildscripts/.devkitPPC ] && find buildscripts/.devkitPPC \
    \( -name "installed-*" -o -name "installed" \) -delete

  (cd buildscripts
    # generate config file for automatic build
    cat << END > config.sh
#!bin/sh
BUILD_DKPRO_PACKAGE=2
BUILD_DKPRO_INSTALLDIR="$srcdir"/build
BUILD_DKPRO_SRCDIR="$srcdir"
BUILD_DKPRO_SKIP_LIBRARIES=1
BUILD_DKPRO_SKIP_TOOLS=1
BUILD_DKPRO_AUTOMATED=1
END

    # do not try to download or extract tool packages and libraries
    sed 's/ \$hostarchives/ ""/g;s/ \$targetarchives/ ""/g' -i build-devkit.sh

    # do not build gdb with guile support (broken)
    sed '/gdb/,$ s/--disable-werror/& --with-guile=no/' -i dkppc/scripts/build-gcc.sh

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
