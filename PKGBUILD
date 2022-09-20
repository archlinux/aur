# Maintainer: Roland <hr_01y@protonmail.com>

pkgname=wine-x64
pkgver=7.17
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs. This only configured with x64 support."
url="http://www.winehq.com"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)


# replacing rc with -rc
# pkgver is not allowed to contain hyphens
_pkgbasever=${pkgver/rc/-rc}


source=(https://dl.winehq.org/wine/source/7.x/wine-$_pkgbasever.tar.xz{,.sign}
        30-win32-aliases.conf)
sha512sums=('fd8017e6174db0047a3957db3045b2ad9024e07b1e2f81800521f0b7e7f7660add6a08e09bc60e3d140816cec70aae8324fe15643bd05e541f22f66ffda52508'
            'fdde9b576c3e2db8ca12eaa67a2f0c514955bf2a1bbe7af4c075d9b786764b54cbfb8c67bac8ffba5470a664fbe76b178a0d23653ca6196926779a8284b99a0b'
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

