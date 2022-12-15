# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=webkit2gtk-unstable
pkgver=2.39.3
pkgrel=1
pkgdesc="GTK Web content engine library"
arch=(x86_64)
url="https://webkitgtk.org/"
license=(custom)
depends=(libxt libxslt enchant gst-plugins-base-libs libmanette libsecret libwebp
         openjpeg2 harfbuzz-icu gtk4 libnotify hyphen woff2 libwpe wpebackend-fdo
         bubblewrap xdg-dbus-proxy libavif libsoup3 libjxl)
makedepends=(gperf gobject-introspection ruby gtk-doc cmake python geoclue ninja gi-docgen unifdef wayland-protocols)
optdepends=('geoclue: Geolocation support'
            'gst-plugins-base: free media decoding'
            'gst-plugins-good: media decoding'
            'gst-libav: nonfree media decoding')
source=(https://webkitgtk.org/releases/webkitgtk-${pkgver}.tar.xz{,.asc})
sha256sums=('6b783704f16f35e72cd6eeb546eaf6d5221ca70e70639f3906def2e9a473bf9b'
            'SKIP')
validpgpkeys=('D7FCF61CF9A2DEAB31D81BD3F3D322D0EC4582C3'
              '5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')

conflicts=(webkit2gtk-5.0)
provides=(webkit2gtk-5.0)
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
    -DUSE_JPEGXL=ON
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
