# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=devkitppc
pkgver=r35
_buildscriptsver=20190701
_binutilsver=2.32
_mnbinutilsver=2.17
_gccver=8.3.0
_newlibver=3.1.0
_gdbver=8.2.1
pkgrel=1
pkgdesc='PowerPC toolchain for Nintendo Gamecube/Wii/Wii U homebrew development'
arch=('x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
depends=('flex' 'libmpc' 'python' 'xz')
conflicts=('devkitPPC')
provides=('devkitPPC')
install=devkitppc.install
source=(buildscripts-$_buildscriptsver.tar.gz::"https://github.com/devkitPro/buildscripts/archive/v$_buildscriptsver.tar.gz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/binutils-$_binutilsver.tar.xz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/binutils-$_mnbinutilsver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gcc-$_gccver.tar.xz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/newlib-$_newlibver.tar.gz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gdb-$_gdbver.tar.xz"
        "devkitppc.sh"
        "devkitppc.fish")
sha256sums=('3dbe4ee7ef819cb5ee0dd87632eea69cfe355d0f5723ce58343775a5ab6684d5'
            '0ab6c55dd86a92ed561972ba15b9b70a8b9f75557f896446c82e8b36e473ee04'
            'e2c33ce6f23c9a366f109ced295626cb2f8bd6b2f08ff9df6dafb5448505a25e'
            '64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c'
            'fb4fa1cc21e9060719208300a61420e4089d6de6ef59cf533b57fe74801d102a'
            'baaabb28026ba47e3fd56f0138e020c9b3d51e11800a3b220d736fae8e677112'
            '69755d0b77c0c3233dee9255a5d897710410be18b9dcdfb8d9d6b18c6945ae34'
            '135a9cbe1fc28c96c2ce38b19cd305857ce49ed56e35bfb5bd96638a51c3ec6f')
noextract=("binutils-$_binutilsver.tar.xz" "binutils-$_mnbinutilsver.tar.bz2"
           "gcc-$_gccver.tar.xz" "newlib-$_newlibver.tar.gz" "gdb-$_gdbver.tar.xz")

prepare() {
  # reset build dir
  rm -rf build

  (cd buildscripts-$_buildscriptsver
    # force reinstalling already built tools
    [ -d .devkitPPC ] && find .devkitPPC \( -name "installed-*" -o -name "installed" \) -delete

    # generate config file for automatic build
    cat << END > config.sh
#!bin/sh
BUILD_DKPRO_PACKAGE=2
BUILD_DKPRO_INSTALLDIR="$srcdir"/build
BUILD_DKPRO_SRCDIR="$srcdir"
BUILD_DKPRO_SKIP_TOOLS=1
BUILD_DKPRO_AUTOMATED=1
END

    # do not try to download or extract tool packages
    sed 's/ \$hostarchives/ ""/g;s/devkitppc-rules-.*xz//' -i build-devkit.sh

    # do not build gdb with guile support (broken)
    sed '/gdb/,$ s/--disable-werror/& --with-guile=no/' -i dkppc/scripts/build-gcc.sh

    # fix search path to use correct tools
    sed 's|$PATH:$TOOLPATH/$package/bin|$TOOLPATH/$package/bin:$PATH|' -i build-devkit.sh
  )
}

build() {
  cd buildscripts-$_buildscriptsver

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
