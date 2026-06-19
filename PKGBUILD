# Maintainer: Max Maisel <max dot maisel at posteo dot de>
# Contributor: anon at sansorgan.es
# Contributor: Sean Anderson <seanga2@gmail.com>
# Contributor: Daniel Bermond <danielbermond@yahoo.com>
# Contributor: Sidney Crestani <sidneycrestani@archlinux.net>
# Contributor: sxe <sxxe@gmx.de>
# Contributor: xiretza <xiretza+aur@gmail.com>
# Contributor: heavysink <winstonwu91 at gmail>

# This wine-valve now no longer confilicts with the default wine installation.
# Replace your regular `wine` command with the wrapper in
# `/opt/wine-valve/wine-valve` to launch an application though `wine-valve`
# from this package.

pkgname=wine-valve
epoch=5
pkgver=11.0.1b5
_pkgver='11.0-1-beta5'
pkgrel=2

source=("https://github.com/ValveSoftware/wine/archive/proton-wine-${_pkgver}.tar.gz"
        '30-win32-aliases.conf'
        'launch-wine-valve.sh')
sha256sums=('dfb54bf898980f080ae1b01f8114241e22d2aabb600c2e3bd28a351290a8c160'
            '9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7'
            'e42c9a226fbaf10075048ab993a15753233ec4222877926b8ec6b6aa6ce14bab')

pkgdesc='A compatibility layer for running Windows programs (Valve version)'
url='https://github.com/ValveSoftware/wine.git'
arch=('x86_64')
options=('staticlibs' '!lto' '!debug')
license=('LGPL')

depends=(
  desktop-file-utils
  fontconfig
  freetype2
  libgcc
  gettext
  glib2
  glibc
  libpcap
  libunwind
  libx11
  libxcursor
  libxext
  libxkbcommon
  libxi
  libxrandr
  lib32-fontconfig
  lib32-freetype2
  lib32-gettext
  lib32-libpcap
  lib32-libxcursor
  lib32-libxi
  lib32-libxrandr
  systemd-libs
  wayland
)
makedepends=(
  alsa-lib
  git
  gnutls
  gst-plugins-base-libs
  libcups
  libgphoto2
  libpulse
  libxcomposite
  libxinerama
  libxml-perl
  libxxf86vm
  lib32-alsa-lib
  lib32-gnutls
  lib32-gst-plugins-base-libs
  lib32-libpulse
  lib32-libxcomposite
  lib32-libxinerama
  lib32-libxxf86vm
  lib32-mesa
  lib32-v4l-utils
  lib32-vulkan-icd-loader
  mesa
  mingw-w64-gcc
  pcsclite
  perl
  samba
  sane
  sdl2
  unixodbc
  v4l-utils
  vulkan-headers
  vulkan-icd-loader
)
optdepends=(
  alsa-lib
  alsa-plugins
  cups
  dosbox
  gnutls
  gst-plugins-bad
  gst-plugins-base
  gst-plugins-base-libs
  gst-plugins-good
  gst-plugins-ugly
  gstreamer
  libgphoto2
  libpulse
  libusb
  libxcomposite
  libxinerama
  lib32-alsa-lib
  lib32-alsa-plugins
  lib32-gnutls
  lin32-gst-plugins-base-libs
  lib32-libpulse
  lib32-libxcomposite
  lib32-libxinerama
  pcsclite
  perl
  samba
  sane
  sdl2
  unixodbc
  v4l-utils
  wine-gecko
  wine-mono
)

makedepends=(${makedepends[@]} ${depends[@]})

prepare() {
  # Get rid of old build dirs
  rm -rf "$pkgname"
  rm -rf $srcdir/$pkgname-{32,64}-build

  # Allow ccache to work
  mv "wine-proton-wine-$_pkgver" "$pkgname"
  cd "$pkgname"

  ./dlls/winevulkan/make_vulkan
  ./tools/make_specfiles

  # Set cross-compilation flags
  export CROSSCFLAGS="-O2 -pipe -g"
  export CROSSCXXFLAGS="-O2 -pipe -g"
  export CROSSLDFLAGS="-Wl,-O1"

  autoreconf -f
  ./tools/make_requests
}

build() {
  msg2 "Building Wine-64..."
  mkdir -p "$pkgname-64-build"
  cd "$pkgname-64-build"

  # * OpenCL fails builing with undefined references
  # * FFMpeg fails building because of a bundled plugin that
  #   needs a different version

  ../$pkgname/configure \
    --prefix=/opt/wine-valve \
    --libdir=/opt/wine-valve/lib \
    --with-x \
    --with-wayland \
    --with-gstreamer \
    --without-opencl \
    --without-ffmpeg \
    --enable-win64 \
    --disable-tests

  make

  cd ..
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  msg2 "Building Wine-32..."
  mkdir -p "$pkgname-32-build"
  cd "$pkgname-32-build"
  ../$pkgname/configure \
    --prefix=/opt/wine-valve \
    --with-x \
    --with-wayland \
    --with-gstreamer \
    --without-opencl \
    --without-ffmpeg \
    --libdir=/opt/wine-valve/lib \
    --with-wine64=$srcdir/$pkgname-64-build \
    --disable-tests

  make
}

package() {
  # (according to the wine wiki, this reverse 32-bit/64-bit packaging order is important)
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgname-32-build"

  make prefix="$pkgdir/opt/wine-valve" \
    libdir="$pkgdir/opt/wine-valve/lib" \
    dlldir="$pkgdir/opt/wine-valve/lib/wine" install

  msg2 "Packaging Wine-64..."
  cd "$srcdir/$pkgname-64-build"

  make prefix="$pkgdir/opt/wine-valve" \
    libdir="$pkgdir/opt/wine-valve/lib" \
    dlldir="$pkgdir/opt/wine-valve/lib/wine" install

  # font aliasing settings for Win32 applications
  msg2 "Packaging Config..."
  install -d "$pkgdir"/opt/wine-valve/etc/fonts/conf.{avail,d}
  install -m644 "${srcdir}/30-win32-aliases.conf" "${pkgdir}/opt/wine-valve/etc/fonts/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf       "${pkgdir}/opt/wine-valve/etc/fonts/conf.d/30-win32-aliases.conf"

  i686-w64-mingw32-strip --strip-unneeded "$pkgdir"/opt/wine-valve/lib/wine/i386-windows/*.dll
  x86_64-w64-mingw32-strip --strip-unneeded "$pkgdir"/opt/wine-valve/lib/wine/x86_64-windows/*.dll

  install -m755 "${srcdir}/launch-wine-valve.sh" "${pkgdir}/opt/wine-valve/wine-valve"
}

# vim:set ts=8 sts=2 sw=2 et:
