# Maintainer: Roland <hr_01y@protonmail.com>

pkgname=wine-x64
pkgver=5.0
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs. This only configured with x64 support."
url="http://www.winehq.com"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)


# replacing rc with -rc
# pkgver is not allowed to contain hyphens
_pkgbasever=${pkgver/rc/-rc}

source=(https://dl.winehq.org/wine/source/5.0/wine-$_pkgbasever.tar.xz{,.sign}
        30-win32-aliases.conf)
sha512sums=('681de951804c3dd3ae8c677a0ea52d172b04cac58594698b191cd972b25899cd2030d01a25fc2ad2eb6b99976a30319d2bd5ba8b7ff98b1a8b43832fa6514b83'
            'fad666dc0a0906ff1724e8fe9c7cfecd9f654d83c00ebd0b745b2086d1452f08394dec8ea3bbacb5378b6c0b84caa306cb3e037bd83012ff27b9374a11487932'
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
  libxinerama
  libxcomposite
  glu
)

makedepends=()

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

