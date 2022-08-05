# -*- mode: shell-script -*-
# Maintainer: Manuel Reimer <mail+wine@m-reimer.de>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-lol
pkgver=7.14
pkgrel=1

# Be sure to use commits from a "ge-lol-XXX" branch here
_gitver=08c12b497c8f4ca2f6dc4f1c0536b087dce25780

# Using VCS source here (git+https...) takes forever so get a snapshot instead
source=($pkgname-$pkgver.tar.gz::https://github.com/GloriousEggroll/wine/archive/$_gitver.tar.gz
        30-win32-aliases.conf)
sha512sums=('3689b907757aff8901f0d27d5cdbbfc230862e711b4687bb16dfa619d9a2ab30cb4565dc75b75a8d88f24a4653085d0504ca17922390bd5b5acd00031a11e156'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb')

pkgdesc="A compatibility layer for running Windows programs - GloriousEggroll custom wine build for running League of Legends"
url="https://github.com/GloriousEggroll/wine"
arch=(x86_64)
options=(staticlibs !lto)
license=(LGPL)

depends=(
  attr             lib32-attr
  fontconfig       lib32-fontconfig
  lcms2            lib32-lcms2
  libxml2          lib32-libxml2
  libxcursor       lib32-libxcursor
  libxrandr        lib32-libxrandr
  libxdamage       lib32-libxdamage
  libxi            lib32-libxi
  gettext          lib32-gettext
  freetype2        lib32-freetype2
  glu              lib32-glu
  libsm            lib32-libsm
  gcc-libs         lib32-gcc-libs
  libpcap          lib32-libpcap
  faudio           lib32-faudio
  desktop-file-utils
)

makedepends=(autoconf bison perl fontforge flex mingw-w64-gcc
  giflib                lib32-giflib
  libpng                lib32-libpng
  gnutls                lib32-gnutls
  libxinerama           lib32-libxinerama
  libxcomposite         lib32-libxcomposite
  libxmu                lib32-libxmu
  libxxf86vm            lib32-libxxf86vm
  libldap               lib32-libldap
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libpulse              lib32-libpulse
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  vkd3d                 lib32-vkd3d
  libcups               lib32-libcups
  sane
  libgphoto2
  gsm
  ffmpeg
  samba
  opencl-headers
)

optdepends=(
  giflib                lib32-giflib
  libpng                lib32-libpng
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libjpeg-turbo         lib32-libjpeg-turbo
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  vkd3d                 lib32-vkd3d
  sane
  libgphoto2
  gsm
  ffmpeg
  cups
  samba           dosbox
)

install=wine.install

prepare() {
  # Allow ccache to work
  mv wine-$_gitver $pkgname

  # Fix opencl header path
  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i $pkgname/configure*

  # Fix openldap 2.5+ detection
  sed 's/-lldap_r/-lldap/' -i $pkgname/configure
}

build() {
  cd "$srcdir"

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-{32,64}-build

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  msg2 "Building Wine-64..."

  cd "$srcdir/$pkgname-64-build"
  ../$pkgname/configure \
    --prefix=/opt/wine-lol \
    --libdir=/opt/wine-lol/lib \
    --with-x \
    --with-gstreamer \
    --enable-win64 \
    --with-xattr

  make

  msg2 "Building Wine-32..."

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "$srcdir/$pkgname-32-build"
  ../$pkgname/configure \
    --prefix=/opt/wine-lol \
    --with-x \
    --with-gstreamer \
    --with-xattr \
    --libdir=/opt/wine-lol/lib32 \
    --with-wine64="$srcdir/$pkgname-64-build"

  make
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgname-32-build"

  make prefix="$pkgdir/opt/wine-lol" \
    libdir="$pkgdir/opt/wine-lol/lib32" \
    dlldir="$pkgdir/opt/wine-lol/lib32/wine" install

  msg2 "Packaging Wine-64..."
  cd "$srcdir/$pkgname-64-build"
  make prefix="$pkgdir/opt/wine-lol" \
    libdir="$pkgdir/opt/wine-lol/lib" \
    dlldir="$pkgdir/opt/wine-lol/lib/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,default}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail/30-wine-lol-win32-aliases.conf"
  ln -s ../conf.avail/30-wine-lol-win32-aliases.conf "$pkgdir/etc/fonts/conf.default/30-wine-lol-win32-aliases.conf"

  i686-w64-mingw32-strip --strip-unneeded "$pkgdir"/opt/wine-lol/lib32/wine/i386-windows/*.dll
  x86_64-w64-mingw32-strip --strip-unneeded "$pkgdir"/opt/wine-lol/lib/wine/x86_64-windows/*.dll
}

# vim:set ts=8 sts=2 sw=2 et:
