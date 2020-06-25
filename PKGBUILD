# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=webkit2gtk-unstable
pkgver=2.29.2
pkgrel=1
pkgdesc="GTK Web content engine library"
arch=(x86_64)
url="https://webkitgtk.org/"
license=(custom)
depends=(libxt libxslt enchant gst-plugins-base-libs libsecret libwebp openjpeg2
         harfbuzz-icu gtk3 libnotify hyphen woff2 libwpe wpebackend-fdo
         bubblewrap xdg-dbus-proxy)
makedepends=(gperf gobject-introspection ruby gtk-doc cmake python geoclue ninja)
optdepends=('geoclue: Geolocation support'
            'gst-plugins-base: free media decoding'
            'gst-plugins-good: media decoding'
            'gst-libav: nonfree media decoding')
source=(https://webkitgtk.org/releases/webkitgtk-${pkgver}.tar.xz{,.asc})
sha256sums=('17fa9631a9f7201bdd09e1a5f4f46ae39c1180385b304324c2aa924805087c4d'
            'SKIP')
validpgpkeys=('D7FCF61CF9A2DEAB31D81BD3F3D322D0EC4582C3'
              '5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')

conflicts=(webkit2gtk)
provides=(webkit2gtk)
options=('!emptydirs')

build() {
  cmake -Hwebkitgtk-$pkgver -Bbuild -GNinja \
    -DPORT=GTK \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DENABLE_GTKDOC=ON \
    -DLIBEXEC_INSTALL_DIR=/usr/lib \
    -DLIB_INSTALL_DIR=/usr/lib

  cmake --build build
}

check() {
  : cmake --build build --target tests
}

package() {
  DESTDIR="$pkgdir" cmake --build build --target install

  cd webkitgtk-$pkgver
  find Source -name 'COPYING*' -or -name 'LICENSE*' -print0 | sort -z |
    while IFS= read -d $'\0' -r _f; do
      echo "### $_f ###"
      cat "$_f"
      echo
    done |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
