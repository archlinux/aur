# Maintainer: Roland <hr_01y@protonmail.com>

pkgname=wine-x64
pkgver=7.10
pkgrel=2
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
sha512sums=('be460be6c3f6f54c20220287a7c4c9d41d27bd14fabb97b1f9824a4be361e38b2e2e51a621e0332d6c48934b1af425efaec92132f73e6d1270337ffbfcac2576'
            '31552691927675a3e92f1bc01367ec6fc032044fbf7c799985256bb5352793480a3be709b5e7d8959c0f7a108d5598353fc0fc4ff4aefc83b2bb0764e7a856c2'
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

