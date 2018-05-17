# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=devkita64
pkgver=r9
_buildscriptsver=20180514
_binutilsver=2.30
_gccver=8.1.0
_newlibver=3.0.0
_gdbver=8.0
pkgrel=1
pkgdesc="AArch64 toolchain for Nintendo Switch homebrew development"
arch=('x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
depends=('flex' 'libmpc' 'python' 'xz')
install=devkita64.install
source=("https://github.com/devkitPro/buildscripts/releases/download/v$_buildscriptsver/buildscripts-$_buildscriptsver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/binutils-$_binutilsver.tar.bz2"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gcc-$_gccver.tar.xz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/newlib-$_newlibver.tar.gz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gdb-$_gdbver.tar.xz"
        "devkita64.sh"
        "devkita64.fish")
sha256sums=('c7c11bacfdbcc634d2d70ac17785a0701d5eaaa6753762ca57a918c3841119ac'
            'efeade848067e9a03f1918b1da0d37aaffa0b0127a06b5e9236229851d9d0c09'
            '1d1866f992626e61349a1ccd0b8d5253816222cdc13390dcfaa74b093aa2b153'
            'c8566335ee74e5fcaeb8595b4ebd0400c4b043d6acb3263ecb1314f8f5501332'
            'f6a24ffe4917e67014ef9273eb8b547cb96a13e5ca74895b06d683b391f3f4ee'
            'c71d64c68947c25bf48a5141589f107f5d6269e38e37c4bf528f614ff37b8981'
            'a068e1d2fbbd07f4f520824d256696244bcf85da7bf2142a1a0fe1bd550490e8')
noextract=("binutils-$_binutilsver.tar.bz2" "gcc-$_gccver.tar.xz"
           "newlib-$_newlibver.tar.gz" "gdb-$_gdbver.tar.xz")

prepare() {
  # reset build dir and force reinstalling already built tools
  rm -rf build
  [ -d buildscripts/.devkitA64 ] && find buildscripts/.devkitA64 \
    \( -name "installed-*" -o -name "installed" \) -delete

  (cd buildscripts
    # generate config file for automatic build
    cat << END > config.sh
#!bin/sh
BUILD_DKPRO_PACKAGE=3
BUILD_DKPRO_INSTALLDIR="$srcdir"/build
BUILD_DKPRO_SRCDIR="$srcdir"
BUILD_DKPRO_SKIP_LIBRARIES=1
BUILD_DKPRO_SKIP_TOOLS=1
BUILD_DKPRO_AUTOMATED=1

END

    # do not try to download or extract tool packages
    sed 's/ \$hostarchives/ ""/g' -i build-devkit.sh

    # do not build gdb with guile support (broken)
    sed '/gdb/,$ s/--disable-werror/& --with-guile=no/' -i dka64/scripts/build-gcc.sh

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
  cp -r build/devkitA64 "$pkgdir"/opt/devkitpro
  # gzip manually, as makepkg only cares for standard directories
  gzip "$pkgdir"/opt/devkitpro/devkitA64/share/man/man*/*
  gzip "$pkgdir"/opt/devkitpro/devkitA64/share/info/*
  # export environment variable
  install -Dm755 devkita64.sh "$pkgdir"/etc/profile.d/devkita64.sh
  install -Dm644 devkita64.fish "$pkgdir"/etc/fish/conf.d/devkita64.fish
}
