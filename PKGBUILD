# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=ewebkit
pkgver=1.11.0
pkgrel=2
pkgdesc="WebKit ported to the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://trac.webkit.org/wiki/EFLWebKit"
license=('LGPL2' 'LGPL2.1' 'BSD')
depends=('atk' 'cairo' 'efl' 'enchant' 'harfbuzz-icu' 'libsoup' 'libxslt')
makedepends=('cmake' 'perl' 'python2' 'ruby' 'gperf')
source=("http://download.enlightenment.org/rel/libs/webkit-efl/$pkgname-$pkgver.tar.xz")
sha256sums=('d8d21e27f4a21cd77c41914548c184ddb98693ba23851aa66c8e51c0be4b90b7')

prepare() {
# Turn off -Werror, causes too many build failures for things we don't care about
  sed -i '/-Werror/d' $pkgname/Source/cmake/WebKitHelpers.cmake

# Build with glib 2.43+
  sed -i '/^\s\?\+GMutexLocker/ s/GMutexLocker/WebCore::GMutexLocker/' \
    $pkgname/Source/WebCore/platform/graphics/gstreamer/{WebKitWebSourceGStreamer.cpp,MediaPlayerPrivateGStreamerBase.cpp,VideoSinkGStreamer.cpp}
}

build() {
  cd $pkgname

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_TOOLS=OFF

  make
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir" install

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 Source/WebCore/LICENSE-{APPLE,LGPL-2} "$pkgdir/usr/share/licenses/$pkgname/"
}
