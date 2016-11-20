# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=devkitppc
pkgver=r28
_binutilsver=2.27
_gccver=6.2.0
_newlibver=2.0.0
_gdbver=7.11
_wiiloadver=0.5.1
_generaltoolsver=1.0.0
_gamecubetoolsver=1.0.1
_islver=0.16.1
pkgrel=1
pkgdesc='PowerPC toolchain for Nintendo Gamecube/Wii/Wii U homebrew development'
arch=('i686' 'x86_64')
url="http://www.devkitpro.org/"
license=('GPL')
options=(!strip libtool staticlibs)
depends=('xz' 'python' 'freeimage' 'flex' 'libmpc' 'guile')
makedepends=('mesa')
install=devkitppc.install
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/buildscripts-20161115.tar.bz2"
        "https://ftp.gnu.org/gnu/binutils/binutils-$_binutilsver.tar.bz2"
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
sha256sums=('20fb9f3a56309dfba3093a95c7e8a012a83ea8256aaed768046bb59f7eddb987'
            '369737ce51587f92466041a97ab7d2358c6d9e1b6490b3940eb09fb0a9a6ac88'
            '9944589fc722d3e66308c0ce5257788ebd7872982a718aa2516123940671b7c5'
            '49c29e9129325e7c3b221aa829743ddcd796d024440e47c80fc0d6769af72d8a'
            '67501030b8d5496ae3157e1c53c9b40fffbd794f210144064fcd18d2538f5a84'
            '95557ecae364d189fb771702af56c1c6f9ee076696046b78e7a2e931974533cc'
            '09474dfc1537e1008ee95b1a39a53715b8a740ee5ee37f4376607d6b110343c4'
            '6144c82539c28fed9eb06780e27e39f954d3da42d9250daa4b20692c4d52ff32'
            '412538bb65c799ac98e17e8cfcdacbb257a57362acfaaff254b0fcae970126d2'
            '54c0d89610614a725c4505aed2bc5bab7eb5a6db729cc29878fe98a575b1e831'
            '50104095587110c6ccdd4479cf961072a70a7c76f9b9b25fd4c01c3bc1c95501'
            '3e7ab84e123f76c65a92c27932b4f80df598b9da6b0f44745d8d465120449d1d'
            'ab0c74e766fab7ada98541c530593b9f717a72d386f9bb9dad2779a080c66b9d')
noextract=("binutils-$_binutilsver.tar.bz2" "gcc-$_gccver.tar.bz2"
           "newlib-$_newlibver.tar.gz" "gdb-$_gdbver.tar.bz2"
           "wiiload-$_wiiloadver.tar.bz2"
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
BUILD_DKPRO_DOWNLOAD=2
BUILD_DKPRO_INSTALLDIR=$PWD/build
BUILD_DKPRO_SRCDIR=$PWD
BUILD_DKPRO_AUTOMATED=1
END

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
  gzip "$pkgdir"/opt/devkitpro/devkitPPC/share/info/*
  # export environment variables
  install -Dm755 devkitppc.sh "$pkgdir"/etc/profile.d/devkitppc.sh
  install -Dm644 devkitppc.fish "$pkgdir"/etc/fish/conf.d/devkitppc.fish
}
