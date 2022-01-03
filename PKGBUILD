# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Warning: If you are downgrading from the development branch (Wine ≥ 7.1,
# for example), your WINEPREFIX may break and experience unusual bugs.
# Try to make a clean WINEPREFIX, such as by doing “rm -rf ~/.wine”

pkgname=wine-stable-next
_pkgver=7.0-rc4
pkgver=${_pkgver/-/}
pkgrel=1

source=(https://dl.winehq.org/wine/source/7.0/wine-$_pkgver.tar.xz{,.sign}
        30-win32-aliases.conf
        wine-binfmt.conf)
b2sums=('1a12e8afe5c711770284a526348bb0cbd362cd3963550b1eb1c8f7cefed7353224d948a641983741916768cc4a694ba0c68d8f131fca76ecd0f5604f474aa542'
        'SKIP'
        '45db34fb35a679dc191b4119603eba37b8008326bd4f7d6bd422fbbb2a74b675bdbc9f0cc6995ed0c564cf088b7ecd9fbe2d06d42ff8a4464828f3c4f188075b'
        'e9de76a32493c601ab32bde28a2c8f8aded12978057159dd9bf35eefbf82f2389a4d5e30170218956101331cf3e7452ae82ad0db6aad623651b0cc2174a61588')
validpgpkeys=(DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

pkgdesc="A compatibility layer for running Windows programs"
url="http://www.winehq.com"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)
install=wine.install

depends=(
  desktop-file-utils
  faudio                 lib32-faudio
  fontconfig             lib32-fontconfig
  freetype2              lib32-freetype2
  gcc-libs               lib32-gcc-libs
  gettext                lib32-gettext
  glu                    lib32-glu
  lcms2                  lib32-lcms2
  libpcap                lib32-libpcap
  libsm                  lib32-libsm
  libxcursor             lib32-libxcursor
  libxdamage             lib32-libxdamage
  libxi                  lib32-libxi
  libxml2                lib32-libxml2
  libxrandr              lib32-libxrandr
)

makedepends=(
  alsa-lib               lib32-alsa-lib
  fontforge
  giflib                 lib32-giflib
  gnutls                 lib32-gnutls
  gsm                    lib32-gsm
  gst-plugins-base-libs  lib32-gst-plugins-base-libs
  libcups                lib32-libcups
  libgphoto2             lib32-libgphoto2
  libjpeg-turbo          lib32-libjpeg-turbo
  libldap                lib32-libldap
  libpng                 lib32-libpng
  libpulse               lib32-libpulse
  libxcomposite          lib32-libxcomposite
  libxinerama            lib32-libxinerama
  libxmu                 lib32-libxmu
  libxslt                lib32-libxslt
  libxxf86vm             lib32-libxxf86vm
  mesa                   lib32-mesa
  mingw-w64-gcc
  mpg123                 lib32-mpg123
  ncurses                lib32-ncurses
  ocl-icd                lib32-ocl-icd
  openal                 lib32-openal
  opencl-headers
  perl
  samba
  sane
  sdl2                   lib32-sdl2
  v4l-utils              lib32-v4l-utils
  vkd3d                  lib32-vkd3d
  vulkan-headers
  vulkan-icd-loader      lib32-vulkan-icd-loader
)

optdepends=(
  alsa-lib               lib32-alsa-lib
  alsa-plugins           lib32-alsa-plugins
  dosbox
  giflib                 lib32-giflib
  gnutls                 lib32-gnutls
  gsm                    lib32-gsm
  gst-plugins-base       lib32-gst-plugins-base
  gst-plugins-base-libs  lib32-gst-plugins-base-libs
  gst-plugins-good       lib32-gst-plugins-good
  libcups                lib32-libcups
  libgphoto2             lib32-libgphoto2
  libjpeg-turbo          lib32-libjpeg-turbo
  libldap                lib32-libldap
  libpng                 lib32-libpng
  libpulse               lib32-libpulse
  libxcomposite          lib32-libxcomposite
  libxinerama            lib32-libxinerama
  libxslt                lib32-libxslt
  mpg123                 lib32-mpg123
  ncurses                lib32-ncurses
  ocl-icd                lib32-ocl-icd
  openal                 lib32-openal
  samba
  sane
  sdl2                   lib32-sdl2
  v4l-utils              lib32-v4l-utils
  vkd3d                  lib32-vkd3d
  vulkan-icd-loader      lib32-vulkan-icd-loader
  wine-mono
)

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

  # Fix openldap 2.5+ detection
  sed 's/-lldap_r/-lldap/' -i wine/configure

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
