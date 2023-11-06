# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=webkit2gtk-unstable
pkgver=2.42.1
pkgrel=1
pkgdesc="GTK Web content engine library"
arch=(x86_64)
url="https://webkitgtk.org/"
license=(custom)
depends=(at-spi2-core
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
  gtk3
  harfbuzz
  harfbuzz-icu
  hyphen
  icu
  libavif
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
  libsoup
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
optdepends=('geoclue: Geolocation support'
            'gst-plugins-base: free media decoding'
            'gst-plugins-good: media decoding'
            'gst-libav: nonfree media decoding')
source=(https://webkitgtk.org/releases/webkitgtk-${pkgver}.tar.xz{,.asc})
sha256sums=('6f41fac9989d3ee51c08c48de1d439cdeddecbc757e34b6180987d99b16d2499'
            'SKIP')
validpgpkeys=('D7FCF61CF9A2DEAB31D81BD3F3D322D0EC4582C3'
              '5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')

conflicts=(webkitgtk-6.0)
provides=(webkitgtk-6.0)
replaces=(webkitgtk-6.0)
options=('!emptydirs')

build() {
  cmake -S webkitgtk-$pkgver -B build -G Ninja \
    -DPORT=GTK \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=/usr/lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_GTK4=ON \
    -DUSE_SOUP2=OFF \
    -DUSE_AVIF=ON \
    -DUSE_JPEGXL=ON \
    -DENABLE_WEB_RTC=ON \
    -DUSE_GSTREAMER_WEBRTC=ON
  cmake --build build
}

check() {
  cd webkitgtk-$pkgver
  : cmake --build build --target tests
}

package() {
  depends+=(libwpe-1.0.so libWPEBackend-fdo-1.0.so)
  provides+=(libjavascriptcoregtk-4.1.so libwebkit2gtk-4.1.so)

  DESTDIR="$pkgdir" cmake --install build

  rm -r "$pkgdir/usr/bin"

  cd webkitgtk-$pkgver
  find Source -name 'COPYING*' -or -name 'LICENSE*' -print0 | sort -z |
    while IFS= read -d $'\0' -r _f; do
      echo "### $_f ###"
      cat "$_f"
      echo
    done |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
