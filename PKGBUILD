# $Id$
# Contributor: Eric Bélanger <eric@archlinux.org>
# Maintainer: Adria Arrufat <adria.arrufat@protonmail.ch>

pkgname=webkit2gtk-unstable
pkgver=2.17.3
pkgrel=1
pkgdesc="GTK+ Web content engine library"
arch=('i686' 'x86_64')
url="http://webkitgtk.org/"
license=('custom')
depends=(libxt libxslt enchant geoclue2 gst-plugins-base-libs
	 libsecret libwebp harfbuzz-icu gtk3 libnotify hyphen)
makedepends=(gtk2 gperf gobject-introspection ruby gtk-doc cmake python python2 ninja)
optdepends=('gtk2: Netscape plugin support'
            'gst-plugins-base: free media decoding'
            'gst-plugins-good: media decoding'
            'gst-libav: nonfree media decoding')
options=(!emptydirs)
source=(https://webkitgtk.org/releases/webkitgtk-${pkgver}.tar.xz{,.asc})
sha1sums=('defd4e5c06d3f277e4e0c194de359adb564b9864')
sha256sums=('79f168c30953dbd273f984d3cc85482169e6822fcf7cf0031c86cf8aa1816b35')
validpgpkeys=('D7FCF61CF9A2DEAB31D81BD3F3D322D0EC4582C3')

source=(http://webkitgtk.org/releases/webkitgtk-${pkgver}.tar.xz)

prepare() {
  [ -d build ] && rm -rf build 
  mkdir build

  cd webkitgtk-$pkgver
  sed -i '1s/python$/&2/' Tools/gtk/generate-gtkdoc
  rm -r Source/ThirdParty/gtest/
}

build() {
  cd build
  cmake -DPORT=GTK -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=/usr/lib -DLIBEXEC_INSTALL_DIR=/usr/lib/webkit2gtk-4.0 \
        -DENABLE_GTKDOC=ON -DPYTHON_EXECUTABLE=/usr/bin/python2 ../webkitgtk-$pkgver \
	-G Ninja
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install

  install -m755 -d "$pkgdir/usr/share/licenses/webkit2gtk-unstable"
  cd "$srcdir/webkitgtk-$pkgver/Source"
  for f in $(find -name 'COPYING*' -or -name 'LICENSE*'); do
    echo $f >> "$pkgdir/usr/share/licenses/webkit2gtk-unstable/LICENSE"
    cat $f >> "$pkgdir/usr/share/licenses/webkit2gtk-unstable/LICENSE"
    echo "" >> "$pkgdir/usr/share/licenses/webkit2gtk-unstable/LICENSE"
  done
}
