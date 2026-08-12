# Maintainer: sun2nic
# Based on the wine-cachyos AUR package maintained by loathingkernel.
# MR rebase: https://gitlab.winehq.org/wine/wine/-/merge_requests/10060

pkgname=wine-cachyos-mr10060
_pkgsrc=wine-cachyos
_srctag=10.0-20260425
pkgver=${_srctag//-/.}
pkgrel=1
epoch=2
pkgdesc="Wine with CachyOS patches and XDG Desktop Portal file dialogs (Wine MR !10060)"
url="https://github.com/CachyOS/wine-cachyos"
arch=(x86_64)
license=(LGPL-2.1-or-later)
options=(!staticlibs !lto !debug pestrip)
install=wine.install

_geckover=2.47.4
_monover=10.4.1
_xaliaver=0.4.8
_patchver=10.0.20260425

depends=(
  attr
  dbus
  desktop-file-utils
  fontconfig
  freetype2
  gettext
  glib2
  glibc
  libgcc
  libpcap
  libunwind
  libx11
  libxcursor
  libxext
  libxi
  libxkbcommon
  libxrandr
  systemd-libs
  wayland
)
makedepends=(
  alsa-lib
  ffmpeg
  git
  gnutls
  gst-plugins-base-libs
  libcups
  libgphoto2
  libpulse
  libva
  libxcomposite
  libxinerama
  libxxf86vm
  mesa
  mingw-w64-gcc
  opencl-headers
  ocl-icd
  pcsclite
  perl
  python
  samba
  sane
  sdl2-compat
  unixodbc
  unzip
  v4l-utils
  vulkan-headers
  vulkan-icd-loader
)
optdepends=(
  'xdg-desktop-portal: XDG desktop portal service for the patched file dialogs'
  'alsa-lib: ALSA audio support'
  'alsa-plugins: additional ALSA formats and output'
  'cups: printing support'
  'dosbox: MS-DOS application support'
  'ffmpeg: audio and video codecs'
  'gnutls: encrypted communications support'
  'gst-plugins-bad: additional GStreamer codecs'
  'gst-plugins-base: basic GStreamer codecs'
  'gst-plugins-base-libs: basic GStreamer libraries'
  'gst-plugins-good: additional GStreamer codecs'
  'gst-plugins-ugly: additional GStreamer codecs'
  'gstreamer: multimedia support'
  'libgphoto2: digital camera support'
  'libpulse: PulseAudio support'
  'libusb: USB device support'
  'libva: hardware video acceleration'
  'libxcomposite: X11 compositing support'
  'libxinerama: multihead X11 support'
  'ocl-icd: OpenCL support'
  'pcsclite: smart card support'
  'perl: Winemaker support'
  'samba: SMB support'
  'sane: scanner support'
  'sdl2-compat: SDL support'
  'unixodbc: ODBC support'
  'v4l-utils: video capture support'
  'vulkan-icd-loader: Vulkan support'
)
provides=(
  "wine=10.0"
  "wine-cachyos=$pkgver"
  wine-mono
  wine-gecko
)
conflicts=(wine wine-cachyos wine-mono wine-gecko)

source=(
  "${_pkgsrc}::git+https://github.com/CachyOS/wine-cachyos.git#tag=cachyos-${_srctag}-wine"
  "https://dl.winehq.org/wine/wine-gecko/${_geckover}/wine-gecko-${_geckover}-x86.tar.xz"
  "https://dl.winehq.org/wine/wine-gecko/${_geckover}/wine-gecko-${_geckover}-x86_64.tar.xz"
  "https://github.com/madewokherd/wine-mono/releases/download/wine-mono-${_monover}/wine-mono-${_monover}-x86.tar.xz"
  "https://github.com/madewokherd/xalia/releases/download/xalia-${_xaliaver}/xalia-${_xaliaver}-net48-mono.zip"
  "mr10060-wine-cachyos-${_patchver}.patch"
  30-win32-aliases.conf
  wine-binfmt.conf
  ntsync.conf
)
noextract=("xalia-${_xaliaver}-net48-mono.zip")
b2sums=(
  '0b3f2fcc68b5f1922f4bd3381f9affdd985b06759ed9402a3685659ccc693b615842a5b70317aa98341871fa942263442ba539f33bfe6cbfd7f0db53c7b05778'
  '2a73c12585b502ae11188482cbc9fb1f45f95bfe4383a7615011104b132f4845f9813d01fb40277e1934fab5f1b35ab40b4f4a66a9967463dd1d666a666904e9'
  '62856a88266b4757602c0646e024f832974a93f03b9df253fd4895d4f11a41b435840ad8f7003ec85a0d8087dec15f2e096dbfb4b01ebe4d365521e48fd0c5c0'
  '9ca53dee272470806432c61587080e6dc04fd9eaafde4f55f5d57d5557ec6859d77a74b74c9e3f472da04b8ace9609f0927573faab368a25249c76b3e37e65c1'
  '0780740dd2f07de5c00e0c8d1823bc24e31954d6ccb7875678957aea5e095d5eb8dc13ea9cc56a00abfccdcad59e21150e49fe515815f50e0bd38b50f6ec940c'
  '40412a84d76363fc22ad583e4ee901262db809cb95b1e338cb70d899e29512ab40e8212c29fdef39b9241cc241104abadba3a70e2b713bcea47f5b3255bee197'
  '45db34fb35a679dc191b4119603eba37b8008326bd4f7d6bd422fbbb2a74b675bdbc9f0cc6995ed0c564cf088b7ecd9fbe2d06d42ff8a4464828f3c4f188075b'
  'e9de76a32493c601ab32bde28a2c8f8aded12978057159dd9bf35eefbf82f2389a4d5e30170218956101331cf3e7452ae82ad0db6aad623651b0cc2174a61588'
  '964a3ba277821e570aec2127f0d1ae9898da6976c360deb6b196345a50bd3c2c55cb399527507006d8fddef868069032a30b083f23987d5050f185c74dd9de35'
)

prepare() {
  local _builddir="${_pkgsrc}-64-build"

  rm -rf "$srcdir/$_builddir"
  mkdir "$srcdir/$_builddir"

  cd "$srcdir/$_pkgsrc"
  git apply --check "$srcdir/mr10060-wine-cachyos-${_patchver}.patch"
  git apply "$srcdir/mr10060-wine-cachyos-${_patchver}.patch"

  git config user.email "wine@cachyos.org"
  git config user.name "wine cachyos"
  git tag "wine-${_srctag}" --annotate -m "$pkgver" --force
  ./tools/make_requests
  ./tools/make_specfiles
  ./dlls/winevulkan/make_vulkan -x vk.xml -X video.xml
  autoreconf -fiv
  rm -rf autom4te.cache
}

build() {
  local -a split=($CFLAGS)
  local -A flags
  local opt
  for opt in "${split[@]}"; do flags["${opt%%=*}"]="${opt##*=}"; done

  local march="${flags["-march"]:-nocona}"
  local mtune="${flags["-mtune"]:-core-avx2}"
  local optimize_flags="-O2 -march=$march -mtune=$mtune -mfpmath=sse -pipe"
  optimize_flags+=" -mno-avx -mno-avx2 -mno-avx512f -fvect-cost-model=cheap -fipa-pta"
  local sanity_flags="-fwrapv -fno-strict-aliasing -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
  local debug_flags="-ffunction-sections -fdata-sections -fno-omit-frame-pointer"
  local warning_flags="-Wno-incompatible-pointer-types"
  local strip_flags="-s"
  local common_flags="$optimize_flags $sanity_flags $debug_flags $warning_flags $strip_flags"
  local common_ldflags="-Wl,-O1,--sort-common,--as-needed"

  export LDFLAGS="$common_ldflags"
  export CROSSLDFLAGS="$common_ldflags -Wl,--file-alignment,4096"
  export CFLAGS="$common_flags -mcmodel=small"
  export CXXFLAGS="$common_flags -mcmodel=small -std=c++17"
  export CROSSCFLAGS="$common_flags"
  export CROSSCXXFLAGS="$common_flags -std=c++17"
  export PKG_CONFIG_PATH="/usr/lib/pkgconfig:/usr/share/pkgconfig"

  cd "$srcdir/${_pkgsrc}-64-build"
  "../$_pkgsrc/configure" \
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
    --enable-archs=x86_64,i386 \
    --enable-build-id

  make
}

package() {
  cd "$srcdir/${_pkgsrc}-64-build"
  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine" install

  install -d "$pkgdir"/usr/share/fontconfig/conf.{avail,default}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/usr/share/fontconfig/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/usr/share/fontconfig/conf.default/30-win32-aliases.conf"
  install -Dm644 "$srcdir/wine-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf"

  i686-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib/wine/i386-windows/*.{dll,exe,cpl}
  x86_64-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib/wine/x86_64-windows/*.{dll,exe,cpl}

  install -Dm644 "$srcdir/ntsync.conf" "$pkgdir/usr/lib/modules-load.d/10-$pkgname.conf"

  install -d -m755 "$pkgdir/usr/share/wine/gecko"
  cp -dr --no-preserve=ownership "$srcdir"/wine-gecko-${_geckover}-x86{,_64} "$pkgdir/usr/share/wine/gecko/"

  install -d -m755 "$pkgdir/usr/share/wine/mono"
  cp -ra --no-preserve=ownership "$srcdir/wine-mono-${_monover}" "$pkgdir/usr/share/wine/mono/"

  install -d -m755 "$pkgdir/usr/share/xalia"
  unzip "$srcdir/xalia-${_xaliaver}-net48-mono.zip" -d "$pkgdir/usr/share/xalia"
  chmod -R go-w "$pkgdir/usr/share/xalia"
}

# vim:set ts=8 sts=2 sw=2 et:
