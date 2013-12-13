# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=ewebkit
pkgver=159807
pkgrel=1
pkgdesc="WebKit ported to the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://trac.webkit.org/wiki/EFLWebKit"
license=('LGPL2' 'LGPL2.1' 'BSD')
depends=('atk' 'cairo' 'efl' 'e_dbus' 'enchant' 'libtiff'
         'gst-plugins-base-libs' 'libsoup' 'libxslt' 'libxt' 'harfbuzz-icu')
makedepends=('cmake' 'perl' 'python2' 'ruby' 'gperf')
source=("http://download.enlightenment.org/rel/libs/webkit-efl/webkit-efl-$pkgver.tar.xz")
sha256sums=('a99531299e41ba4671b32bbf46c3efc4d65960c9c87949a87f76e622c284f178')

build() {
  cd "$srcdir/webkit-efl"

# build with glib 2.38/libsoup 2.44
  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"
  export CXXFLAGS="$CXXFLAGS -Wno-deprecated-declarations"

  cmake . \
    -DPORT=Efl \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DSHARED_CORE=ON \
    -DENABLE_WEBKIT=ON \
    -DENABLE_WEBKIT2=ON \
    -DENABLE_TOOLS=OFF

  make
}

package() {
  cd "$srcdir/webkit-efl"

  make DESTDIR="$pkgdir" install

# install license files
  install -Dm644 Source/WebCore/LICENSE-APPLE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APPLE"
  install -Dm644 Source/WebCore/LICENSE-LGPL-2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE-LGPL-2"
}
