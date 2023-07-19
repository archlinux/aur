# Maintainer: Roland <hr_01y@protonmail.com>

pkgname=wine-x64
pkgver=8.12
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs. This only configured with x64 support."
url="https://www.winehq.org/"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)


# replacing rc with -rc
# pkgver is not allowed to contain hyphens
_pkgbasever=${pkgver/rc/-rc}


source=(https://dl.winehq.org/wine/source/8.x/wine-$_pkgbasever.tar.xz{,.sign}
        30-win32-aliases.conf)
sha512sums=('6b9eab7ca1ed5a13202b1250d8d95f6bd8ee5176f0c39b5358aedaf28f7f23543f4a73bf0782c3b4e50936813fc2a459582b5d294569c976ace784fbd9e0af1b'
            '3657d1143beed2cdfc87cfc4ce5f829240288cf193be42e2ab6c11a2c165ccb9c760db18f425cf5bae67db3e5ddb4bf7bbccdfe47bdb9ee5a6767503778dcc7a'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb')
validpgpkeys=(DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

provides=("wine_x64=$pkgver")

depends=(
  libx11
  fontconfig
  libxrandr
)

makedepends=(
  bison
  mingw-w64-gcc
)

optdepends=(
  v4l-utils
  opencl-headers
  libpulse
  libgphoto2
  sane
  libcups
  openal
  vkd3d
  ocl-icd
  libxrender
  gst-plugins-base-libs 
  mingw-w64-gcc
  libxcursor
  libxi
  libxext
  libxxf86vm

  libxinerama
  libxcomposite
  mesa
  libpcap
  libusb
  libgudev
  sdl2
)

conflicts=(
  wine
)

prepare() {
  # Get rid of old build dirs
  rm -rf wine-64-build
}

build() {
  msg2 "building wine-$_pkgbasever ..."

  cd wine-$_pkgbasever

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-x \
    --without-oss \
    --enable-win64

  make
}

package() {
  msg2 "packaging wine-$_pkgbasever ..."

  cd wine-$_pkgbasever

  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine" install

  # font aliasing settings
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
}

