# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=devkitarm
pkgver=r53
_buildscriptsver=20190701
_binutilsver=2.32
_gccver=9.1.0
_newlibver=3.1.0
_gdbver=8.2.1
pkgrel=1
pkgdesc="ARM toolchain for GP32, Nintendo (3)DS and GBA homebrew development"
arch=('x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
depends=('flex' 'libmpc' 'python' 'xz')
conflicts=('devkitARM')
provides=('devkitARM')
install=devkitarm.install
source=(buildscripts-$_buildscriptsver.tar.gz::"https://github.com/devkitPro/buildscripts/archive/v$_buildscriptsver.tar.gz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/binutils-$_binutilsver.tar.xz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gcc-$_gccver.tar.xz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/newlib-$_newlibver.tar.gz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gdb-$_gdbver.tar.xz"
        "devkitarm.sh"
        "devkitarm.fish")
sha256sums=('3dbe4ee7ef819cb5ee0dd87632eea69cfe355d0f5723ce58343775a5ab6684d5'
            '0ab6c55dd86a92ed561972ba15b9b70a8b9f75557f896446c82e8b36e473ee04'
            '79a66834e96a6050d8fe78db2c3b32fb285b230b855d0a66288235bc04b327a0'
            'fb4fa1cc21e9060719208300a61420e4089d6de6ef59cf533b57fe74801d102a'
            'baaabb28026ba47e3fd56f0138e020c9b3d51e11800a3b220d736fae8e677112'
            '2162a4cf8ae8567b5ddff631474f28b6a0a5d0bce43915396b7dea602e2131e0'
            '13357e81de7ec8d7ad7f9fb37a78c23c4f99c6f7ca67d3a0070eedc388deb938')
noextract=("binutils-$_binutilsver.tar.xz" "gcc-$_gccver.tar.xz"
           "newlib-$_newlibver.tar.gz" "gdb-$_gdbver.tar.xz")

prepare() {
  # reset build dir
  rm -rf build

  (cd buildscripts-$_buildscriptsver
    # force reinstalling already built tools
    [ -d .devkitARM ] && find .devkitARM \( -name "installed-*" -o -name "installed" \) -delete

    # generate config file for automatic build
    cat << END > config.sh
#!bin/sh
BUILD_DKPRO_PACKAGE=1
BUILD_DKPRO_INSTALLDIR="$srcdir"/build
BUILD_DKPRO_SRCDIR="$srcdir"
BUILD_DKPRO_SKIP_TOOLS=1
BUILD_DKPRO_AUTOMATED=1
END

    # do not try to download or extract tool packages
    sed 's/ \$hostarchives/ ""/g;s/archives=\"devkitarm.*//' -i build-devkit.sh

    # do not build gdb with guile support (broken)
    sed '/gdb/,$ s/--disable-werror/& --with-guile=no/' -i dkarm-eabi/scripts/build-gcc.sh

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
  cp -r build/devkitARM "$pkgdir"/opt/devkitpro
  # gzip manually, as makepkg only cares for standard directories
  gzip "$pkgdir"/opt/devkitpro/devkitARM/share/man/man*/*
  gzip "$pkgdir"/opt/devkitpro/devkitARM/share/info/*
  # export environment variables
  install -Dm755 devkitarm.sh "$pkgdir"/etc/profile.d/devkitarm.sh
  install -Dm644 devkitarm.fish "$pkgdir"/etc/fish/conf.d/devkitarm.fish
}
