# Maintainer: Roland <hr_01y@protonmail.com>

pkgname=wine-x64
pkgver=7.7
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
sha512sums=('b0185176a1074ff7331a937a2a5a1f0b865f3e38abbe2fdca841b9f14540497bf941a2aa3bf8dc52d19eb848c68974f3ab47b6d0031cbf4eebc8a76b0b1484be'
            'bff04b7f23297b318c827d1f27e7641aaa3710d123c61da29cd1d123d0921584dbe0563131108a39298ba74919083cc961f1a8d569781a894be78e3477c11d9a'
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

