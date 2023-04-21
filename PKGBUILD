# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Warning: If you are downgrading from the development branch (Wine ≥ 8.1,
# for example), your WINEPREFIX may break and experience unusual bugs.
# Try to make a clean WINEPREFIX, such as by doing “rm -rf ~/.wine”

pkgname=wine-stable
_pkgver=8.0.1
pkgver=${_pkgver/-/}  # Useful for wine-stable-next
pkgrel=1

source=(https://dl.winehq.org/wine/source/8.0/wine-$_pkgver.tar.xz{,.sign}
        30-win32-aliases.conf
        wine-binfmt.conf)
b2sums=('f1e04ddc7531704b4229d1bdb6e742ff20886dfff181b8b44e01e9921574e8c433553aaddb2453532902e89252244080d1cf9f904aa7d14d76709d830116e4b4'
        'SKIP'
        '45db34fb35a679dc191b4119603eba37b8008326bd4f7d6bd422fbbb2a74b675bdbc9f0cc6995ed0c564cf088b7ecd9fbe2d06d42ff8a4464828f3c4f188075b'
        'e9de76a32493c601ab32bde28a2c8f8aded12978057159dd9bf35eefbf82f2389a4d5e30170218956101331cf3e7452ae82ad0db6aad623651b0cc2174a61588')
validpgpkeys=(DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

pkgdesc="A compatibility layer for running Windows programs"
url="http://www.winehq.com"
arch=(x86_64)
options=(staticlibs !lto)
license=(LGPL)
install=wine.install

depends=(
  desktop-file-utils
  fontconfig             lib32-fontconfig
  freetype2              lib32-freetype2
  gcc-libs               lib32-gcc-libs
  gettext                lib32-gettext
  glu                    lib32-glu
  libpcap                lib32-libpcap
  libsm                  lib32-libsm
  libxcursor             lib32-libxcursor
  libxdamage             lib32-libxdamage
  libxi                  lib32-libxi
  libxrandr              lib32-libxrandr
)

makedepends=(
  alsa-lib               lib32-alsa-lib
  fontforge
  giflib                 lib32-giflib
  gnutls                 lib32-gnutls
  gst-plugins-base-libs  lib32-gst-plugins-base-libs
  libcups                lib32-libcups
  libgphoto2             lib32-libgphoto2
  libpulse               lib32-libpulse
  libxcomposite          lib32-libxcomposite
  libxinerama            lib32-libxinerama
  libxmu                 lib32-libxmu
  libxxf86vm             lib32-libxxf86vm
  mesa                   lib32-mesa
  mingw-w64-gcc
  ncurses                lib32-ncurses
  ocl-icd                lib32-ocl-icd
  opencl-headers
  perl
  samba
  sane
  sdl2                   lib32-sdl2
  v4l-utils              lib32-v4l-utils
  vulkan-headers
  vulkan-icd-loader      lib32-vulkan-icd-loader
)

optdepends=(
  alsa-lib               lib32-alsa-lib
  alsa-plugins           lib32-alsa-plugins
  dosbox
  giflib                 lib32-giflib
  gnutls                 lib32-gnutls
  gst-plugins-base       lib32-gst-plugins-base
  gst-plugins-base-libs  lib32-gst-plugins-base-libs
  gst-plugins-good       lib32-gst-plugins-good
  libcups                lib32-libcups
  libgphoto2             lib32-libgphoto2
  libpulse               lib32-libpulse
  libxcomposite          lib32-libxcomposite
  libxinerama            lib32-libxinerama
  ncurses                lib32-ncurses
  ocl-icd                lib32-ocl-icd
  samba
  sane
  sdl2                   lib32-sdl2
  v4l-utils              lib32-v4l-utils
  vulkan-icd-loader      lib32-vulkan-icd-loader
  wine-stable-mono
)

provides=(wine=$pkgver)
conflicts=(wine)

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

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i wine/configure*

  # Get rid of old build dirs
  rm -rf wine-{32,64}-build
  mkdir wine-{32,64}-build
}

build() {
  cd "$srcdir/wine-64-build"

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

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
