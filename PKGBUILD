# Maintainer: Roland <hr_01y@protonmail.com>

pkgname=wine-x64
pkgver=4.20
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
sha512sums=('c01af88106b8a808fbceb6ace45882c300656a47913142ba7052283b358d6d5b4379895804e15a2ca1870a4e955ea3ca857ec042a8070ea4ffaefa0c7a84e701'
            '51c961233ec9ad286a0ad1803ae075bc791c7d812a278e5a1129ff5e790f352c185854dc7deb15d33bbafcdcbef2dfc0e08dd796a55004cae70999112995878e'
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

