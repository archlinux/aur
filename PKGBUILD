# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=devkitppc
pkgver=r27
pkgrel=2
pkgdesc='PowerPC toolchain for Nintendo Gamecube/Wii homebrew development'
arch=('i686' 'x86_64')
url="http://www.devkitpro.org/"
license=('GPL')
options=(!strip libtool staticlibs)
depends=('xz' 'python' 'freeimage' 'cloog' 'flex' 'libmpc')
makedepends=('mesa')
install=devkitppc.install
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/buildscripts-20140402.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/binutils-2.24.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gcc-4.8.2.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/newlib-2.0.0.tar.gz"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gdb-7.7.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gxtexconv-0.1.9.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gcdspsuite-1.4.0.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/wiiload-0.5.1.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/elf2dol-1.0.0.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/general-tools-1.0.0.tar.bz2"
        "devkitppc-skip-libs.patch"
        "devkitppc.sh")
sha256sums=('f272442812d44ae22bae8597c9325cb0035a901c59b4a62140dbedc7c31cbaec'
            'e5e8c5be9664e7f7f96e0d09919110ab5ad597794f5b1809871177a0f0f14137'
            '09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e1d773ce2d7e3cdc8'
            '49c29e9129325e7c3b221aa829743ddcd796d024440e47c80fc0d6769af72d8a'
            '0404d1c6ee6b3ddd811722b5197944758d37b4591c216030effbac204f5a6c23'
            '8d89d21d2f53b6e3d43a9721e8f2e8131b9a18535c2b8fbce49a7b0cf769c4c1'
            'ef7bd516f81c6bd5ad792f6930f7ca878ec12ea7eedff2517cac6138e68e763a'
            '95557ecae364d189fb771702af56c1c6f9ee076696046b78e7a2e931974533cc'
            '957bc20fea6a09915504a1a8cf99a36dba0de9427218b9f5e6c021a6f27c7adf'
            '09474dfc1537e1008ee95b1a39a53715b8a740ee5ee37f4376607d6b110343c4'
            '54c0d89610614a725c4505aed2bc5bab7eb5a6db729cc29878fe98a575b1e831'
            'a7bb9f8050601cf1fad4a8bcb04c2bf24b1d29f93c7dc567ddb7e610388a04a0')
noextract=('binutils-2.24.tar.bz2' 'gcc-4.8.2.tar.bz2' 'newlib-2.0.0.tar.gz'
           'gdb-7.7.tar.bz2' 'gxtexconv-0.1.9.tar.bz2' 'gcdspsuite-1.4.0.tar.bz2'
           'wiiload-0.5.1.tar.bz2' 'elf2dol-1.0.0.tar.bz2' 'general-tools-1.0.0.tar.bz2')

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

  # disable building of libogc and libfat, we have seperate packages
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
  # export environment variables
  install -Dm755 devkitppc.sh "$pkgdir"/etc/profile.d/devkitppc.sh
}
