# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: taotieren <admin@taotieren.com>

pkgname=webkit2gtk-hvml
pkgver=2.34.1
pkgrel=1
pkgdesc="Web content engine for GTK (HVML)"
url="https://hvml.fmsoft.cn/"
arch=(x86_64)
license=(custom)
provides=(${pkgname}  'webkit2gtk')
conflicts=(webkit2gtk)
depends=(cairo fontconfig freetype2 libgcrypt glib2 gtk3 harfbuzz harfbuzz-icu
         icu libjpeg libsoup libxml2 zlib libpng sqlite atk libwebp at-spi2-core
         libegl libgl libgles libwpe wpebackend-fdo libxslt libsecret libtasn1
         enchant libx11 libxext libice libxt wayland libnotify hyphen openjpeg2
         woff2 libsystemd bubblewrap libseccomp xdg-dbus-proxy gstreamer
         gst-plugins-base-libs libmanette)
makedepends=(cmake ninja gtk-doc python ruby gobject-introspection
             wayland-protocols systemd gst-plugins-bad gperf)
optdepends=('geoclue: Geolocation support'
            'gst-plugins-good: media decoding'
            'gst-plugins-bad: media decoding'
            'gst-libav: nonfree media decoding')
# options=(debug)
options=()
source=("https://files.fmsoft.cn/hvml/webkitgtk-2.34.1-hvml-220804.tar.bz2")
sha256sums=('dc6be72b1c974a79f9ceb48a9c5e17221668675603278f05cf6da11521b7746f')


# prepare() {
#   cd webkitgtk-$pkgver
# }

build() {
  # Produce minimal debug info: 4.3 GB of debug data makes the
  # build too slow and is too much to package for debuginfod
  CFLAGS+=' -g1'
  CXXFLAGS+=' -g1'

  cmake -S webkitgtk-$pkgver -B build -G Ninja \
    -DPORT=GTK \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_SOUP2=ON \
    -DENABLE_HVML_ATTRS=ON \
    -DENABLE_GTKDOC=OFF \
    -DENABLE_MINIBROWSER=ON

#   cmake --build build
    ninja -C build
}

package() {
  depends+=(libwpe-1.0.so libWPEBackend-fdo-1.0.so)
  provides+=(libjavascriptcoregtk-4.0.so libwebkit2gtk-4.0.so)

#   DESTDIR="$pkgdir" cmake --install build
    DESTDIR="${pkgdir}" ninja -C build install

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

# vim:set sw=2 et:
