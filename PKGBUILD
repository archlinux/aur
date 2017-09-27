# $Id: PKGBUILD 294869 2017-04-27 03:06:45Z foutrelis $
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_pkgbasename=webkitgtk
pkgname=lib32-$_pkgbasename
pkgver=2.4.11
pkgrel=10
pkgdesc="Legacy Web content engine for GTK+ 3"
arch=(x86_64)
url="https://webkitgtk.org/"
license=(custom)
depends=(lib32-libxt lib32-libxslt lib32-sqlite lib32-libsoup lib32-libgl lib32-gst-plugins-base-libs
         lib32-libsecret lib32-libwebp lib32-harfbuzz-icu lib32-gtk3)
makedepends=(gcc-multilib gperf gobject-introspection python2 mesa ruby)
# Some headers are used
makedepends+=(gst-plugins-base-libs)
optdepends=('gst-plugins-base: free media decoding'
            'gst-plugins-good: media decoding'
            'gst-libav: nonfree media decoding')
provides=("lib32-webkitgtk3=${pkgver}" "lib32-libwebkit3=${pkgver}")
conflicts=(lib32-webkitgtk3 lib32-libwebkit3)
replaces=(lib32-webkitgtk3 lib32-libwebkit3)

options=(!emptydirs)
install=webkitgtk.install
source=(https://webkitgtk.org/releases/${_pkgbasename}-${pkgver}.tar.xz
        webkitgtk-2.4.9-abs.patch
        icu59.patch)
sha256sums=('588aea051bfbacced27fdfe0335a957dca839ebe36aa548df39c7bbafdb65bf7'
            'ec294bbb5588a1802a68e3615c6718486b22f922645c5fef686d3d103014bf70'
            'eb791b9c8dcb84996904846dedf8c3ddf1a5fde32330177f3f0071510bd8ca6d')

prepare() {
  mkdir -p path
  ln -sf /usr/bin/python2 path/python

  cd ${_pkgbasename}-$pkgver
  patch -Np1 -i ../webkitgtk-2.4.9-abs.patch
  patch -Np1 -i ../icu59.patch
}

build() (
  PATH="$srcdir/path:$PATH"

  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  CC='gcc -m32' \
  CXX='g++ -m32' \
  CXXFLAGS="$CXXFLAGS -fno-delete-null-pointer-checks -Wno-expansion-to-defined" \
  CFLAGS="$CFLAGS -fno-delete-null-pointer-checks -Wno-expansion-to-defined" \
  LDFLAGS="$LDFLAGS -m32" \
  ${_pkgbasename}-$pkgver/configure --prefix=/usr \
    --libdir=/usr/lib32 \
    --libexecdir=/usr/lib32/webkitgtk \
    --enable-introspection \
    --disable-webkit2 \
    --disable-gtk-doc \
    --disable-geolocation \
    --disable-spellcheck \
    --disable-accelerated_compositing
    # Remove the last option when lib32-cairo 1.15.8 is pushed to [multilib]

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make all stamp-po
)

package() {
  # HACK: PKG_CONFIG_PATH is not recorded at ./configure time
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  make -j1 DESTDIR="$pkgdir" install
  install -Dm644 ${_pkgbasename}-$pkgver/Source/WebKit/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
