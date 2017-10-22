# $Id$
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=webkit2gtk-mse
_pkgname=webkit2gtk
pkgver=2.18.1
pkgrel=1
pkgdesc="GTK+ Web content engine library"
arch=(i686 x86_64)
url="https://webkitgtk.org/"
license=(custom)
depends=(libxt libxslt enchant geoclue2 gst-plugins-base-libs gst-plugins-bad
         libsecret libwebp harfbuzz-icu gtk3 libnotify hyphen)
makedepends=(gtk2 gperf gobject-introspection ruby gtk-doc cmake python python2 ninja)
optdepends=('gtk2: Netscape plugin support'
            'gst-plugins-base: free media decoding'
            'gst-plugins-good: media decoding'
            'gst-libav: nonfree media decoding')
source=(https://webkitgtk.org/releases/webkitgtk-${pkgver}.tar.xz{,.asc})
sha256sums=('9cdb7b302fbc8a2a7e1e783b80391e64f8b12d70d6ebad4eb756dd59bf3ed795'
            'SKIP')
validpgpkeys=('D7FCF61CF9A2DEAB31D81BD3F3D322D0EC4582C3')
provides=('webkit2gtk')
conflicts=('webkit2gtk')

prepare() {
  mkdir build
  cd webkitgtk-$pkgver

  sed -i '1s/python$/&2/' Tools/gtk/generate-gtkdoc
  rm -r Source/ThirdParty/gtest/
}

build() {
  cd build
  cmake -G Ninja -DPORT=GTK -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=/usr/lib -DLIBEXEC_INSTALL_DIR=/usr/lib/webkit2gtk-4.0 \
        -DENABLE_GTKDOC=ON -DPYTHON_EXECUTABLE=/usr/bin/python2 -DENABLE_MEDIA_SOURCE=ON ../webkitgtk-$pkgver
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install

  cd ../webkitgtk-$pkgver/Source
  while IFS= read -d $'\0' -r _f; do
    echo "### $_f ###"; cat "$_f"; echo
  done < <(find . -name 'COPYING*' -or -name 'LICENSE*' -print0) \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
