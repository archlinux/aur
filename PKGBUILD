# Maintainer: Roland <hr_01y@protonmail.com>

pkgname=wine-x64
pkgver=6.3
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs. This only configured with x64 support."
url="http://www.winehq.com"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)


# replacing rc with -rc
# pkgver is not allowed to contain hyphens
_pkgbasever=${pkgver/rc/-rc}

source=(https://dl.winehq.org/wine/source/6.x/wine-$_pkgbasever.tar.xz{,.sign}
        30-win32-aliases.conf)
sha512sums=('20108ea5036d612e8dd61fe9254d67cad02d757ede87174ed27774e4e3537e0d1f4d67156fd430f1d01d5c68b899cb0c7b4be298d897a1ce823913efef822242'
            'c7215c43eff6ff7cf7bab3bf598b95fcab87a8d4ac58d94056c7ffa368c66a71e3a1943902038878d063208c25b910335be6389ac263e04bf9abd57a298a58c1'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb')
validpgpkeys=(DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

provides=("wine_x64=$pkgver")

depends=(
  libx11
  fontconfig
  lcms2
  sdl2
  libxcursor
  libjpeg
  libxslt
  libxrandr
  libxi
  freetype2
  libxinerama
  libxcomposite
  glu
)

makedepends=(
  bison
)

optdepends=(
  v4l-utils
  opencl-headers
  opencl-icd-loader
  libpulse
  gsm
  libgphoto2
  sane
  libcups
  openal
  faudio
  mpg123
  vkd3d
  vulkan-icd-loader
  vulkan-headers
)

conflicts=(
  wine
)

prepare() {

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i wine-$_pkgbasever/configure*

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
    --without-gstreamer \
    --without-hal \
    --without-oss \
    --without-mingw \
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

