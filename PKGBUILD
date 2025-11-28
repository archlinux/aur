# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-cachyos
_srctag=10.0-20251126
pkgver=${_srctag//-/.}
_geckover=2.47.4
_monover=10.3.0
_xaliaver=0.4.6
pkgrel=1
epoch=2

_pkgbasever=${pkgver/rc/-rc}
_winever=$_pkgbasever
#_winever=${_pkgbasever%.*}

source=(wine-cachyos::git+https://github.com/CachyOS/wine-cachyos.git#tag=cachyos-${_srctag}-wine
        https://dl.winehq.org/wine/wine-gecko/${_geckover}/wine-gecko-${_geckover}-x86{,_64}.tar.xz
        https://github.com/madewokherd/wine-mono/releases/download/wine-mono-${_monover}/wine-mono-${_monover}-x86.tar.xz
        https://github.com/madewokherd/xalia/releases/download/xalia-${_xaliaver}/xalia-${_xaliaver}-net48-mono.zip
        30-win32-aliases.conf
        wine-binfmt.conf)
source+=(
)
noextract=(
    xalia-${_xaliaver}-net48-mono.zip
)
validpgpkeys=(5AC1A08B03BD7A313E0A955AF5E6E9EEB9461DD7
              DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

pkgdesc="A compatibility layer for running Windows programs, with extra CachyOS flavour"
url="https://github.com/CachyOS/wine-cachyos"
arch=(x86_64 x86_64_v3)
options=(!staticlibs !lto !debug)
license=(LGPL-2.1-or-later)
depends=(
  attr            lib32-attr
  desktop-file-utils
  fontconfig      lib32-fontconfig
  freetype2       lib32-freetype2
  gcc-libs        lib32-gcc-libs
  gettext         lib32-gettext
  libpcap         lib32-libpcap
  libunwind       lib32-libunwind
  libxcursor      lib32-libxcursor
  libxkbcommon    lib32-libxkbcommon
  libxi           lib32-libxi
  libxrandr       lib32-libxrandr
  wayland         lib32-wayland
)
makedepends=(
  alsa-lib              lib32-alsa-lib
  ffmpeg
  git
  gnutls                lib32-gnutls
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  libcups               lib32-libcups
  libgphoto2
  libpulse              lib32-libpulse
  libva                 lib32-libva
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  libxxf86vm            lib32-libxxf86vm
  mesa                  lib32-mesa
  mingw-w64-gcc
  opencl-headers
  opencl-icd-loader     lib32-opencl-icd-loader
  pcsclite              lib32-pcsclite
  perl
  python
  samba
  sane
  sdl2                  lib32-sdl2
  unixodbc
  unzip
  v4l-utils             lib32-v4l-utils
  vulkan-headers
  vulkan-icd-loader     lib32-vulkan-icd-loader
)
optdepends=(
  alsa-lib              lib32-alsa-lib
  alsa-plugins          lib32-alsa-plugins
  cups                  lib32-libcups
  dosbox
  ffmpeg
  gnutls                lib32-gnutls
  gst-plugins-bad
  gst-plugins-base      lib32-gst-plugins-base
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  gst-plugins-good      lib32-gst-plugins-good
  gst-plugins-ugly
  libgphoto2
  libpulse              lib32-libpulse
  libva                 lib32-libva
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  opencl-icd-loader     lib32-opencl-icd-loader
  pcsclite              lib32-pcsclite
  samba
  sane
  sdl2                  lib32-sdl2
  unixodbc
  v4l-utils             lib32-v4l-utils
  vulkan-icd-loader     lib32-vulkan-icd-loader
)
optdepends+=(
  ntsync-common
  NTSYNC-MODULE
)
provides=("wine=10.0" 'wine-mono' 'wine-gecko')
conflicts=('wine' 'wine-mono' 'wine-gecko')
install=wine.install

prepare() {
  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-{32,64}-build

  cd $pkgname
  git config user.email "wine@cachyos.org"
  git config user.name "wine cachyos"
  git tag wine-${_srctag} --annotate -m "$pkgver" --force
  ./tools/make_requests
  ./tools/make_specfiles
  ./dlls/winevulkan/make_vulkan -x vk.xml -X video.xml
  autoreconf -fiv
  rm -rf autom4te.cache
}

build() {

  local -a split=($CFLAGS)
  local -A flags
  for opt in "${split[@]}"; do flags["${opt%%=*}"]="${opt##*=}"; done
  local march="${flags["-march"]:-nocona}"
  local mtune="${flags["-mtune"]:-core-avx2}"

  # From Proton
  OPTIMIZE_FLAGS="-O2 -march=$march -mtune=$mtune -mfpmath=sse -pipe"
  OPTIMIZE_FLAGS+=" -mprefer-avx128 -fvect-cost-model=cheap -fipa-pta"
  SANITY_FLAGS="-fwrapv -fno-strict-aliasing -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
  DEBUG_FLAGS="-ffunction-sections -fdata-sections -fno-omit-frame-pointer"
  WARNING_FLAGS="-Wno-incompatible-pointer-types"
  STRIP_FLAGS="-s"
  COMMON_FLAGS="$OPTIMIZE_FLAGS $SANITY_FLAGS $DEBUG_FLAGS $WARNING_FLAGS $STRIP_FLAGS"
  #LTO_CFLAGS="-fuse-linker-plugin -fdevirtualize-at-ltrans -flto-partition=one -flto -Wl,-flto"

  COMMON_LDFLAGS="-Wl,-O1,--sort-common,--as-needed"
  #LTO_LDFLAGS="$LTO_CFLAGS"

  # Disable assertions
  #export CPPFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0 -DNDEBUG -D_NDEBUG"

  export LDFLAGS="$COMMON_LDFLAGS $LTO_LDFLAGS"
  export CROSSLDFLAGS="$COMMON_LDFLAGS -Wl,--file-alignment,4096"

  export CFLAGS="$COMMON_FLAGS -mcmodel=small $LTO_CFLAGS"
  export CXXFLAGS="$COMMON_FLAGS -mcmodel=small -std=c++17 $LTO_CFLAGS"
  export CROSSCFLAGS="$COMMON_FLAGS -mcmodel=small"
  export CROSSCXXFLAGS="$COMMON_FLAGS -mcmodel=small -std=c++17"
  export PKG_CONFIG_PATH="/usr/lib/pkgconfig:/usr/share/pkgconfig"
  cd "$srcdir/$pkgname-64-build"
  ../$pkgname/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-x \
    --with-wayland \
    --with-gstreamer \
    --with-freetype \
    --with-mingw \
    --with-alsa \
    --with-ffmpeg \
    --without-oss \
    --disable-lsteamclient \
    --disable-tests \
    --enable-win64

  make

  export CFLAGS="$COMMON_FLAGS -mstackrealign $LTO_CFLAGS"
  export CXXFLAGS="$COMMON_FLAGS -mstackrealign -std=c++17 $LTO_CFLAGS"
  export CROSSCFLAGS="$COMMON_FLAGS -mstackrealign"
  export CROSSCXXFLAGS="$COMMON_FLAGS -mstackrealign -std=c++17"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig:/usr/share/pkgconfig"
  cd "$srcdir/$pkgname-32-build"
  ../$pkgname/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-x \
    --with-wayland \
    --with-gstreamer \
    --with-freetype \
    --with-mingw \
    --with-alsa \
    --without-ffmpeg \
    --without-oss \
    --disable-lsteamclient \
    --disable-tests \
    --with-wine64="$srcdir/$pkgname-64-build"

  make
}

package() {
  cd "$srcdir/$pkgname-32-build"
  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine" install

  cd "$srcdir/$pkgname-64-build"
  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/usr/share/fontconfig/conf.{avail,default}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/usr/share/fontconfig/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/usr/share/fontconfig/conf.default/30-win32-aliases.conf"
  install -Dm 644 "$srcdir/wine-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf"

  i686-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib/wine/i386-windows/*.{dll,exe}
  x86_64-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib/wine/x86_64-windows/*.{dll,exe}


  # Install wine-gecko
  cd "$srcdir"
  install -d -m755 "$pkgdir"/usr/share/wine/gecko/
  cp -dr --no-preserve='ownership' wine-gecko-${_geckover}-x86{,_64} "$pkgdir"/usr/share/wine/gecko/

  # Install wine-mono
  cd "$srcdir"
  install -d -m755 "$pkgdir"/usr/share/wine/mono
  cp -r -a --no-preserve='ownership' wine-mono-${_monover} "$pkgdir"/usr/share/wine/mono

  # Install xalia
  cd "$srcdir"
  install -d -m755 "$pkgdir"/usr/share/xalia
  unzip xalia-${_xaliaver}-net48-mono.zip -d "$pkgdir"/usr/share/xalia
}

# vim:set ts=8 sts=2 sw=2 et:
b2sums=('da063120716e9f4c5914b3e67df4cc258d7c85b5a593c493835896cd403691b3503b24ed763b90a8e09837f408b6d2f0fb353091d3ea657fdce401e3cd5c0d24'
        '2a73c12585b502ae11188482cbc9fb1f45f95bfe4383a7615011104b132f4845f9813d01fb40277e1934fab5f1b35ab40b4f4a66a9967463dd1d666a666904e9'
        '62856a88266b4757602c0646e024f832974a93f03b9df253fd4895d4f11a41b435840ad8f7003ec85a0d8087dec15f2e096dbfb4b01ebe4d365521e48fd0c5c0'
        'a3a63b1e8cf072923512923ccd7419fbdb4c9747b0a3c29111d2bda36ab1fd95d0fd4283f74126cfe0c60e639ce3d173d69efdb3d97bf2b39142eb3ed3a27ef7'
        '4d30eea9306392790677a4e19f7e416a387aaf10c4a7681aa8fcd94faf07be81a984b28ba1437428d7c215c5ecdbba70993091547068fbdc224e809c3f7abd85'
        '45db34fb35a679dc191b4119603eba37b8008326bd4f7d6bd422fbbb2a74b675bdbc9f0cc6995ed0c564cf088b7ecd9fbe2d06d42ff8a4464828f3c4f188075b'
        'e9de76a32493c601ab32bde28a2c8f8aded12978057159dd9bf35eefbf82f2389a4d5e30170218956101331cf3e7452ae82ad0db6aad623651b0cc2174a61588')
