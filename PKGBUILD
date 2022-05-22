# Maintainer: Roland <hr_01y@protonmail.com>

pkgname=wine-x64
pkgver=7.9
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs. This only configured with x64 support."
url="http://www.winehq.com"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)


# replacing rc with -rc
# pkgver is not allowed to contain hyphens
_pkgbasever=${pkgver/rc/-rc}
_pkgfolder=${pkgver/%[1-9]/x}


source=(https://dl.winehq.org/wine/source/${_pkgfolder}/wine-$_pkgbasever.tar.xz{,.sign}
        30-win32-aliases.conf)
sha512sums=('47ecbb8bc31a06d0f40a63469ffe3df4a1e05c9476a8926ec7f20c2230de8afecb5e0df9f3c5dd238ce3d0323d7cf9c9f48c41ef6ca149822458a4e605a2e029'
            'f02eea3ec3784b233cdab425d4904366c892c5591191ecb62e278e04556558a0511d65ce5c9b89373b4f2412cf77b1002fab913e0839e86a91e242aa21937ae6'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb')
validpgpkeys=(DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

provides=("wine_x64=$pkgver")

depends=(
  libx11
  fontconfig
)

makedepends=(
  bison
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
  libxrandr
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

