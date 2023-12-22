# Maintainer:
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_gitname="webkit2gtk"
_pkgname="$_gitname-unstable"
pkgname="$_pkgname"
pkgver=2.43.3
pkgrel=1
pkgdesc="Web content engine for GTK"
url="https://webkitgtk.org/"
license=(custom)
arch=(x86_64)

depends=(
  at-spi2-core
  atk
  bubblewrap
  cairo
  enchant
  fontconfig
  freetype2
  glib2
  gst-plugins-bad-libs
  gst-plugins-base-libs
  gstreamer
  gtk4
  harfbuzz
  harfbuzz-icu
  hyphen
  icu
  libavif
  libbacktrace
  libdrm
  libegl
  libepoxy
  libgcrypt
  libgl
  libgles
  libjpeg
  libjxl
  libmanette
  libpng
  libseccomp
  libsecret
  libsoup3
  libsystemd
  libtasn1
  libwebp
  libwpe
  libx11
  libxcomposite
  libxml2
  libxslt
  libxt
  mesa
  openjpeg2
  sqlite
  wayland
  woff2
  wpebackend-fdo
  xdg-dbus-proxy
  zlib
)
makedepends=(
  clang
  cmake
  gi-docgen
  gobject-introspection
  gperf
  gst-plugins-bad
  lld
  ninja
  python
  ruby
  systemd
  unifdef
  wayland-protocols
)
optdepends=(
  'geoclue: Geolocation support'
  'gst-libav: nonfree media decoding'
  'gst-plugins-bad: media decoding'
  'gst-plugins-good: media decoding'
)

options=('!emptydirs')

_pkgsrc="webkitgtk-$pkgver"
source=(
  "$url/releases/$_pkgsrc.tar.xz"{,.asc}
  "GTK-Disable-DMABuf-renderer-for-NVIDIA-proprietary-drivers.patch"
)
sha256sums=(
  '738564bf3af6d96af91b644c84f7c5aaf499fdefddc435a2734fa7f2d45adb09'
  'SKIP'
  'e315919f2901e6eea70f6d29bccd22be7d76b5109f3f2487385b405911878f8f'
)

validpgpkeys=(
  'D7FCF61CF9A2DEAB31D81BD3F3D322D0EC4582C3'  # Carlos Garcia Campos <cgarcia@igalia.com>
  '5AA3BC334FD7E3369E7C77B291C559DBE4C9123B'  # Adrián Pérez de Castro <aperez@igalia.com>
)

conflicts=(webkitgtk-6.0)
provides=(webkitgtk-6.0)

prepare() {
  cd "$_pkgsrc"

  # https://bugs.archlinux.org/task/79783
  # https://github.com/WebKit/WebKit/pull/18614
  patch -Np1 -F100 -i ../GTK-Disable-DMABuf-renderer-for-NVIDIA-proprietary-drivers.patch
}

build() {
  local cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DPORT=GTK
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -DCMAKE_INSTALL_LIBEXECDIR=lib
    -DCMAKE_SKIP_RPATH=ON
    -DUSE_AVIF=ON
    -DUSE_GTK4=ON
    -DENABLE_MINIBROWSER=ON
    -DENABLE_DOCUMENTATION=ON

    -DENABLE_WEB_RTC=ON
    -DUSE_GSTREAMER_WEBRTC=ON
    -DUSE_JPEGXL=ON
  )

  # GCC with LTO fails to link libjavascriptcoregtk
  #     /usr/bin/ld: /tmp/ccXxyWZV.ltrans0.ltrans.o: in function `ipint_table_size_validate':
  #     <artificial>:(.text+0x49f0f): undefined reference to `ipint_extern_table_size'
  #     /usr/bin/ld: /tmp/ccXxyWZV.ltrans0.ltrans.o: in function `ipint_table_fill_validate':
  #     <artificial>:(.text+0x4a019): undefined reference to `ipint_extern_table_fill'
  #     collect2: error: ld returned 1 exit status
  export CC=clang CXX=clang++
  export LDFLAGS+=" -fuse-ld=lld"

  # Produce minimal debug info: 4.3 GB of debug data makes the
  # build too slow and is too much to package for debuginfod
  export CFLAGS+=' -g1'
  export CXXFLAGS+=' -g1'

  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  cd "$_pkgsrc"
  : cmake --build build --target tests
}

package() {
  depends+=(
    libWPEBackend-fdo-1.0.so
    libwpe-1.0.so
  )
  provides+=(
    libjavascriptcoregtk-6.0.so
    libwebkitgtk-6.0.so
  )

  DESTDIR="$pkgdir" cmake --install build

  cd "$_pkgsrc"
  find Source -name 'COPYING*' -or -name 'LICENSE*' -print0 | sort -z |
    while IFS= read -d $'\0' -r _f; do
      echo "### $_f ###"
      cat "$_f"
      echo
    done |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
