# -*- mode: shell-script -*-
# Maintainer: Manuel Reimer <mail+wine@m-reimer.de>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-lol
pkgver=8_27
pkgrel=1
epoch=3

# Be sure to use commits from a "lol-pX-XX" branch here
_gitver=9870f7b23d1dac43324915ac54d784812a8f8e54

# Using VCS source here (git+https...) takes forever so get a snapshot instead
source=("$pkgname-$pkgver.tar.gz::https://github.com/GloriousEggroll/proton-wine/archive/$_gitver.tar.gz"
        30-win32-aliases.conf)
sha512sums=('cb82f8407bfed1728787c83d8023f126c7679b2ff82c5a1ce8049a170126fc4e1f06f03d45a6ab62cda1a1bc724b2c7f073f2f25d1e12cbba65be2035295abda'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb')

pkgdesc="A compatibility layer for running Windows programs - GloriousEggroll custom wine build for running League of Legends"
url="https://github.com/GloriousEggroll/wine-ge-custom"
arch=(x86_64)
options=(staticlibs !lto)
license=(LGPL)

depends=(
  attr             lib32-attr
  fontconfig       lib32-fontconfig
  libxcursor       lib32-libxcursor
  libxrandr        lib32-libxrandr
  libxi            lib32-libxi
  gettext          lib32-gettext
  freetype2        lib32-freetype2
  gcc-libs         lib32-gcc-libs
  libpcap          lib32-libpcap
  desktop-file-utils
)

makedepends=(autoconf bison perl flex mingw-w64-gcc
  giflib                lib32-giflib
  gnutls                lib32-gnutls
  libxinerama           lib32-libxinerama
  libxcomposite         lib32-libxcomposite
  libxxf86vm            lib32-libxxf86vm
  v4l-utils             lib32-v4l-utils
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  libpulse              lib32-libpulse
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  libcups               lib32-libcups
  sane
  libgphoto2
  ffmpeg
  samba
  opencl-headers
)

optdepends=(
  giflib                lib32-giflib
  gnutls                lib32-gnutls
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  opencl-icd-loader     lib32-opencl-icd-loader
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  sane
  libgphoto2
  ffmpeg
  cups
  samba           dosbox
)

install=wine.install

prepare() {
  # Allow ccache to work
  mv proton-wine-$_gitver $pkgname
}

build() {
  cd "$srcdir"

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-{32,64}-build

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  # NOTE: Workaround for "proton 8.0 trees".
  # Without this building gstreamer is not found while building.
  # https://github.com/Frogging-Family/wine-tkg-git/issues/992
  # https://github.com/Frogging-Family/wine-tkg-git/commit/f742de3
  CFLAGS+=" -I/usr/lib32/glib-2.0/include -I/usr/include/glib-2.0 -I/usr/include/gstreamer-1.0 -I/usr/lib32/gstreamer-1.0/include"

  msg2 "Building Wine-64..."

  # NOTE: Tests are broken. Some of the patches applied to "proton-wine" add
  #       partial tests without needed surrounding code.
  #       Add "--disable-tests" to both, 64 and 32 bit, for now.
  cd "$srcdir/$pkgname-64-build"
  ../$pkgname/configure \
    --disable-tests \
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
    --disable-tests \
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
