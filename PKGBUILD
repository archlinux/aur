# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Warning: If you are downgrading from the development branch (Wine ≥ 5.1,
# for example), your WINEPREFIX may break and experience unusual bugs.
# Try to make a clean WINEPREFIX, such as by doing “rm -rf ~/.wine”

pkgname=wine-stable-next
_pkgver=5.0-rc1
pkgver=${_pkgver/-/}
pkgrel=1

source=(https://dl.winehq.org/wine/source/5.0/wine-$_pkgver.tar.xz{,.sign}
        30-win32-aliases.conf
        wine-binfmt.conf)
sha512sums=('43877cd200e951ffe0e61c3877f140b9c95da835c114b5c8ba5f39e85f4950fa3704fd39a13dd36c73461d81bc668f92dc2c45feca0974d80fd41d7ba5d5c7b0'
            'SKIP'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
            'bdde7ae015d8a98ba55e84b86dc05aca1d4f8de85be7e4bd6187054bfe4ac83b5a20538945b63fb073caab78022141e9545685e4e3698c97ff173cf30859e285')
validpgpkeys=(DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

pkgdesc="A compatibility layer for running Windows programs"
url="http://www.winehq.com"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)
install=wine.install

depends=(desktop-file-utils faudio fontconfig freetype2 glu lcms2
  libpcap libsm libxcursor libxdamage libxi libxml2 libxrandr
  lib32-faudio lib32-fontconfig lib32-freetype2 lib32-gcc-libs
  lib32-gettext lib32-glu lib32-lcms2 lib32-libpcap lib32-libsm
  lib32-libxcursor lib32-libxdamage lib32-libxi lib32-libxml2
  lib32-libxrandr)

makedepends=(alsa-lib fontforge giflib gnutls gsm
  gst-plugins-base-libs libcups libgl libgphoto2 libldap libpng
  libpulse libxcomposite libxinerama libxmu libxslt libxxf86vm mesa
  mpg123 ncurses ocl-icd openal opencl-headers perl samba sane sdl2
  v4l-utils vkd3d vulkan-headers vulkan-icd-loader lib32-alsa-lib
  lib32-giflib lib32-gnutls lib32-gst-plugins-base-libs lib32-libcups
  lib32-libgl lib32-libldap lib32-libpng lib32-libpulse
  lib32-libxcomposite lib32-libxinerama lib32-libxmu lib32-libxslt
  lib32-libxxf86vm lib32-mesa lib32-mpg123 lib32-ncurses lib32-ocl-icd
  lib32-openal lib32-sdl2 lib32-v4l-utils lib32-vkd3d
  lib32-vulkan-icd-loader)

optdepends=(alsa-lib alsa-plugins dosbox giflib gnutls gsm
  gst-plugins-base-libs libcups libgphoto2 libjpeg-turbo libldap
  libpng libpulse libxcomposite libxinerama libxslt mpg123 ncurses
  ocl-icd openal samba sane sdl2 v4l-utils vkd3d vulkan-icd-loader
  lib32-alsa-lib lib32-alsa-plugins lib32-giflib lib32-gnutls
  lib32-gst-plugins-base-libs lib32-libcups lib32-libjpeg-turbo
  lib32-libldap lib32-libpng lib32-libpulse lib32-libxcomposite
  lib32-libxinerama lib32-libxslt lib32-mpg123 lib32-ncurses
  lib32-ocl-icd lib32-openal lib32-sdl2 lib32-v4l-utils lib32-vkd3d
  lib32-vulkan-icd-loader)

provides=("wine=$pkgver" "wine-stable=$pkgver")
conflicts=("wine" "wine-stable")

prepare() {
  # Allow ccache to work
  mv wine-$_pkgver wine

  for patch in *.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -d wine -p1 -i "../$patch"
    fi
  done

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i wine/configure*

  # Get rid of old build dirs
  rm -rf wine-{32,64}-build
  mkdir wine-{32,64}-build
}

build() {
  cd "$srcdir/wine-64-build"
  ../wine/configure \
      --prefix=/usr \
      --libdir=/usr/lib \
      --with-x \
      --with-gstreamer \
      --enable-win64

  make

  _wine32opts=(
    --libdir=/usr/lib32
    --with-wine64="$srcdir/wine-64-build"
  )

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "$srcdir/wine-32-build"
  ../wine/configure \
      --prefix=/usr \
      --with-x \
      --with-gstreamer \
      "${_wine32opts[@]}"

  make
}

package() {
  cd "$srcdir/wine-32-build"

  make STRIP=true prefix="$pkgdir/usr" \
       libdir="$pkgdir/usr/lib32" \
       dlldir="$pkgdir/usr/lib32/wine" install

  cd "$srcdir/wine-64-build"
  make STRIP=true prefix="$pkgdir/usr" \
       libdir="$pkgdir/usr/lib" \
       dlldir="$pkgdir/usr/lib/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf \
     "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
  install -Dm644 "$srcdir/wine-binfmt.conf" \
     "$pkgdir/usr/share/wine/binfmt/wine.conf"
}
