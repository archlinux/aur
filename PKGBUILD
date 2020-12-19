# $Id$
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine37
_pkgname=wine
pkgver=3.7
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}

source=(https://dl.winehq.org/wine/source/3.x/$_pkgname-$_pkgbasever.tar.xz{,.sign}
        harmony-fix.diff
        30-win32-aliases.conf
        wine-binfmt.conf)
sha512sums=('a699418574dd8f407c064421cf6cdfe3923562c8adf9a7749e716f3853291eab05358ea64f0217c303c26c0f8f59d2116024b7b6978f9a52a055147e689a8694'
            'SKIP'
            'b86edf07bfc560f403fdfd5a71f97930ee2a4c3f76c92cc1a0dbb2e107be9db3bed3a727a0430d8a049583c63dd11f5d4567fb7aa69b193997c6da241acc4f2e'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
            'bdde7ae015d8a98ba55e84b86dc05aca1d4f8de85be7e4bd6187054bfe4ac83b5a20538945b63fb073caab78022141e9545685e4e3698c97ff173cf30859e285')
validpgpkeys=(5AC1A08B03BD7A313E0A955AF5E6E9EEB9461DD7
              DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

pkgdesc="A compatibility layer for running Windows programs"
url="http://www.winehq.com"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)
depends=(
  fontconfig      lib32-fontconfig
  lcms2           lib32-lcms2
  libxml2         lib32-libxml2
  libxcursor      lib32-libxcursor
  libxrandr       lib32-libxrandr
  libxdamage      lib32-libxdamage
  libxi           lib32-libxi
  gettext         lib32-gettext
  freetype2       lib32-freetype2
  glu             lib32-glu
  libsm           lib32-libsm
  gcc-libs        lib32-gcc-libs
  libpcap         lib32-libpcap
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
  libpulse              lib32-libpulse
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  vulkan-headers
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
  ncurses               lib32-ncurses
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  cups
  samba           dosbox
)
makedepends=(${makedepends[@]} ${depends[@]})
install=wine.install

prepare() {
  # Allow ccache to work
  mv $_pkgname-$_pkgbasever $_pkgname

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  patch -d $_pkgname -Np1 < harmony-fix.diff

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i $_pkgname/configure*

  # Get rid of old build dirs
  rm -rf $_pkgname-{32,64}-build
  mkdir $_pkgname-32-build
}

build() {
  cd "$srcdir"

  msg2 "Building Wine-64..."

  mkdir $_pkgname-64-build
  cd "$srcdir/$_pkgname-64-build"
  CFLAGS="$CFLAGS -fcommon" ../$_pkgname/configure \
    --prefix=/opt/wine37 \
    --libdir=/opt/wine37/lib \
    --with-x \
    --with-gstreamer \
    --enable-win64
  # Gstreamer was disabled for FS#33655

  make

  _wine32opts=(
    --libdir=/opt/wine37/lib32
    --with-wine64="$srcdir/$pkgname-64-build"
  )

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  msg2 "Building Wine-32..."
  cd "$srcdir/$_pkgname-32-build"
  CFLAGS="$CFLAGS -fcommon" ../$pkgname/configure \
    --prefix=/opt/wine37 \
    --with-x \
    --with-gstreamer \
    "${_wine32opts[@]}"

  make
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$_pkgname-32-build"

  make prefix="$pkgdir/opt/wine37" \
    libdir="$pkgdir//lib32" \
    dlldir="$pkgdir/opt/wine37/lib32/wine" install

  msg2 "Packaging Wine-64..."
  cd "$srcdir/$_pkgname-64-build"
  make prefix="$pkgdir/opt/wine37" \
    libdir="$pkgdir/opt/wine37/lib" \
    dlldir="$pkgdir/opt/wine37/lib/wine" install

  # Font aliasing settings for Win32 applications
  #install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  #install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
  #ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
  install -Dm 644 "$srcdir/wine-binfmt.conf" "$pkgdir/opt/wine37/lib/binfmt.d/wine.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
