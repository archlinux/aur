# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Warning: If you are downgrading from the development branch (Wine ≥ 6.1,
# for example), your WINEPREFIX may break and experience unusual bugs.
# Try to make a clean WINEPREFIX, such as by doing “rm -rf ~/.wine”

pkgname=wine-stable
pkgver=6.0.2
pkgrel=2

source=(https://dl.winehq.org/wine/source/6.0/wine-$pkgver.tar.xz{,.sign}
        30-win32-aliases.conf
        wine-binfmt.conf
        0001-ldap-rename-ldap_connect-to-oldap_connect.patch)
b2sums=('176614736055892b7203313edc52e2926807c93b0bb97d59f65fbf284fd9cb138e4555fb7cd5a6c7c867367fdc50c89f12d7360ca0db947a7f04594f35f14775'
        'SKIP'
        '45db34fb35a679dc191b4119603eba37b8008326bd4f7d6bd422fbbb2a74b675bdbc9f0cc6995ed0c564cf088b7ecd9fbe2d06d42ff8a4464828f3c4f188075b'
        'e9de76a32493c601ab32bde28a2c8f8aded12978057159dd9bf35eefbf82f2389a4d5e30170218956101331cf3e7452ae82ad0db6aad623651b0cc2174a61588'
        'b3ca0a31ee21f765a526729560a77a62f9e6a10a8a280d7cc6b5f8950542e99116ad26fcceeeb193bc0db92b85ab7d40da3777875f56b9370309993df1dc9a3e')
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
  mingw-w64-gcc mpg123 ncurses ocl-icd openal opencl-headers perl
  samba sane sdl2 v4l-utils vkd3d vulkan-headers vulkan-icd-loader
  lib32-alsa-lib lib32-giflib lib32-gnutls lib32-gst-plugins-base-libs
  lib32-libcups lib32-libgl lib32-libldap lib32-libpng lib32-libpulse
  lib32-libxcomposite lib32-libxinerama lib32-libxmu lib32-libxslt
  lib32-libxxf86vm lib32-mesa lib32-mpg123 lib32-ncurses lib32-ocl-icd
  lib32-openal lib32-sdl2 lib32-v4l-utils lib32-vkd3d
  lib32-vulkan-icd-loader)

optdepends=(alsa-lib alsa-plugins dosbox giflib gnutls gsm
  gst-plugins-base gst-plugins-base-libs gst-plugins-good libcups
  libgphoto2 libjpeg-turbo libldap libpng libpulse libxcomposite
  libxinerama libxslt mpg123 ncurses ocl-icd openal samba sane sdl2
  v4l-utils vkd3d vulkan-icd-loader lib32-alsa-lib lib32-alsa-plugins
  lib32-giflib lib32-gnutls lib32-gst-plugins-base
  lib32-gst-plugins-base-libs lib32-gst-plugins-good lib32-libcups
  lib32-libjpeg-turbo lib32-libldap lib32-libpng lib32-libpulse
  lib32-libxcomposite lib32-libxinerama lib32-libxslt lib32-mpg123
  lib32-ncurses lib32-ocl-icd lib32-openal lib32-sdl2 lib32-v4l-utils
  lib32-vkd3d lib32-vulkan-icd-loader)

provides=("wine=$pkgver")
conflicts=("wine")

prepare() {
  # Allow ccache to work
  mv wine-$pkgver wine

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
