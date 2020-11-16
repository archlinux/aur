# Maintainer: Corwin <corwin@kuiper.dev>

# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=devkitarm
pkgver=r55
_buildscriptsver=20201105
_rulesver=1.0.0
_crtlsver=1.0.0
_binutilsver=2.32
_gccver=10.1.0
_newlibver=3.3.0
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
        "https://github.com/devkitPro/devkitarm-rules/releases/download/v$_rulesver/devkitarm-rules-$_rulesver.tar.xz"
        "https://github.com/devkitPro/devkitarm-crtls/releases/download/v$_crtlsver/devkitarm-crtls-$_crtlsver.tar.xz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/binutils-$_binutilsver.tar.xz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gcc-$_gccver.tar.xz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/newlib-$_newlibver.tar.gz"
        "https://github.com/devkitPro/buildscripts/releases/download/sources/gdb-$_gdbver.tar.xz"
        "devkitarm.sh"
        "devkitarm.fish")
sha256sums=('a945e0300a9785a04fcaf0349c7c0fa63efbf93346a318cacb79d23f0840d543'
            '10ad51c68eda70cba4ca6ed4d0bfd938ad33199f254cb0412dff6edabc56fa70'
            'db8b2f6a08909a3cdd476b8b2e2ece3270d3d6b2bf625ef3da1edd25f345643c'
            '0ab6c55dd86a92ed561972ba15b9b70a8b9f75557f896446c82e8b36e473ee04'
            'b6898a23844b656f1b68691c5c012036c2e694ac4b53a8918d4712ad876e7ea2'
            '58dd9e3eaedf519360d92d84205c3deef0b3fc286685d1c562e245914ef72c66'
            'baaabb28026ba47e3fd56f0138e020c9b3d51e11800a3b220d736fae8e677112'
            '2162a4cf8ae8567b5ddff631474f28b6a0a5d0bce43915396b7dea602e2131e0'
            '13357e81de7ec8d7ad7f9fb37a78c23c4f99c6f7ca67d3a0070eedc388deb938')
noextract=("devkitarm-rules-$_rulesver.tar.xz" "devkitarm-crtls-$_crtlsver.tar.xz"
           "binutils-$_binutilsver.tar.xz" "gcc-$_gccver.tar.xz"
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
    sed 's/ \$hostarchives/ ""/g;s/archives=\"devkitarm.*/echo ""/' -i build-devkit.sh

    # do not build gdb with guile support (broken)
    sed '/gdb/,$ s/--disable-werror/& --with-guile=no/' -i dkarm-eabi/scripts/build-gcc.sh

    # fix search path to use correct tools
    sed 's|$PATH:$TOOLPATH/$package/bin|$TOOLPATH/$package/bin:$PATH|' -i build-devkit.sh

    patch --strip=1 < ../../gdb-and-rules.patch
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
