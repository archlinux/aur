# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=devkita64
pkgver=r13
_buildscriptsver=20190701
_binutilsver=2.32
_gccver=8.3.0
_newlibver=3.1.0
_gdbver=8.2.1
pkgrel=1
pkgdesc="AArch64 toolchain for Nintendo Switch homebrew development"
arch=('x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
depends=('flex' 'libmpc' 'python' 'xz')
conflicts=('devkitA64')
provides=('devkitA64')
install=devkita64.install
source=(buildscripts-$_buildscriptsver.tar.gz::"https://github.com/devkitPro/buildscripts/archive/v$_buildscriptsver.tar.gz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/binutils-$_binutilsver.tar.xz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gcc-$_gccver.tar.xz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/newlib-$_newlibver.tar.gz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gdb-$_gdbver.tar.xz"
        "devkita64.sh"
        "devkita64.fish")
sha256sums=('3dbe4ee7ef819cb5ee0dd87632eea69cfe355d0f5723ce58343775a5ab6684d5'
            '0ab6c55dd86a92ed561972ba15b9b70a8b9f75557f896446c82e8b36e473ee04'
            '64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c'
            'fb4fa1cc21e9060719208300a61420e4089d6de6ef59cf533b57fe74801d102a'
            'baaabb28026ba47e3fd56f0138e020c9b3d51e11800a3b220d736fae8e677112'
            'c71d64c68947c25bf48a5141589f107f5d6269e38e37c4bf528f614ff37b8981'
            'a068e1d2fbbd07f4f520824d256696244bcf85da7bf2142a1a0fe1bd550490e8')
noextract=("binutils-$_binutilsver.tar.xz" "gcc-$_gccver.tar.xz"
           "newlib-$_newlibver.tar.gz" "gdb-$_gdbver.tar.xz")

prepare() {
  # reset build dir
  rm -rf build

  (cd buildscripts-$_buildscriptsver
    # force reinstalling already built tools
    [ -d .devkitA64 ] && find .devkitA64 \( -name "installed-*" -o -name "installed" \) -delete

    # generate config file for automatic build
    cat << END > config.sh
#!bin/sh
BUILD_DKPRO_PACKAGE=3
BUILD_DKPRO_INSTALLDIR="$srcdir"/build
BUILD_DKPRO_SRCDIR="$srcdir"
BUILD_DKPRO_SKIP_TOOLS=1
BUILD_DKPRO_AUTOMATED=1
END

    # do not try to download or extract tool packages
    sed 's/ \$hostarchives/ ""/g' -i build-devkit.sh

    # do not build gdb with guile support (broken)
    #sed '/gdb/,$ s/--disable-werror/& --with-guile=no/' -i dka64/scripts/build-gcc.sh

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
  cp -r build/devkitA64 "$pkgdir"/opt/devkitpro
  # gzip manually, as makepkg only cares for standard directories
  gzip "$pkgdir"/opt/devkitpro/devkitA64/share/man/man*/*
  gzip "$pkgdir"/opt/devkitpro/devkitA64/share/info/*
  # export environment variable
  install -Dm755 devkita64.sh "$pkgdir"/etc/profile.d/devkita64.sh
  install -Dm644 devkita64.fish "$pkgdir"/etc/fish/conf.d/devkita64.fish
}
