# Maintainer: Roland <hr_01y@protonmail.com>

pkgname=wine-x64
pkgver=4.18
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs. This only configured with x64 support."
url="http://www.winehq.com"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)


# replacing rc with -rc
# pkgver is not allowed to contain hyphens
_pkgbasever=${pkgver/rc/-rc}

source=(https://dl.winehq.org/wine/source/4.x/wine-$_pkgbasever.tar.xz{,.sign}
        30-win32-aliases.conf)
sha512sums=('794802289fa021092a86c939a3618563ad1523689cdafb6fd58aed06c6a5c867fc5ef0d3dbb2435a65c3eb0d3b982b37e983257a7a7d20c3b6d71df9bf5bf1f1'
            '160a284c09ef6f2bc89759c83625c0806c46fd37bea0b78b6dd966720d5c886480e57eb1407729854339f892fe0d2f980472f2545f17c53a646b0751202616d6'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb')
validpgpkeys=(DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)


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
)

makedepends=()

optdepends=()

makedepends=(${makedepends[@]} ${depends[@]})

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
    --without-capi \
    --without-hal \
    --without-vkd3d \
    --without-vulkan \
    --without-opencl \
    --without-oss \
    --without-faudio \
    --without-gsm \
    --without-pulse \
    --without-mpg123 \
    --without-sane \
    --without-gphoto \
    --without-mingw \
    --without-openal \
    --without-cups \
    --without-v4l2 \
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

