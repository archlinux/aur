# Maintainer: Hugo "ThePooN" Denizart <thepoon@cartooncraft.fr>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-osu
pkgver=3.13
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}

source=(https://dl.winehq.org/wine/source/3.x/wine-$_pkgbasever.tar.xz{,.sign}
        "wine-staging-v$_pkgbasever.tar.gz::https://github.com/wine-staging/wine-staging/archive/v$_pkgbasever.tar.gz"
        harmony-fix.diff
        winealsa_latency.patch
        winepulse_latency.patch)
sha512sums=('a07a3d2a19261f9251f165ca4c14871e6ebda4d3f99da16f9fc41f06e80cae3fb50aeab96628c7a739e635e896dbb31c55df8b42c4637a058f9035c664c93a59'
            'SKIP'
            '0124950cc18d566daecc532a432bce27d712f48eaaa9b37bf930e056b460e30a8fb1806aa179f72b44a95dc56963a3dc063b4acb71affb7b8ddff3001fe59b9a'
            'b86edf07bfc560f403fdfd5a71f97930ee2a4c3f76c92cc1a0dbb2e107be9db3bed3a727a0430d8a049583c63dd11f5d4567fb7aa69b193997c6da241acc4f2e'
            '8212f4ec07045faa28704035ea6c8173ade503afe3bf94c4ec19e9edb788004579bb37e16c58d92ddc23e9a4de52480437f8486a32d794c5edc59d448db46874'
            '3baaddbb91db84407200e6d33110ac8a6c200781b26b8ba269b16e69faa301479769132f981f76316410e78d31abdebfa45509e30b7bd781ab1ed3a0c344ddbe')
validpgpkeys=(5AC1A08B03BD7A313E0A955AF5E6E9EEB9461DD7
              DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

pkgdesc="A compatibility layer for running Windows programs - Staging branch, optimized for audio low latency on osu! (by ThePooN)"
url="https://blog.thepoon.fr/osuLinuxAudioLatency/"
arch=(x86_64)
options=(staticlibs)
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
  gnutls           lib32-gnutls
  libpulse         lib32-libpulse
  desktop-file-utils
)

makedepends=(autoconf ncurses bison perl fontforge flex
  'gcc>=4.5.0-2'
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
  samba
  opencl-headers
)

optdepends=(
  giflib                lib32-giflib
  libpng                lib32-libpng
  libldap               lib32-libldap
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libjpeg-turbo         lib32-libjpeg-turbo
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  ncurses               lib32-ncurses
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  cups
  samba           dosbox
)

prepare() {
  # Allow ccache to work
  mv wine-$_pkgbasever $pkgname

  # apply wine-staging patchset
  pushd wine-staging-$_pkgbasever/patches
  ./patchinstall.sh DESTDIR="$srcdir/$pkgname" --all
  popd
  
  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  patch -d $pkgname -Np1 < harmony-fix.diff

  patch -d $pkgname -Np1 < winealsa_latency.patch
#  patch -d $pkgname -Np1 < winepulse_latency.patch

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i $pkgname/configure*

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-{32,64}-build
}

build() {
  cd "$srcdir"

  msg2 "Building Wine-64..."

  cd "$srcdir/$pkgname-64-build"
  ../$pkgname/configure \
    --prefix=/opt/wine-osu \
    --libdir=/opt/wine-osu/lib \
    --with-x \
    --with-gstreamer \
    --enable-win64 \
    --with-xattr

  make

  msg2 "Building Wine-32..."

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "$srcdir/$pkgname-32-build"
  ../$pkgname/configure \
    --prefix=/opt/wine-osu \
    --with-x \
    --with-gstreamer \
    --with-xattr \
    --libdir=/opt/wine-osu/lib32 \
    --with-wine64="$srcdir/$pkgname-64-build"

  make
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgname-32-build"

  make prefix="$pkgdir/opt/wine-osu" \
    libdir="$pkgdir/opt/wine-osu/lib32" \
    dlldir="$pkgdir/opt/wine-osu/lib32/wine" install

  msg2 "Packaging Wine-64..."
  cd "$srcdir/$pkgname-64-build"
  make prefix="$pkgdir/opt/wine-osu" \
    libdir="$pkgdir/opt/wine-osu/lib" \
    dlldir="$pkgdir/opt/wine-osu/lib/wine" install
}

# vim:set ts=8 sts=2 sw=2 et:
